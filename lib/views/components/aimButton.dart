import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/utils/constant.dart';

class AimButton extends StatelessWidget {
  const AimButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    if (text == "") return Container();

    return Container(
      height: 50,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: primaryColor.withOpacity(0.7),
      ),
      child: IconButton(
        tooltip:
            "$text ${AppLocalizations.translate('commonPriority').toLowerCase()}",
        onPressed: null,
        icon: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
