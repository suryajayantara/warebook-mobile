class RegexTypeExp {
  /* 

      REGEX => Regular Expresion

  
  */
  // New Regex Added
  static final emailType = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final phoneType = RegExp(r"^\+?0[0-9]{10}$");
  static final nameRegExp =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
}
