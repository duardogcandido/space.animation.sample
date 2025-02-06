import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/flutx.dart';
import 'package:rive/rive.dart';
import 'package:space_animation_sample/ui/pages/solar_system/controller/solar_system_controller.dart';
import 'package:space_animation_sample/ui/themes/app_theme.dart';

class SolarSystemPage extends StatefulWidget {
  const SolarSystemPage({super.key});

  @override
  State<SolarSystemPage> createState() => _SolarSystemPageState();
}

class _SolarSystemPageState extends State<SolarSystemPage> {
  late SolarSystemController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(SolarSystemController());
    theme = AppTheme.theme;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SolarSystemController>(
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
                Row(
                  children: [
                    NavigationRail(
                      backgroundColor: theme.cardTheme.color,
                      selectedIndex: controller.selectedRailsIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          controller.selectedRailsIndex = index;
                        });
                      },
                      labelType: NavigationRailLabelType.selected,
                      destinations: [
                        NavigationRailDestination(
                          
                          icon: ImageIcon(
                            AssetImage("assets/images/sol.png"),
                            size: 24,
                          ),
                          selectedIcon: ImageIcon(
                              AssetImage("assets/ico/sol.ico")),
                          label: FxText.titleSmall('Sol',
                              fontWeight: 600, color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.book_outlined),
                          selectedIcon: Icon(Icons.book),
                          label: FxText.titleSmall('Second',
                              fontWeight: 600, color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.star_border),
                          selectedIcon: Icon(Icons.star),
                          label: FxText.titleSmall('Third',
                              fontWeight: 600, color: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: FxText.titleMedium('Selected : ${controller.selectedRailsIndex}',
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.3),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });

  }
}
