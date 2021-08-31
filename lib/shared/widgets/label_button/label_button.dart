import 'package:flutter/material.dart';
import 'package:payflow_flutterapp/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const LabelButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyles.buttonHeading,
          )),
    );
  }
}
