import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';

class HomeScreenButton extends StatefulWidget {
  const HomeScreenButton(
      {required this.text, required this.onPressed, this.disabled = false});

  final String text;
  final Function onPressed;
  final bool disabled;

  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          if (widget.disabled) return;
          widget.onPressed();
        },
        child: Text(
          widget.text.toUpperCase(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(widget.disabled ? 0.2 : 1),
              ),
          overflow: TextOverflow.ellipsis,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: secondaryColor.withOpacity(0.5),
          side: BorderSide(
            width: 2,
            color: primaryColor.withOpacity(0.70),
          ),
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
