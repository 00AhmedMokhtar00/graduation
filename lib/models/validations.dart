class Validations{

  static String nameValidation(String value){
    if(value.isEmpty){
      return 'please enter a name';
    }
    if(value.length < 3){
      return 'The minimun name length is 3';
    }
    return null;
  }

  static String emailValidation(String value){
    if(value.isEmpty){
      return 'please enter a username';
    }
    if(!value.contains('@') || !value.endsWith('.com') || value.length < 7 || value[value.length - 1 - 4] == '@'){
      return 'please enter a valid email address';
    }
    return null;
  }

  static String passwordValidation(String value){
    if(value.isEmpty){
      return 'please enter a password';
    }
    if(value.length < 6){
      return 'The minimun password length is 6';
    }
    return null;
  }

  static String confirmPasswordValidation(String confirmed, String original){
    if(confirmed != original){
      return 'The password is not the same as original';
    }
    return null;
  }

  static String mobileValidation(String value){
    if(value.contains(' ') || value.length < 8){
      return 'Please enter a valid mobile number';
    }
    return null;
  }
}