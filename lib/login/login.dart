import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../backend/apiservice.dart';
import '../other/translations.dart';

void load(ApiService apiService) async {
  try {
    await apiService.downloadPosts(apiService.cidade);
  } catch (e) {
    print('Erro ao transferir os posts: $e');
  }
}

/*class GooogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}*/

class LoginPage extends StatefulWidget {
  final ApiService api;

  LoginPage({super.key, required this.api});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController novaPasswordController = TextEditingController();
  final TextEditingController confirmarNovaController = TextEditingController();
  SharedPreferences? prefs;
  int? mudouPassword = 0;
  bool rememberMe = false;
  bool passwordValida = false;

  void initState() {
    super.initState();
    setState(() {
      _checkLoginStatus();
    });
  }

  //------------------------------------Controlo da password--------------------------//

  Future<void> _checkPasswordUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? mudouPassword = prefs.getInt('mudoupassword');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mudouPassword == 0 || mudouPassword == null) {
        _mostrarPopupMudarSenha();
      }
    });
  }

  void _mostrarPopupMudarSenha() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Translations.translate(context, 'alter_password')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: novaPasswordController,
                decoration: InputDecoration(
                    hintText: Translations.translate(context, 'new_password')),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmarNovaController,
                decoration: InputDecoration(
                    hintText: Translations.translate(
                        context, 'confirm_new_password')),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (novaPasswordController.text ==
                    confirmarNovaController.text) {
                  try {
                    bool atualizou = await widget.api
                        .updatePassword(novaPasswordController.text);
                    if (atualizou) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove('isLoggedIn');
                      await prefs.remove('cidade');
                      await prefs.remove('nomeColaborador');

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Palavra-Passe alterada com sucesso!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Ocorreu um erro ao alterar a palavra-passe. Tente novamente.')),
                      );
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Erro ao alterar a palavra-passe. Tente novamente.')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Palavras-passe diferentes')),
                  );
                }
              },
              child: const Text("Confirmar!"),
            ),
          ],
        );
      },
    );
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? rememberme = prefs.getBool('rememberMe');
    int? cidade = prefs.getInt('cidade');

    if (rememberme == true && cidade != null) {
      try {
        print("Erro antes de transferir posts");
        await widget.api.downloadPosts(cidade);
        print("Posts transferidos com sucesso com lembrarme");

        if (mounted) {
          Navigator.pushReplacementNamed(context, '/welcomescreen');
        }
      } catch (e) {
        print('Erro ao transferir os posts: $e');
      }
    } else {
      print("Usuário não está logado ou cidade não encontrada.");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color backgroundColor = theme.brightness == Brightness.dark
        ? Colors.grey[900]!
        : Colors.grey[100]!;
    final Color textColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final Color hintColor =
        theme.brightness == Brightness.dark ? Colors.white54 : Colors.black54;


    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100.0,
                margin: const EdgeInsets.only(top: 40.0),
                alignment: Alignment.center,
                child: Text(
                  'SoftShares',
                  style: TextStyle(
                    color: theme.primaryColor, // Using theme color
                    fontSize: 45,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35.0),
                child: Text(
                  Translations.translate(context, 'login'),
                  style: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColor), // Using theme color
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(top: 60.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: Translations.translate(context, 'email'),
                    filled: true,
                    fillColor: theme.brightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.email_outlined, color: textColor),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: Translations.translate(context, 'password'),
                    filled: true,
                    fillColor: theme.brightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock_outline, color: textColor),
                    hintStyle:
                        TextStyle(color: hintColor), // Dynamic hint color
                  ),
                  obscureText: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: textColor,
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          child: Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                              activeColor: theme.primaryColor),
                        ),
                        Text(
                          Translations.translate(context, 'remember_me'),
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor, // Dynamic text color
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recoverpassword');
                    },
                    child: Text(
                      Translations.translate(context, 'recover_password'),
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.primaryColor, // Dynamic text color
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text(Translations.translate(context, 'login'),
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 15.0),
                      child: Divider(
                        color: theme.dividerColor,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                  Text(Translations.translate(context, 'continue_with')),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: theme.dividerColor,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'images/googleicon.png',
                  height: 23,
                  width: 23,
                ),
                label: Text(
                    Translations.translate(context, 'login_with_google'),
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // For light button background
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'images/facebookicon.png',
                  height: 23,
                  width: 23,
                ),
                label: Text(
                    Translations.translate(context, 'login_with_facebook'),
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // For light button background
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    Translations.translate(context, 'want_to_create_account'),
                    style: TextStyle(fontSize: 14, color: textColor),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registerpage');
                    },
                    child: Text(
                      Translations.translate(context, 'register'),
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(0, 179, 255, 1.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    try {
      int IDColaborador = await widget.api.loginUserOnBackend(emailController.text, passwordController.text);

      if (IDColaborador != 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        mudouPassword = await prefs.getInt('mudoupassword');

        if (mudouPassword == 1) {
          String? nomeColaborador = await widget.api.nomeColaborador;
          await prefs.setInt('IDColaborador', IDColaborador);
          await prefs.setString('nomeColaborador', nomeColaborador ?? '');
          await prefs.setBool('rememberMe', rememberMe);

          if (rememberMe) {
            await prefs.setBool('rememberMe', true);
          } else {
            await prefs.remove('isLoggedIn');
          }

          if (mounted) {
            Navigator.pushReplacementNamed(context, '/welcomescreen');
          }
        } else {
          _checkPasswordUpdate();
        }
      } else {
        _showErrorDialog('Credenciais erradas, tente novamente!');
      }
    } catch (e) {
      _handleLoginError(e);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de autenticação!'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleLoginError(Object e) {
    String errorMessage = 'Erro no processo de autenticação: $e';

    if (e.toString().contains('utilizador-não-encontrado')) {
      errorMessage =
          'Não foi encontrado nenhum utilizador com essas credenciais.';
    } else if (e.toString().contains('Palavra-Passe inválida')) {
      errorMessage = 'Palavra-Passe inválida, tente novamente';
    }

    _showErrorDialog(errorMessage);
  }
}