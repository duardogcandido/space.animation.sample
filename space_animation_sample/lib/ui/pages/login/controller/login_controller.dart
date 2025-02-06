import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:flutx/utils/validators/string_validator.dart';
import 'package:space_animation_sample/utils/info_controller.dart';

class LoginController extends FxController{
  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late final FocusNode emailNode, passwordNode;
  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  void fetchData() async{
    super.initState();
    emailTE = TextEditingController(text: 'teste@testeemail.com.br');
    passwordTE = TextEditingController(text: 'password');
    // teddyController = TeddyController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    // initFocusNode();
  }

  // initFocusNode() {
  //   emailNode.addListener(() {
  //     if (emailNode.hasFocus) {
  //       teddyController.coverEyes(false);
  //     }
  //   });
  //   passwordNode.addListener(() {
  //     if (passwordNode.hasFocus) {
  //       teddyController.coverEyes(true);
  //     }
  //   });
  // }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    }
    return null;
  }

  void login() async{
    if (formKey.currentState!.validate()) {
      // teddyController.coverEyes(false);
      // teddyController.setSuccess();
      Info.message("Login success", context: context);
      // await goToConfig();
    } else {
      // teddyController.setFail();
      Info.error("Login failed", context: context);
    }
  }

  @override
  void dispose() {
    FxControllerStore.delete(this);
    super.dispose();
  }

  @override
  String getTag() {
    return 'login_controller';
  }

}