import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:space_animation_sample/ui/pages/login/view/login_view.dart';

class SplashController extends FxController{

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      goToLoginPage();
    });


  }

  goToLoginPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  void dispose() {
    FxControllerStore.delete(this);
    super.dispose();
  }

  @override
  String getTag() {
    return 'splash_controller';
  }

}