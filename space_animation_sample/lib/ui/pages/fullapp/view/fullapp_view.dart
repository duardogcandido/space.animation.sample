import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_animation_sample/ui/pages/fullapp/controller/fullapp_controller.dart';
import 'package:space_animation_sample/ui/pages/home/view/home_view.dart';
import 'package:space_animation_sample/ui/pages/solar_system/view/solar_system_view.dart';
import 'package:space_animation_sample/ui/themes/app_theme.dart';

class FullAppPage extends StatefulWidget {
  const FullAppPage({super.key});

  @override
  State<FullAppPage> createState() => _FullAppPageState();
}

class _FullAppPageState extends State<FullAppPage> {
  late FullAppController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(FullAppController());
    theme = AppTheme.theme;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FullAppController>(
        controller: controller,
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              extendBody: true,
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: theme.colorScheme.primary,
                index: controller.bottomNavigationIndex,
                letIndexChange: (index) {
                  controller.pageController.jumpToPage(index);
                  return true;
                },
                items: [
                  CurvedNavigationBarItem(
                    child: Icon(FontAwesomeIcons.house, color: theme.colorScheme.onPrimary),
                    label: 'Home',
                    labelStyle: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                  CurvedNavigationBarItem(
                    child: Icon(FontAwesomeIcons.sun, color: theme.colorScheme.onPrimary),
                    label: 'Sistema Solar',
                    labelStyle: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                  CurvedNavigationBarItem(
                    child: Icon(FontAwesomeIcons.meteor, color: theme.colorScheme.onPrimary),
                    label: 'Astros',
                    labelStyle: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                  CurvedNavigationBarItem(
                    child: Icon(FontAwesomeIcons.userAstronaut, color: theme.colorScheme.onPrimary),
                    label: 'Perfil',
                    labelStyle: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                ],
                onTap: (index) {
                  controller.pageController.jumpToPage(index);
                },
              ),
              body: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  controller.bottomNavigationIndex = index;
                  setState(() {

                  });
                },
                children: [
                  HomePage(),
                  SolarSystemPage(),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          );
        });

  }
}
