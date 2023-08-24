import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Common extends StatelessWidget {
  const Common({
    super.key,
    required this.child,
    this.showLeading = true,
    this.bottomAppBar,
  });
  final Widget child;
  final bool showLeading;
  final Widget? bottomAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomAppBar,
      appBar: AppBar(
        automaticallyImplyLeading: showLeading,
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
        leading: showLeading
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  FluentIcons.arrow_left_48_filled,
                ),
              )
            : null,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: child,
        ),
      ),
    );
  }
}
