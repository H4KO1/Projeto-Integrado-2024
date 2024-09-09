import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locale.dart';

class Translations {
  static final Map<String, Map<String, String>> _localizedValues = {
    'pt': {
      'morning': 'Bom Dia',
      'afternoon': 'Boa Tarde',
      'night': 'Boa Noite',
      'settings': 'Definições',
      'dark_mode': 'Modo Escuro',
      'choose_language': 'Idiomas',
      'logout_confirmation': 'Pretende terminar a sua sessão?',
      'continue': 'Continuar',
      'confirm': 'Confirmar',
      'cancel': 'Cancelar',
      'logout': 'Sair',
      'login': 'Entrar',
      'email': 'Email',
      'password': 'Palavra-Passe',
      'remember_me': 'Lembrar-me',
      'recover_password': 'Recuperar Palavra-Passe',
      'continue_with': 'Continuar Com',
      'login_with_google': 'Entrar com Google',
      'login_with_facebook': 'Entrar com Facebook',
      'want_to_create_account': 'Ainda não tem conta?',
      'register': 'Registe-se!',
      'recover_of_password': 'Recuperação da Palavra-Passe',
      'remembered_password': 'Lembrou-se da sua palavra-passe?',
      'insert_code': 'Inserir Código',
      'code': 'Código',
      'new_password': 'Nova Palavra-Passe',
      'confirm_new_password': 'Confirme a Palavra-Passe',
      'register_page': 'Registar',
      'name': 'Nome',
      'city': 'cidade',
      'already_have_an_account': 'Já tem conta?',
      'looking_for': 'O que procura?',
      'filters': 'Filtros',
      'no_post_to_show': 'Não existem publicações disponíveis',
      'create_event': 'Criar Evento',
      'create_space': 'Criar Espaço',
      'calendar': 'Calendário',
      'category': 'Categoria',
      'subcategory': 'Sub-Categoria',
      'choose_category_first': 'Selecione uma categoria primeiro',
      'title': 'Título',
      'insert_title': 'Inserir o título',
      'description': 'Descrição',
      'insert_description': 'Insira uma descrição',
      'image': 'Imagem',
      'insert_image': 'Clique para selecionar uma imagem',
      'option': 'Opção',
      'create': 'Criar',
      'website': 'Website',
      'coordinates': 'Coordenadas',
      'map': 'Mapa',
      'rating': 'Avaliação',
      'views': 'Visualizações',
      'published_by': 'Publicado por:',
      'comments': 'Comentários',
      'add_comment': 'Adicione um comentário',
      'comment': 'Comentar',
      'alter_password': 'Alterar Palavra-Passe',
      'portuguese': 'Português',
      'english': 'Inglês',
      'spanish': 'Espanhol',
      'selected_date': 'Selecione uma data',
      'date': 'Data'
      
    },
    'en': {
      'morning': 'Good Morning',
      'afternoon': 'Good Afternoon',
      'night': 'Good Night',
      'settings': 'Settings',
      'dark_mode': 'Dark Mode',
      'choose_language': 'Choose language',
      'logout_confirmation': 'You sure you want to logout?',
      'continue': 'Continue',
      'confirm': 'Confirm',
      'cancel': 'Cancel',
      'logout': 'Logout',
      'login': 'Login',
      'email': 'E-mail',
      'password': 'Password',
      'remember_me': 'Remember me',
      'recover_password': 'Recover Password',
      'continue_with': 'Continue with',
      'login_with_google': 'Login with Google',
      'login_with_facebook': 'Login with Facebook',
      'want_to_create_account': 'Want to create an account?',
      'register': 'Register!',
      'recover_of_password': 'Recover Of Password',
      'remembered_password': 'Remembered password',
      'insert_code': 'Insert Code',
      'code': 'Code',
      'new_password': 'New Password',
      'confirm_new_password': 'Confirm New Password',
      'register_page': 'Register',
      'name': 'Name',
      'city': 'City',
      'already_have_an_account': 'Already have an account?',
      'looking_for': 'What do you want to look for?',
      'filters': 'Filters',
      'no_post_to_show': 'No posts available',
      'create_event': 'Create Event',
      'create_space': 'Create Space',
      'calendar': 'Calendar',
      'category': 'Category',
      'subcategory': 'SubCategory',
      'choose_category_first': 'Choose a category first',
      'title': 'Title',
      'insert_title': 'Write a title',
      'description': 'Description',
      'insert_description': 'Write a description',
      'image': 'Image',
      'insert_image': 'Click to insert an image',
      'option': 'Option',
      'create': 'Create',
      'website': 'Website',
      'coordinates': 'Coordinates',
      'map': 'Map',
      'rating': 'Rating',
      'views': 'Views',
      'published_by': 'Published by:',
      'comments': 'Comments',
      'add_comment': 'Add a comment',
      'comment': 'Comment',
      'alter_password': 'Change Your Password',
      'portuguese': 'Portuguese',
      'english': 'English',
      'spanish': 'Spanish',
      'date': 'Date',
      'selected_date': 'Select a date',
    },
    'es': {
      'morning': 'Buenos Dias',
      'afternoon': 'Buenas Tardes',
      'night': 'Buenas Noches',
      'settings': 'Configuraciones',
      'dark_mode': 'Modo Oscuro',
      'choose_language': 'Elegir Idioma',
      'logout_confirmation': '¿Quieres cerrar sesión?',
      'continue': 'Continuar',
      'confirm': 'Confirmar',
      'cancel': 'Cancelar',
      'logout': 'Cerrar sesión',
      'login': 'Iniciar sesión',
      'email': 'Correo Electrónico',
      'password': 'Contraseña',
      'remember_me': 'Recuérdame',
      'recover_password': 'Recuperar Contraseña',
      'continue_with': 'Continuar con',
      'login_with_google': 'Iniciar sesión con Google',
      'login_with_facebook': 'Iniciar sesión con Facebook',
      'want_to_create_account': '¿Aún no tienes una cuenta?',
      'register': '¡Registro!',
      'recover_of_password': 'Recuperación de contraseña',
      'remembered_password': '¿Recordaste tu contraseña?',
      'insert_code': 'Insertar código',
      'code': 'Código',
      'new_password': 'Nueva contraseña',
      'confirm_new_password': 'Confirmar contraseña',
      'register_page': 'Registro',
      'name': 'Nombre',
      'city': 'Ciudad',
      'already_have_an_account': '¿Ya tienes una cuenta?',
      'looking_for': '¿Qué estás buscando?',
      'filters': 'Filtros',
      'no_post_to_show': 'No hay publicaciones disponibles.',
      'create_event': 'Crear evento',
      'create_space': 'Crear espacio',
      'calendar': 'Calendario',
      'category': 'Categoría',
      'subcategory': 'Subcategoría',
      'choose_category_first': 'Seleccione una categoría primero',
      'title': 'Titulo',
      'insert_title': 'Escribe el titulo',
      'description': 'Descripción',
      'insert_description': 'Escribe una descripción',
      'image': 'Imagen',
      'insert_image': 'Haga clic para seleccionar una imagen',
      'option': 'Opción',
      'create': 'Crear',
      'website': 'Website',
      'coordinates': 'Coordenadas',
      'map': 'Mapa',
      'rating': 'Evaluación',
      'views': 'Visualizaciones',
      'published_by': 'Publicado por:',
      'comments': 'Comentarios',
      'add_comment': 'Añadir un comentario',
      'comment': 'Comentario',
      'alter_password': 'Cambiar Contraseña',
      'portuguese': 'Portugués',
      'english': 'Inglés',
      'spanish': 'Español',
      'date': 'Fecha',
      'selected_date': 'Seleccione una fecha',
    },
  };

  static String translate(BuildContext context, String key) {
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);
    String languageCode = localeProvider.locale.languageCode;

    return _localizedValues[languageCode]?[key] ?? key;
  }
}
