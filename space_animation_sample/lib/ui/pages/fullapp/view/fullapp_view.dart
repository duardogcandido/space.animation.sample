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
import 'package:url_launcher/url_launcher.dart';

class FullAppPage extends StatefulWidget {
  const FullAppPage({super.key});

  @override
  State<FullAppPage> createState() => _FullAppPageState();
}

class _FullAppPageState extends State<FullAppPage> {
  late FullAppController controller;
  late ThemeData theme;
  final Uri _url = Uri.parse('https://clicksaber.com.br');
  final Uri _urlToken = Uri.parse('https://clicksaber.com.br/auth-seduc?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEwMDAwMDAwOTIwNjI4IiwiTG9naW4iOiJyZzI3NzA1OTMyeHNwIiwiRW1haWwiOiJld2VydGhvbmRhbmllbEBwcm9mLmVkdWNhY2FvLnNwLmdvdi5iciIsIk5vbWUiOiJFV0VSVEhPTiBEQU5JRUwgVkFaIiwiUGVyZmlsU2VkIjoiWzExNF0iLCJSZWdyYSI6IjQiLCJUdXJtYXMiOiJbXSIsIm5iZiI6MTc1NDQ4MzE3NCwiZXhwIjoxNzU0NTY5NTc0LCJpYXQiOjE3NTQ0ODMxNzR9.u08hKStDxvJZ4tvFHFJycjo6uvcdci2h0kkLWw6DW8E&tipoUsuario=servidor');
  final Uri _urlSemToken = Uri.parse('https://clicksaber.com.br/auth-seduc?token=');
  final Uri _urlTokenInvalido = Uri.parse('https://clicksaber.com.br/auth-seduc?token=sdfwe45asdfas2345asdfq23r');

  final Uri _appLink = Uri.parse('app://clicksaber.com.br');
  final Uri _appLinkToken = Uri.parse('app://clicksaber.com.br/auth-seduc?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEwMDAwMDAwOTIwNjI4IiwiTG9naW4iOiJyZzI3NzA1OTMyeHNwIiwiRW1haWwiOiJld2VydGhvbmRhbmllbEBwcm9mLmVkdWNhY2FvLnNwLmdvdi5iciIsIk5vbWUiOiJFV0VSVEhPTiBEQU5JRUwgVkFaIiwiUGVyZmlsU2VkIjoiWzExNF0iLCJSZWdyYSI6IjQiLCJUdXJtYXMiOiJbXSIsIm5iZiI6MTc1NDQ4MzE3NCwiZXhwIjoxNzU0NTY5NTc0LCJpYXQiOjE3NTQ0ODMxNzR9.u08hKStDxvJZ4tvFHFJycjo6uvcdci2h0kkLWw6DW8E&tipoUsuario=servidor');
  final Uri _appLinkSemtoken = Uri.parse('app://clicksaber.com.br/auth-seduc?token=');
  final Uri _appLinktokenInvalido = Uri.parse('app://clicksaber.com.br/auth-seduc?token=sdfwe45asdfas2345asdfq23r');

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
                  SingleChildScrollView(
                    controller: ScrollController(),
                    physics: ScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_url)) {
                                throw Exception('Could not launch $_url');
                              }
                            },
                            child: Text('Url')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_urlToken)) {
                                throw Exception('Could not launch $_urlToken');
                              }
                            },
                            child: Text('Url token')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_urlSemToken)) {
                                throw Exception('Could not launch $_urlSemToken');
                              }
                            },
                            child: Text('Url sem token')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_urlTokenInvalido)) {
                                throw Exception('Could not launch $_urlTokenInvalido');
                              }
                            },
                            child: Text('Url token invalido')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_appLink)) {
                                throw Exception('Could not launch $_appLink');
                              }
                            },
                            child: Text('App link')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_appLinkToken)) {
                                throw Exception('Could not launch $_appLinkToken');
                              }
                            },
                            child: Text('App link token')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_appLinkSemtoken)) {
                                throw Exception('Could not launch $_appLinkSemtoken');
                              }
                            },
                            child: Text('App link sem token')),
                        ElevatedButton(
                            onPressed: () async{
                              if (!await launchUrl(_appLinktokenInvalido)) {
                                throw Exception('Could not launch $_appLinktokenInvalido');
                              }
                            },
                            child: Text('App link token invalido'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

  }
}
