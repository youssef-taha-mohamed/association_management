import 'package:flutter/material.dart';

import '../../core/style/app_colors.dart';

class JumpingDotsProgressIndicator extends StatefulWidget {
  final int numberOfDots;
  final double fontSize;
  final double dotSpacing;
  final Color color;
  final int milliseconds;
  final double beginTweenValue = 0;
  final double endTweenValue = 8;

  const JumpingDotsProgressIndicator({
    super.key,
    this.numberOfDots = 3,
    this.fontSize = 10,
    this.color = AppColors.black,
    this.dotSpacing = 0,
    this.milliseconds = 250,
  });

  @override
  JumpingDotsProgressIndicatorState createState() =>
      JumpingDotsProgressIndicatorState(
        numberOfDots: numberOfDots,
        fontSize: fontSize,
        color: color,
        dotSpacing: dotSpacing,
        milliseconds: milliseconds,
      );
}

class JumpingDotsProgressIndicatorState
    extends State<JumpingDotsProgressIndicator> with TickerProviderStateMixin {
  final int numberOfDots;
  final int milliseconds;
  final double fontSize;
  final double dotSpacing;
  final Color color;
  final List<AnimationController> controllers = [];
  final List<Animation<double>> animations = [];
  final List<Widget> _widgets = [];

  JumpingDotsProgressIndicatorState({
    required this.numberOfDots,
    required this.fontSize,
    required this.color,
    required this.dotSpacing,
    required this.milliseconds,
  });

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < numberOfDots; i++) {
      _addAnimationControllers();
      _buildAnimations(i);
      _addListOfDots(i);
    }
    controllers[0].forward();
  }

  void _addAnimationControllers() {
    controllers.add(AnimationController(
        duration: Duration(milliseconds: milliseconds), vsync: this));
  }

  void _addListOfDots(int index) {
    _widgets.add(Padding(
      padding: EdgeInsets.only(right: dotSpacing),
      child: _JumpingDot(
        animation: animations[index],
        fontSize: fontSize,
        color: color,
      ),
    ));
  }

  void _buildAnimations(int index) {
    animations.add(
      Tween(begin: widget.beginTweenValue, end: widget.endTweenValue)
          .animate(controllers[index])
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            controllers[index].reverse();
          }
          if (index == numberOfDots - 1 &&
              status == AnimationStatus.dismissed) {
            controllers[0].forward();
          }
          if (animations[index].value > widget.endTweenValue / 2 &&
              index < numberOfDots - 1) {
            controllers[index + 1].forward();
          }
        }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [..._widgets],
      ),
    );
  }

  @override
  void dispose() {
    for (var i = 0; i < numberOfDots; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }
}

class _JumpingDot extends AnimatedWidget {
  final Color color;
  final double fontSize;

  const _JumpingDot({
    required Animation<double> animation,
    required this.color,
    required this.fontSize,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return SizedBox(
      height: animation.value,
      child: Icon(
        Icons.circle,
        color: AppColors.tertiaryColor,
        size: fontSize,
      ),
    );
  }
}
