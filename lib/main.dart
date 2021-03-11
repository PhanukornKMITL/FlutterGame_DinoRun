import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //call something before run app
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino Run',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dino Run'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  BaseGame game;


  @override
  void initState() {

    super.initState();
    game = BaseGame();
    
   var dinoSprite = SpriteComponent.square(64, "DinoSprites_tard.gif");
    dinoSprite.x = 100;
    dinoSprite.y = 100;
    game.add(dinoSprite);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: game.widget,
    );
  }
}
