part of pay_buttons;

/// [Button style](https://developers.google.com/pay/api/web/guides/brand-guidelines#style)
enum GooglePayButtonStyle {
  /// Black
  black,

  /// White
  white,

  /// Flat
  flat,
}

extension _GooglePayButtonStyleX on GooglePayButtonStyle {
  static const String _defaultAssetSuffix = 'dark';

  String get assetSuffix =>
      <GooglePayButtonStyle, String>{
        GooglePayButtonStyle.black: _defaultAssetSuffix,
        GooglePayButtonStyle.white: 'light',
        GooglePayButtonStyle.flat: 'light',
      }[this] ??
      _defaultAssetSuffix;
}
