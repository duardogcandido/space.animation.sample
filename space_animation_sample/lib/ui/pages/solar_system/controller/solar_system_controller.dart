import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/state_management.dart';
import 'package:flutx/flutx.dart';
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

  Widget imageOnSelectedIndex() {
    var imageWidget = Image.asset('assets/images/sol.png');
    var planetSelected = 'Sol';
    var aboutSelected = aboutSun();

    switch (selectedRailsIndex) {
      case 0:
        imageWidget = Image.asset(
          'assets/images/sol.png',
        );
        planetSelected = 'Sol';
        aboutSelected = aboutSun();
      case 1:
        imageWidget = Image.asset(
          'assets/images/mercurio.png',
        );
        planetSelected = 'Mercúrio';
        aboutSelected = aboutMercury();
      case 2:
        imageWidget = Image.asset(
          'assets/images/venus.png',
        );
        planetSelected = 'Vênus';
        aboutSelected = aboutVenus();
      case 3:
        imageWidget = Image.asset(
          'assets/images/planeta-terra.png',
        );
        planetSelected = 'Terra';
        aboutSelected = aboutEarth();
      case 4:
        imageWidget = Image.asset(
          'assets/images/lua-nova.png',
        );
        planetSelected = 'Lua';
        aboutSelected = aboutMoon();
      case 5:
        imageWidget = Image.asset(
          'assets/images/marte.png',
        );
        planetSelected = 'Marte';
        aboutSelected = aboutMars();
      case 6:
        imageWidget = Image.asset(
          'assets/images/jupiter.png',
        );
        planetSelected = 'Júpiter';
        aboutSelected = aboutJupyter();
      case 7:
        imageWidget = Image.asset(
          'assets/images/saturno.png',
        );
        planetSelected = 'Saturno';
        aboutSelected = aboutSaturn();
      case 8:
        imageWidget = Image.asset(
          'assets/images/urano.png',
        );
        planetSelected = 'Urano';
        aboutSelected = aboutUranus();
      case 9:
        imageWidget = Image.asset(
          'assets/images/netuno.png',
        );
        planetSelected = 'Netuno';
        aboutSelected = aboutNeptune();
      default:
        imageWidget = Image.asset(
          'assets/images/sol.png',
        );
        planetSelected = 'Sol';
        aboutSelected = aboutSun();
    }
    return AnimatedSwitcher(
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
            child: aboutSelected,
          ),
          FxSpacing.height(90),
        ],
      ),
    );
  }

  Widget aboutSun(){
    return RichText(
        softWrap: true,
        text: TextSpan(
          children: [
            TextSpan(text: 'O Sol é a estrela no centro do nosso sistema solar e a '
            'fonte primária de energia para a Terra. Ele é uma bola massiva de gás '
            'composta principalmente de hidrogênio (cerca de 74%) e hélio (cerca de 24%), '
            'com traços de outros elementos mais pesados.'),
            TextSpan(text: '\n\nAqui estão alguns fatos interessantes sobre o Sol:'),
            TextSpan(text: '\n\n🟡 Dimensões: O Sol tem um diâmetro de aproximadamente 1,39 '
                'milhões de quilômetros, o que o torna cerca de 109 '
                'vezes maior do que a Terra.'),
            TextSpan(text: '\n\n🟡 Massa: Ele representa cerca de 99,86% da massa '
                'total do sistema solar.'),
            TextSpan(text: '\n\n🟡 Temperatura: A temperatura na superfície do Sol (fotosfera) '
                'é de cerca de 5.500 graus Celsius, enquanto o núcleo atinge '
                'temperaturas de aproximadamente 15 milhões de graus Celsius.'),
            TextSpan(text: '\n\n🟡 Fusão nuclear: No núcleo do Sol, a fusão nuclear transforma '
                'hidrogênio em hélio, liberando enormes quantidades de energia na '
                'forma de luz e calor.'),
            TextSpan(text: '\n\n🟡 Ciclo solar: O Sol passa por ciclos de atividade de '
                'aproximadamente 11 anos, alternando entre períodos de alta e '
                'baixa atividade solar, que podem afetar o clima espacial e a '
                'tecnologia na Terra.'),
            TextSpan(text: '\n\nAlém de sua importância física, o Sol tem um papel '
                'central em muitas culturas e mitologias ao redor do mundo, '
                'frequentemente simbolizando vida, poder e divindade.'),

          ]
        )
    );
  }

  Widget aboutMercury(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Mercúrio é o menor e mais interno planeta '
                  'do Sistema Solar. É um dos cinco planetas visíveis a olho '
                  'nu e possui algumas características fascinantes:'),
              TextSpan(text: '\n\n🟡 Distância do Sol: Mercúrio é o planeta mais '
                  'próximo do Sol, orbitando a uma média de cerca de 58 '
                  'milhões de quilômetros de distância.'),
              TextSpan(text: '\n\n🟡 Tamanho: Com um diâmetro de aproximadamente '
                  '4.880 km, Mercúrio é o menor planeta do nosso Sistema Solar, '
                  'menor até mesmo que algumas luas, como Ganimedes (de Júpiter) '
                  'e Titã (de Saturno).'),
              TextSpan(text: '\n\n🟡 Temperatura: As temperaturas em Mercúrio '
                  'são extremas, variando de -173°C durante a noite até 427°C '
                  'durante o dia. Isso ocorre porque ele tem uma atmosfera '
                  'muito tênue, incapaz de reter calor.'),
              TextSpan(text: '\n\n🟡 Órbita e Rotação: Mercúrio possui uma '
                  'órbita muito excêntrica e leva cerca de 88 dias terrestres '
                  'para completar uma volta ao redor do Sol. Curiosamente, '
                  'leva aproximadamente 59 dias terrestres para completar uma '
                  'rotação em seu próprio eixo, resultando em dias e noites '
                  'muito longos.'),
              TextSpan(text: '\n\n🟡 Superfície: A superfície de Mercúrio é '
                  'cheia de crateras, similar à da Lua, devido à falta de '
                  'atmosfera para proteger o planeta de impactos. Ele também '
                  'possui planícies lisas e escarpas altas, formadas pela '
                  'contração do planeta ao esfriar.'),

            ]
        )
    );
  }

  Widget aboutVenus(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Vênus é um planeta fascinante do nosso Sistema '
                  'Solar e possui algumas características notáveis:'),
              TextSpan(text: '\n\n🟢 Distância do Sol: Vênus é o segundo planeta mais próximo do Sol, orbitando a uma média de cerca de 108 milhões de quilômetros de distância.'),
              TextSpan(text: '\n\n🟢 Tamanho: Vênus é semelhante em tamanho à Terra, com um diâmetro de aproximadamente 12.104 km, o que o torna o sexto maior planeta do nosso Sistema Solar.'),
              TextSpan(text: '\n\n🟢 Temperatura: Vênus é o planeta mais quente do nosso Sistema Solar, com temperaturas na superfície que chegam a cerca de 465°C. Isso ocorre devido ao seu efeito estufa extremo, causado pela densa atmosfera de dióxido de carbono que retém o calor.'),
              TextSpan(text: '\n\n🟢 Órbita e Rotação: Vênus tem uma órbita quase circular e leva cerca de 225 dias terrestres para completar uma volta ao redor do Sol. Curiosamente, a rotação de Vênus é retrógrada, ou seja, ele gira no sentido oposto ao da maioria dos planetas, incluindo a Terra. Além disso, um dia em Vênus (rotacional) dura cerca de 243 dias terrestres, o que significa que um dia venusiano é mais longo que um ano venusiano!'),
              TextSpan(text: '\n\n🟢 Atmosfera: A atmosfera de Vênus é composta principalmente de dióxido de carbono, com nuvens espessas de ácido sulfúrico. A pressão atmosférica na superfície é cerca de 92 vezes maior que a da Terra, o que equivale à pressão encontrada a cerca de 900 metros de profundidade nos oceanos terrestres.'),
              TextSpan(text: '\n\n🟢 Superfície: A superfície de Vênus é composta por vastas planícies vulcânicas, com mais de 1.600 vulcões grandes, além de inúmeras crateras de impacto e montanhas altas. As condições na superfície são tão extremas que a maioria das sondas que pousaram em Vênus sobreviveu apenas por algumas horas.'),

            ]
        )
    );
  }

  Widget aboutEarth(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'A Terra é o terceiro planeta a partir do Sol e é o único planeta conhecido por abrigar vida. Aqui estão alguns aspectos fascinantes sobre nosso planeta:'),
              TextSpan(text: '\n\n🌍 Distância do Sol: A Terra orbita o Sol a uma distância média de cerca de 149,6 milhões de quilômetros.'),
              TextSpan(text: '\n\n🌍 Tamanho: Com um diâmetro de aproximadamente 12.742 km, a Terra é o quinto maior planeta do Sistema Solar.'),
              TextSpan(text: '\n\n🌍 Estrutura: A Terra é composta por várias camadas, incluindo a crosta, o manto e o núcleo. O núcleo é dividido em uma parte externa líquida e uma parte interna sólida.'),
              TextSpan(text: '\n\n🌍 Atmosfera: Nossa atmosfera é composta principalmente por nitrogênio (78%) e oxigênio (21%), com traços de outros gases. Ela é vital para sustentar a vida, proteger-nos de radiações solares nocivas e manter as temperaturas estáveis.'),
              TextSpan(text: '\n\n🌍 Água: Aproximadamente 71% da superfície da Terra é coberta por água, principalmente em forma de oceanos. Essa presença abundante de água líquida é um dos fatores que permitem a vida em nosso planeta.'),
              TextSpan(text: '\n\n🌍 Clima e Ecossistemas: A Terra possui uma diversidade incrível de climas e ecossistemas, desde florestas tropicais e desertos até tundras e oceanos profundos. Essa diversidade sustenta milhões de espécies de plantas, animais e microrganismos.'),
              TextSpan(text: '\n\n🌍 Movimento: A Terra gira em seu eixo uma vez a cada 24 horas, o que resulta no ciclo de dia e noite. Além disso, leva cerca de 365,25 dias para completar uma órbita ao redor do Sol, resultando nas quatro estações do ano.'),
              TextSpan(text: '\n\n🌍 Satélite Natural: A Terra tem uma única lua natural, chamada Lua. A Lua influencia as marés e tem um impacto significativo em diversos fenômenos naturais e culturais.'),
            ]
        )
    );
  }

  Widget aboutMoon(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'A Lua é o único satélite natural da Terra e desempenha um papel importante em muitos aspectos do nosso planeta. Aqui estão algumas informações interessantes sobre a Lua:'),
              TextSpan(text: '\n\n🌕 Distância da Terra: A Lua está a uma média de cerca de 384.400 km de distância da Terra. A distância varia ao longo de sua órbita, que é elíptica.'),
              TextSpan(text: '\n\n🌕 Tamanho: A Lua tem um diâmetro de aproximadamente 3.474 km, o que a torna cerca de um quarto do tamanho da Terra.'),
              TextSpan(text: '\n\n🌕 Superfície: A superfície lunar é cheia de crateras, montanhas, vales e vastas planícies chamadas de "mares" (ou "maria" em latim), que são na verdade grandes planícies de basalto formadas por antigas erupções vulcânicas.'),
              TextSpan(text: '\n\n🌕 Fases da Lua: A Lua passa por um ciclo de fases à medida que orbita a Terra, o que leva cerca de 29,5 dias. As fases incluem nova, crescente, quarto crescente, gibosa crescente, cheia, gibosa minguante, quarto minguante e crescente minguante.'),
              TextSpan(text: '\n\n🌕 Gravidade: A gravidade na superfície lunar é cerca de um sexto da gravidade da Terra, o que significa que você pesaria muito menos na Lua.'),
              TextSpan(text: '\n\n🌕 Origem: A teoria mais aceita sobre a origem da Lua é que ela se formou a partir dos detritos resultantes de uma colisão entre a Terra jovem e um corpo celeste do tamanho de Marte, chamado de Theia, há cerca de 4,5 bilhões de anos.'),
              TextSpan(text: '\n\n🌕 Exploração: A Lua foi o destino de muitas missões espaciais, incluindo o famoso pouso da Apollo 11 em 1969, quando os astronautas Neil Armstrong e Buzz Aldrin se tornaram os primeiros humanos a caminhar na superfície lunar.'),
              TextSpan(text: '\n\n🌕 Efeitos na Terra: A Lua tem uma influência significativa nas marés oceânicas devido à sua força gravitacional. Ela também estabiliza a inclinação axial da Terra, o que ajuda a manter um clima relativamente estável.'),
            ]
        )
    );
  }

  Widget aboutMars(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Marte é um dos planetas mais intrigantes do nosso Sistema Solar e tem sido um grande foco de exploração espacial. Aqui estão algumas informações fascinantes sobre Marte:'),
              TextSpan(text: '\n\n🔴 Distância do Sol: Marte é o quarto planeta a partir do Sol, orbitando a uma média de cerca de 227,9 milhões de quilômetros de distância.'),
              TextSpan(text: '\n\n🔴 Tamanho: Marte tem um diâmetro de aproximadamente 6.779 km, o que o torna cerca da metade do tamanho da Terra.'),
              TextSpan(text: '\n\n🔴 Temperatura: As temperaturas em Marte são extremas, variando de cerca de -125°C durante a noite nas regiões polares até aproximadamente 20°C durante o dia nas regiões equatoriais.'),
              TextSpan(text: '\n\n🔴 Atmosfera: A atmosfera de Marte é muito fina e composta principalmente de dióxido de carbono (95%), com pequenas quantidades de nitrogênio e argônio. Devido a essa atmosfera rarefeita, a pressão atmosférica na superfície é menos de 1% da pressão na superfície da Terra.'),
              TextSpan(text: '\n\n🔴 Superfície: A superfície de Marte é coberta por uma vasta variedade de características geológicas, incluindo vulcões gigantes (como o Monte Olimpo, o maior vulcão do Sistema Solar), canyons profundos (como Valles Marineris), desertos e planícies rochosas. A superfície também exibe sinais de atividade fluvial antiga, sugerindo que a água líquida já fluiu em Marte no passado.'),
              TextSpan(text: '\n\n🔴 Luas: Marte possui duas pequenas luas, Fobos e Deimos. Estas luas são irregulares e se acredita que sejam asteroides capturados pela gravidade de Marte.'),
              TextSpan(text: '\n\n🔴 Exploração: Marte tem sido alvo de inúmeras missões espaciais, tanto orbitais quanto de pouso, incluindo rovers como Spirit, Opportunity, Curiosity e Perseverance, que têm ajudado a coletar dados valiosos sobre a geologia e a atmosfera do planeta, além de procurar por sinais de vida passada.'),
              TextSpan(text: '\n\n🔴 Possibilidade de Vida: Embora ainda não tenha sido encontrada vida em Marte, a busca por sinais de vida passada ou presente continua sendo uma das principais missões das sondas e rovers que exploram o planeta.'),
            ]
        )
    );
  }

  Widget aboutJupyter(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Júpiter é o maior planeta do nosso Sistema Solar e possui muitas características fascinantes. Aqui estão alguns pontos importantes sobre Júpiter:'),
              TextSpan(text: '\n\n🪐 Tamanho: Júpiter tem um diâmetro de aproximadamente 139.820 km, tornando-o o maior planeta do nosso Sistema Solar. Ele é tão grande que todos os outros planetas poderiam caber dentro dele.'),
              TextSpan(text: '\n\n🪐 Distância do Sol: Júpiter é o quinto planeta a partir do Sol, orbitando a uma média de cerca de 778 milhões de quilômetros de distância.'),
              TextSpan(text: '\n\n🪐 Atmosfera: A atmosfera de Júpiter é composta principalmente de hidrogênio (cerca de 90%) e hélio (cerca de 10%), com traços de outros gases como metano, amônia e vapor de água. A atmosfera é conhecida por suas faixas coloridas e pela Grande Mancha Vermelha, uma tempestade gigante que tem existido há pelo menos 400 anos.'),
              TextSpan(text: '\n\n🪐 Órbita e Rotação: Júpiter leva cerca de 12 anos terrestres para completar uma órbita ao redor do Sol. No entanto, ele tem o dia mais curto de todos os planetas, levando apenas cerca de 10 horas para completar uma rotação em seu próprio eixo.'),
              TextSpan(text: '\n\n🪐 Campo Magnético: Júpiter possui o campo magnético mais forte de todos os planetas do Sistema Solar, cerca de 20.000 vezes mais forte que o da Terra. Este campo magnético gera intensos cinturões de radiação e auroras espetaculares nos polos do planeta.'),
              TextSpan(text: '\n\n🪐 Luas: Júpiter tem um número impressionante de luas, com mais de 79 confirmadas até o momento. As quatro maiores são chamadas de luas galileanas: Io, Europa, Ganimedes e Calisto. Ganimedes, a maior dessas luas, é até maior que o planeta Mercúrio.'),
              TextSpan(text: '\n\n🪐 Anéis: Júpiter também tem um sistema de anéis, embora não tão proeminente quanto o de Saturno. Seus anéis são compostos principalmente de partículas de poeira e são bastante tênues.'),
              TextSpan(text: '\n\n🪐 Exploração: Júpiter tem sido explorado por várias missões espaciais, incluindo as sondas Pioneer, Voyager, Galileo, Juno e a missão Europa Clipper que está em desenvolvimento. Essas missões têm ajudado a revelar muitos dos segredos do gigante gasoso.'),
            ]
        )
    );
  }

  Widget aboutSaturn(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Saturno é o sexto planeta a partir do Sol e é famoso por seu impressionante sistema de anéis. Aqui estão alguns fatos interessantes sobre Saturno:'),
              TextSpan(text: '\n\n🪐 Tamanho: Saturno é o segundo maior planeta do Sistema Solar, com um diâmetro de aproximadamente 116.460 km.'),
              TextSpan(text: '\n\n🪐 Distância do Sol: Saturno orbita o Sol a uma distância média de cerca de 1,4 bilhões de quilômetros.'),
              TextSpan(text: '\n\n🪐 Atmosfera: A atmosfera de Saturno é composta principalmente de hidrogênio (cerca de 96%) e hélio (cerca de 3%), com pequenas quantidades de metano, amônia e outros gases. A atmosfera é conhecida por suas bandas de nuvens visíveis e tempestades intensas.'),
              TextSpan(text: '\n\n🪐 Anéis: Saturno é mais conhecido por seu sistema de anéis espetacular, composto de gelo e partículas de rocha. Existem sete grupos principais de anéis, designados pelas letras A a G, com o anel B sendo o mais brilhante e o anel F o mais fino e complicado.'),
              TextSpan(text: '\n\n🪐 Luas: Saturno possui 83 luas confirmadas, incluindo Titã, que é a segunda maior lua do Sistema Solar e maior que o planeta Mercúrio. Titã possui uma atmosfera densa e lagos de metano líquido em sua superfície. Outras luas notáveis incluem Encélado, que exibe gêiseres de água e pode abrigar um oceano subterrâneo.'),
              TextSpan(text: '\n\n🪐 Órbita e Rotação: Saturno leva cerca de 29,5 anos terrestres para completar uma órbita ao redor do Sol. Seu dia é muito curto, durando apenas cerca de 10,7 horas terrestres.'),
              TextSpan(text: '\n\n🪐 Campo Magnético: Saturno possui um campo magnético forte, embora não tão intenso quanto o de Júpiter. Este campo magnético gera auroras nos polos do planeta.'),
              TextSpan(text: '\n\n🪐 Exploração: Saturno tem sido explorado por várias missões espaciais, incluindo as sondas Pioneer, Voyager, e mais detalhadamente pela sonda Cassini, que orbitou Saturno de 2004 a 2017, proporcionando uma enorme quantidade de dados sobre o planeta, seus anéis e suas luas.'),
            ]
        )
    );
  }

  Widget aboutUranus(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Urano é um dos planetas mais interessantes do nosso Sistema Solar devido a várias características únicas. Aqui estão alguns fatos sobre Urano:'),
              TextSpan(text: '\n\n🪐 Distância do Sol: Urano é o sétimo planeta a partir do Sol, orbitando a uma média de cerca de 2,9 bilhões de quilômetros de distância.'),
              TextSpan(text: '\n\n🪐 Tamanho: Urano tem um diâmetro de aproximadamente 50.724 km, tornando-o o terceiro maior planeta do Sistema Solar em diâmetro.'),
              TextSpan(text: '\n\n🪐 Atmosfera: A atmosfera de Urano é composta principalmente de hidrogênio (cerca de 83%) e hélio (cerca de 15%), com traços de metano e outros gases. O metano na atmosfera superior absorve a luz vermelha, dando a Urano sua cor azul-esverdeada.'),
              TextSpan(text: '\n\n🪐 Temperatura: Urano é extremamente frio, com temperaturas médias em torno de -224°C, o que o torna um dos planetas mais frios do Sistema Solar.'),
              TextSpan(text: '\n\n🪐 Órbita e Rotação: Urano leva cerca de 84 anos terrestres para completar uma órbita ao redor do Sol. Um dia em Urano dura cerca de 17 horas. Uma característica única de Urano é que seu eixo de rotação é inclinado em cerca de 98 graus, o que significa que ele praticamente "rola" ao longo de sua órbita. Essa inclinação extrema causa estações muito diferentes das que temos na Terra.'),
              TextSpan(text: '\n\n🪐 Anéis: Urano possui um sistema de anéis, embora menos conhecidos que os de Saturno. Existem 13 anéis conhecidos, compostos principalmente de partículas de gelo e poeira.'),
              TextSpan(text: '\n\n🪐 Luas: Urano tem 27 luas conhecidas, com nomes de personagens de obras de William Shakespeare e Alexander Pope. As cinco maiores são Miranda, Ariel, Umbriel, Titânia e Oberon. Miranda é especialmente interessante devido à sua superfície extremamente variada e única.'),
              TextSpan(text: '\n\n🪐 Exploração: Urano foi visitado pela sonda Voyager 2 em 1986, que forneceu muitas informações valiosas sobre o planeta e suas luas. Atualmente, não há missões planejadas para Urano, mas sua exploração continua sendo um objetivo importante para a ciência planetária.'),
            ]
        )
    );
  }

  Widget aboutNeptune(){
    return RichText(
        softWrap: true,
        text: TextSpan(
            children: [
              TextSpan(text: 'Netuno é o oitavo e mais distante planeta do Sol no nosso Sistema Solar. Ele possui várias características interessantes:'),
              TextSpan(text: '\n\n🔵 Distância do Sol: Netuno orbita a uma média de cerca de 4,5 bilhões de quilômetros do Sol.'),
              TextSpan(text: '\n\n🔵 Tamanho: Netuno tem um diâmetro de aproximadamente 49.244 km, tornando-o o quarto maior planeta do Sistema Solar em diâmetro e o terceiro maior em massa.'),
              TextSpan(text: '\n\n🔵 Atmosfera: A atmosfera de Netuno é composta principalmente de hidrogênio (cerca de 80%), hélio (cerca de 19%) e metano. O metano na alta atmosfera absorve a luz vermelha, dando ao planeta sua cor azul característica. Netuno também é conhecido por suas tempestades violentas e ventos extremamente rápidos, que podem atingir até 2.100 km/h.'),
              TextSpan(text: '\n\n🔵 Temperatura: A temperatura em Netuno é extremamente fria, com médias em torno de -214°C.'),
              TextSpan(text: '\n\n🔵 Órbita e Rotação: Netuno leva cerca de 165 anos terrestres para completar uma órbita ao redor do Sol. Seu dia é relativamente curto, durando cerca de 16 horas.'),
              TextSpan(text: '\n\n🔵 Anéis: Netuno tem um sistema de anéis tênues compostos principalmente de partículas de poeira e pequenos pedaços de gelo. Os anéis são difíceis de observar e foram descobertos pela sonda Voyager 2 em 1989.'),
              TextSpan(text: '\n\n🔵 Luas: Netuno possui 14 luas conhecidas, com Tritão sendo a maior e mais famosa. Tritão é única entre as grandes luas do Sistema Solar por orbitar seu planeta em direção oposta à rotação de Netuno, o que sugere que pode ter sido capturada da Cintura de Kuiper.'),
              TextSpan(text: '\n\n🔵 Exploração: Netuno foi visitado pela sonda Voyager 2 em 1989, que forneceu muitas informações valiosas sobre o planeta e suas luas. Atualmente, não há missões planejadas para Netuno, mas sua exploração continua sendo um objetivo importante para a astronomia e a ciência planetária.'),
            ]
        )
    );
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