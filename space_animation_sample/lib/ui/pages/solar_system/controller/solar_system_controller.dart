import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:space_animation_sample/ui/pages/login/view/login_view.dart';

class SolarSystemController extends FxController{
  bool uiLoading = false;
  int selectedRailsIndex = 0;

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
    return 'solar_system_controller';
  }

}