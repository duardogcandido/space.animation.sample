import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/flutx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';
import 'package:space_animation_sample/extensions/extensions.dart';
import 'package:space_animation_sample/ui/pages/login/controller/login_controller.dart';
import 'package:space_animation_sample/ui/themes/app_theme.dart';
import 'package:space_animation_sample/ui/widgets/tracking_text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;
  late ThemeData theme;
  late OutlineInputBorder outlineInputBorder;


  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(LoginController());
    theme = AppTheme.theme;
    outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LoginController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 64, 20, 0),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 250,
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: RiveAnimation.asset(
                            "assets/animations/rive/astronaut.riv",
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
                Form(
                  key: controller.formKey,
                  child: FxContainer.bordered(
                    color: theme.colorScheme.background,
                    child: Column(
                      children: [
                        FxText.headlineSmall(
                          'bem vindo de volta'.tr(),
                          fontWeight: 700,
                          textAlign: TextAlign.center,
                        ),
                        FxSpacing.height(20),
                        TrackingTextInput(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                FontAwesomeIcons.envelope,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Email Address",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          controller: controller.emailTE,
                          validator: controller.validateEmail,
                          cursorColor: theme.colorScheme.onBackground,
                          focusNode: controller.emailNode,
                        ),
                        FxSpacing.height(20),
                        TrackingTextInput(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                color: theme.colorScheme.onBackground,
                              ),
                              suffixIcon: InkWell(
                                onTap: (){
                                  controller.isObscured = !controller.isObscured;
                                  setState(() { });
                                },
                                child: Icon(
                                  controller.isObscured ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                              hintText: "Password",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          controller: controller.passwordTE,
                          focusNode: controller.passwordNode,
                          validator: controller.validatePassword,
                          isObscured: controller.isObscured,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                        FxSpacing.height(20),
                        FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {
                            controller.login();
                          },
                          splashColor:
                          theme.colorScheme.onPrimary.withAlpha(28),
                          backgroundColor: theme.colorScheme.primary,
                          child: FxText.labelMedium(
                            "Sign In",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
