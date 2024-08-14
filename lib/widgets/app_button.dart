import 'package:flutter/material.dart';
import 'package:suitmedia_test_application/widgets/colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double roundness;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final Widget? trailingWidget;
  final Function? onPressed;

  const AppButton({
    super.key,
    required this.label,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    this.trailingWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          onPressed?.call();
        },
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundness),
          ),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          textStyle: TextStyle(
            color: Colors.white,
            fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
            fontWeight: fontWeight,
          ),
          padding: padding,
          minimumSize: const Size.fromHeight(50),
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.whiteGrey,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (trailingWidget != null)
              Positioned(
                top: 0,
                right: 25,
                child: trailingWidget!,
              ),
          ],
        ),
      ),
    );
  }
}
