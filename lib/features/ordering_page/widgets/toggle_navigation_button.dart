import 'package:flutter/material.dart';

class ToggleNavigationButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final void Function() onPressed;

  const ToggleNavigationButton({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          style: BorderStyle.none,
        ),
        backgroundColor:
            isSelected ? const Color(0xFFEA560D) : const Color(0xFFE7ECF0),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        softWrap: false,
        overflow: TextOverflow.clip,
        style: textTheme.bodyMedium!.copyWith(
          color: isSelected ? Colors.white : const Color(0xFF919EAB),
        ),
      ),
    );
  }
}
