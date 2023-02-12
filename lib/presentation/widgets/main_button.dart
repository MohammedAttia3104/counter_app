import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.textState,required this.onPressed})
      : super(key: key);
  final String textState;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Text(
          textState,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
