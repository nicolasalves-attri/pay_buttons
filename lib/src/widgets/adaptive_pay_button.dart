part of pay_buttons;

class AdaptivePayButton extends StatelessWidget {
  const AdaptivePayButton({
    Key? key,
    required this.applePayButton,
    required this.googlePayButton,
  }) : super(key: key);

  /// Apple Pay button to show
  final ApplePayButton applePayButton;

  /// Google Pay button to show
  final GooglePayButton googlePayButton;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) return applePayButton;
    if (defaultTargetPlatform == TargetPlatform.android) return googlePayButton;

    return const SizedBox.shrink();
  }
}
