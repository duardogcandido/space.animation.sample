import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:space_animation_sample/ui/pages/login/view/login_view.dart';

class FullAppController extends FxController{
  bool uiLoading = false;
  late PageController pageController;
  late int bottomNavigationIndex;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    pageController = PageController();
    bottomNavigationIndex = pageController.initialPage;
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
    return 'fullapp_controller';
  }

}