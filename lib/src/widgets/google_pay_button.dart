part of pay_buttons;

/// {@macro raw_google_pay_button}
class GooglePayButton extends StatelessWidget {
  /// {@template raw_google_pay_button}
  /// Raw button without Google Pay processing logic
  /// {@endtemplate}
  const GooglePayButton({
    Key? key,
    this.onPressed,
    this.style = GooglePayButtonStyle.black,
    this.type = GooglePayButtonType.pay,
  }) : super(key: key);

  /// Minimum Raw Button Width
  static const double minimumButtonWidth = 80;

  /// Default Raw Button Height
  static const double defaultButtonHeight = 36;

  static const String _defaultLocale = 'en';
  static const List<String> _supportedLocales = <String>[
    _defaultLocale,
    'ar',
    'bg',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'es',
    'et',
    'fi',
    'fr',
    'hr',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nl',
    'no',
    'pl',
    'pt',
    'ru',
    'sk',
    'sl',
    'sr',
    'sv',
    'th',
    'tr',
    'uk',
    'zh'
  ];

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// [Button style](https://developers.google.com/pay/api/web/guides/brand-guidelines#style
  final GooglePayButtonStyle style;

  /// Button type
  final GooglePayButtonType type;

  String _assetPath(BuildContext context) {
    final String assetName = '${type.asset}_${style.assetSuffix}.svg';
    if (<GooglePayButtonType>[
      GooglePayButtonType.plain,
      GooglePayButtonType.buy,
    ].contains(type)) {
      return 'assets/$assetName';
    }

    final String? langCode = Localizations.maybeLocaleOf(context)?.languageCode;
    final String? supportedLangCode = _supportedLocales.contains(langCode) ? langCode : _defaultLocale;

    return 'assets/$supportedLangCode/$assetName';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultButtonHeight,
      child: RawMaterialButton(
        fillColor: style == GooglePayButtonStyle.black ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: style == GooglePayButtonStyle.flat
              ? const BorderSide(
                  color: Color(0xFFDEDEDE),
                  width: 2,
                )
              : BorderSide.none,
        ),
        child: SvgPicture.asset(
          _assetPath(context),
          package: 'pay_buttons',
          semanticsLabel: 'Pagar com Google Pay',
          // height: 19,
        ),
      ),
    );
  }
}
