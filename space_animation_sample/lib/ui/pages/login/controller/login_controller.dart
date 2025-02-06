import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:flutx/utils/validators/string_validator.dart';
import 'package:space_animation_sample/ui/pages/fullapp/view/fullapp_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

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
      return "Insira um email";
    } else if (FxStringValidator.isEmail(text)) {
      return "Insira um email valido";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Insira uma senha";
    } else if (!FxStringValidator.validateStringRange(text)) {
      return "A senha deve conter entre 8 e 16 caracteres";
    }
    return null;
  }

  void login() async{
    if (formKey.currentState!.validate()) {
      // teddyController.coverEyes(false);
      // teddyController.setSuccess();
      var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Login!',
          message:
          'Feito com sucesso, Bem Vindo(a)!',
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
        goToFullAppPage();
      });
      // await goToConfig();
    } else {
      var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Login!',
          message:
          'Falha ao fazer login, tente novamente!',
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }


  }


  goToFullAppPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FullAppPage()));
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