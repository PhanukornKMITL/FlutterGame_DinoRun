import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/cupertino.dart';

const double groundHeight = 32;
const double dinoButtonSpcaing = 10;
const int numberOfTilesAlongWith = 10;

class DinoGame extends BaseGame{
  AnimationComponent _dino;
  ParallaxComponent _parallaxComponent;

  DinoGame(){
    _dino = AnimationComponent.empty();
    //0-3 = idle
    // 4-10 = run
    //11-13 = kick
    //14-16 = hit
    //17-23 = Sprint

    //หาความขนาดจาก sprite โดยเอา ขนาดภาพ หารด้วย จำนวนช่อง sprite
    final spriteSheet = SpriteSheet(
        imageName: "DinoSprites - tard.png",
        textureWidth: 24,
        textureHeight: 24,
        columns: 24,
        rows: 1);

    final idleAnimation = spriteSheet.createAnimation(0, from: 0,to: 3,stepTime: 0.1);
    final runAnimation = spriteSheet.createAnimation(0, from: 4,to: 10,stepTime: 0.1);
    _dino.animation = runAnimation;
    _dino.x = 80;
    _dino.y = 200;


    _parallaxComponent = ParallaxComponent([
      ParallaxImage('parallax/plx-1.png'),
      ParallaxImage('parallax/plx-2.png'),
      ParallaxImage('parallax/plx-3.png'),
      ParallaxImage('parallax/plx-4.png'),
      ParallaxImage('parallax/plx-5.png'),
      ParallaxImage('parallax/plx-6.png', fill: LayerFill.none),
    ],
    baseSpeed: Offset(100,0),
      //set ใเหเ้ แต่ละ layer ความเร็วห่างกัน 20
      layerDelta: Offset(20,0),
    );
    add(_parallaxComponent);
    add(_dino);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    _dino.height = _dino.width = size.width/ numberOfTilesAlongWith;
    _dino.x = _dino.width;
    _dino.y = size.height - groundHeight - _dino.height +10;
  }

}