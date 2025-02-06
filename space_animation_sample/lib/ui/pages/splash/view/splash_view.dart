import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:rive/rive.dart';
import 'package:space_animation_sample/ui/pages/splash/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SplashController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                        width: double.infinity,
                        child: RiveAnimation.asset(
                          'assets/animations/rive/splash.riv',
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
