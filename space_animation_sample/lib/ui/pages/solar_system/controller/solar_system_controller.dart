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

  sunText(){
    return 'O Sol é uma estrela anã amarela que está no centro do Sistema Solar. É a única estrela do sistema '
        'e é responsável por 99,86% da sua massa. '
    ' Características '
    ' Tem 333 mil vezes a massa da Terra '
    ' É 110 vezes maior que a Terra '
    ' Está a cerca de 150 milhões de quilômetros da Terra '
    ' Sua superfície tem cerca de 6000 ºC '
    ' Sua idade é de cerca de 4,6 bilhões de anos '
    ' Estima-se que levará em torno de 6,5 bilhões de anos até se transformar em uma anã branca '
    ' Como funciona '
    ' Produz energia por meio da fusão do hidrogênio em hélio '
    ' É a fonte de luz e calor do nosso planeta '
    ' Mantem a temperatura adequada para a vida na Terra '
    ' Influencia as marés nos oceanos '
    ' Eventos no Sol '
    ' Manchas solares, que são tempestades magnéticas na fotosfera '
    ' Flares solares, que são descargas de energia magnética da corona '
    ' Ventos solares, que são o resultado da expansão do gás na corona '
    ' Proeminências solares, que são tempestades de gás que explodem da superfície';
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