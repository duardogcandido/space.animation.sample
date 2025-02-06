import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:rive/rive.dart';
import 'package:space_animation_sample/ui/pages/home/controller/home_controller.dart';
import 'package:space_animation_sample/ui/themes/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(HomeController());
    theme = AppTheme.theme;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                RiveAnimation.asset(
                  'assets/animations/rive/cosmos.riv',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomLeft,
                ),
                Center(
                  child: Text(
                    'Explore o universo!',
                    style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        });

  }
}
