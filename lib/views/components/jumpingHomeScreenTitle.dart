import 'package:flutter/material.dart';

class JumpingHomeScreenTitle extends StatefulWidget {
  const JumpingHomeScreenTitle();

  @override
  _JumpingHomeScreenTitleState createState() => _JumpingHomeScreenTitleState();
}

class _JumpingHomeScreenTitleState extends State<JumpingHomeScreenTitle>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutBack,
    );

    offset = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.02),
    ).animate(curve);
  }

  void _onTap() {
    controller.duration = Duration(milliseconds: 75);

    controller
        .forward()
        .then((value) => controller.reverse())
        .then((value) => controller.forward())
        .then((value) => controller.reverse())
        .then((value) => controller.forward())
        .then((value) => controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SlideTransition(
        position: offset,
        child: Image.asset("assets/images/homeScreenTitle.png"),
      ),
    );
  }
}
