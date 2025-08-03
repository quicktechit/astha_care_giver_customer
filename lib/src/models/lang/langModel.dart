class Language {
  String lCode;
  String cCode;
  String englishName;
  String localName;
  bool selected;

  Language(
    this.lCode,
    this.cCode,
    this.englishName,
    this.localName, {
    this.selected = false,
  });

  // static List<Language> languagesList() {
  //   return <Language>[
  //     Language("en", "English", "English",
  //         "assets/images/united-states-of-america.png"),
  //     Language(
  //         "ar", "Arabic", "العربية", "assets/images/united-arab-emirates.png"),
  //     Language("es", "Spanish", "Spana", "assets/images/spain.png"),
  //     Language("fr", "French (France)", "Français - France",
  //         "assets/images/france.png"),
  //     Language("fr_CA", "French (Canada)", "Français - Canadien",
  //         "assets/images/canada.png"),
  //     Language("pt_BR", "Portugese (Brazil)", "Brazilian",
  //         "assets/images/brazil.png"),
  //     Language("ko", "Korean", "Korean",
  //         "assets/images/united-states-of-america.png"),
  //   ];
  // }
}

class LanguagesList {
  List<Language>? _languages;

  LanguagesList() {
    this._languages = [
      Language("en", "US", "ENGLISH", ""),
      Language("bn", "BN", "বাংলা", ""),

      // Language("es", "ES", "Spanish", "Spana", "assets/images/spain.png"),
      // Language("fr", "FR", "French (France)", "Français - France",
      //     "assets/images/france.png"),
      // Language("fr", "CA", "French (Canada)", "Français - Canadien",
      //     "assets/images/canada.png"),
      // Language("pt", "BR", "Portugese (Brazil)", "Brazilian",
      //     "assets/images/brazil.png"),
      // Language("ko", "KP", "Korean", "Korean",
      //     "assets/images/united-states-of-america.png"),
    ];
  }

  List<Language> get languages => _languages!;
}
