import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool isActive;
  final Function() onPressed;
  final Widget child;

  OptionButton({
    required this.onPressed,
    required this.child,
    this.isActive = false,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(Size(90, 45)),
      fillColor: isActive ? Colors.grey : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
