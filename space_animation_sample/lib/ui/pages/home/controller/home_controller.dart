import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:space_animation_sample/ui/pages/login/view/login_view.dart';

class HomeController extends FxController{
  bool uiLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
  }

  goTo(){
  }

  @override
  void dispose() {
    FxControllerStore.delete(this);
    super.dispose();
  }

  @override
  String getTag() {
    return 'home_controller';
  }

}