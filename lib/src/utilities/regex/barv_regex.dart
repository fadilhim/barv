class BarvRegex {
  static final alphabetNumericalCharacterOnly =
  RegExp('[A-Za-z0-9#+-.`~!@#%^&*()_+={}:;|/?.<>*"\$[]\']'); // []'\$

  static final email = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );

  static final noEmoji = RegExp(
    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
  );

  static final noWhitespace = RegExp(r'\s');
}
