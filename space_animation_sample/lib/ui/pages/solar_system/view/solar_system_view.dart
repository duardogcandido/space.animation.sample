import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/flutx.dart';
import 'package:rive/rive.dart' as rive;
import 'package:space_animation_sample/ui/pages/solar_system/controller/solar_system_controller.dart';
import 'package:space_animation_sample/ui/themes/app_theme.dart';
import 'package:space_animation_sample/ui/widgets/planet_icons_icons.dart';

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
                rive.RiveAnimation.asset(
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
                      selectedIconTheme:
                          IconThemeData(color: theme.colorScheme.primary),
                      selectedLabelTextStyle: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3),
                      useIndicator: false,
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.sol, size: 65),
                          selectedIcon: Icon(PlanetIcons.sol, size: 65),
                          label: FxText.titleMedium('Sol',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.mercurio, size: 65),
                          selectedIcon: Icon(PlanetIcons.mercurio, size: 65),
                          label: FxText.titleMedium('Mercúrio',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.venus, size: 65),
                          selectedIcon: Icon(PlanetIcons.venus, size: 65),
                          label: FxText.titleMedium('Vênus',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.planeta_terra, size: 65),
                          selectedIcon:
                              Icon(PlanetIcons.planeta_terra, size: 65),
                          label: FxText.titleMedium('Terra',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.lua_nova, size: 65),
                          selectedIcon: Icon(PlanetIcons.lua_nova, size: 65),
                          label: FxText.titleMedium('Lua',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.marte, size: 65),
                          selectedIcon: Icon(PlanetIcons.marte, size: 65),
                          label: FxText.titleMedium('Marte',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.jupiter, size: 65),
                          selectedIcon: Icon(PlanetIcons.jupiter, size: 65),
                          label: FxText.titleMedium('Júpiter',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.saturno, size: 65),
                          selectedIcon: Icon(PlanetIcons.saturno, size: 65),
                          label: FxText.titleMedium('Saturno',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.urano, size: 65),
                          selectedIcon: Icon(PlanetIcons.urano, size: 65),
                          label: FxText.titleMedium('Urano',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                        NavigationRailDestination(
                          icon: Icon(PlanetIcons.netuno, size: 65),
                          selectedIcon: Icon(PlanetIcons.netuno, size: 65),
                          label: FxText.titleMedium('Netuno',
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    imageOnSelectedIndex()
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget imageOnSelectedIndex() {
    var imageWidget = Image.asset('assets/images/sol.png');
    var planetSelected = 'Sol';
    var aboutSelected = controller.sunText();
    switch (controller.selectedRailsIndex) {
      case 0:
        imageWidget = Image.asset(
          'assets/images/sol.png',
        );
        planetSelected = 'Sol';
      case 1:
        imageWidget = Image.asset(
          'assets/images/mercurio.png',
        );
        planetSelected = 'Mercúrio';
      case 2:
        imageWidget = Image.asset(
          'assets/images/venus.png',
        );
        planetSelected = 'Vênus';
      case 3:
        imageWidget = Image.asset(
          'assets/images/planeta-terra.png',
        );
        planetSelected = 'Terra';
      case 4:
        imageWidget = Image.asset(
          'assets/images/lua-nova.png',
        );
        planetSelected = 'Lua';
      case 5:
        imageWidget = Image.asset(
          'assets/images/marte.png',
        );
        planetSelected = 'Marte';
      case 6:
        imageWidget = Image.asset(
          'assets/images/jupiter.png',
        );
        planetSelected = 'Júpiter';
      case 7:
        imageWidget = Image.asset(
          'assets/images/saturno.png',
        );
        planetSelected = 'Saturno';
      case 8:
        imageWidget = Image.asset(
          'assets/images/urano.png',
        );
        planetSelected = 'Urano';
      case 9:
        imageWidget = Image.asset(
          'assets/images/netuno.png',
        );
        planetSelected = 'Netuno';
      default:
        imageWidget = Image.asset(
          'assets/images/sol.png',
        );
        planetSelected = 'Sol';
    }
  return Expanded(
  child: AnimatedSwitcher(
    duration: Duration(milliseconds: 1000),
    transitionBuilder: (Widget child, Animation<double> animation) {
      return ScaleTransition(scale: animation, child: child);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      key: ValueKey<String>(planetSelected),
      children: [
        FxContainer.transparent(
          paddingAll: 24,
          child: imageWidget,
        ),
        FxText.titleLarge(planetSelected,
            color: theme.colorScheme.onPrimary, letterSpacing: 0.3),
        FxContainer.transparent(
          child: FxText.bodyMedium(aboutSelected,
              color: theme.colorScheme.onPrimary, letterSpacing: 0.3),
        ),
        FxSpacing.height(90),
      ],
    ),
  ),
  );
  }
}
