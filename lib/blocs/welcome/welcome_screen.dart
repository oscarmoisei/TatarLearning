import 'dart:async';

import 'package:app/blocs/tab_menu/tab_menu_builder.dart';
import 'package:app/blocs/welcome/welcome_bloc.dart';
import 'package:app/blocs/welcome/welcome_event.dart';
import 'package:app/shared/widget/bounce_button.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'delayed_animation.dart';


class WelcomeScreen extends StatelessWidget {

  final WelcomeBloc welcomeBloc;

  const WelcomeScreen({@required this.welcomeBloc}) : assert(welcomeBloc != null);

  final int delayedAmount = 500;

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: FlutterLogo(
                          size: 50.0,
                        ),
                        radius: 50.0,
                      )), 
                ),
                DelayedAimation(
                  child: Text(
                    "Привет",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: color
                    ),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAimation(
                  child: Column(
                    children: [
                      Text(
                        "Это Рәсемле Сүзлек",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: color),
                      ),
                    ]
                  ),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAimation(
                  child: Text(
                    "Твой новый способ",
                    style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                DelayedAimation(
                  child: Text(
                    "Изучения татарского языка",
                    style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAimation(
                  child: Hero(
                    tag: "welcomeHero",
                    child: BounceButton(
                      onTap: () => _navigate(context),
                      child: Text(
                        'Исәнме',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8185E2),
                        ),
                      ),
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
              ],
            )
          ],
        )
      )
    );
  }

  Future<void> _transitionFuture(){

  }

  void _navigate(BuildContext context)async{
    TabMenuBuilder tabMenuBuilder;
    var route = PageRouteBuilder(
      pageBuilder: (c, a1, a2) => tabMenuBuilder,
      transitionsBuilder: (c, anim, a2, child) => FadeTransition(
        opacity: CurvedAnimation(
          curve: Curves.fastOutSlowIn,
          parent: anim,
        ),
        child: child)
        ,
      transitionDuration: Duration(milliseconds: 350),
    );

    var futureController = StreamController();
    tabMenuBuilder = TabMenuBuilder(
      heroTransition: futureController.stream.listen((d){}).asFuture(),
    );

    Navigator.pushReplacement(context, route);

    route.controller.addListener((){
      var status = route.controller.status;
      if (status == AnimationStatus.completed){
        futureController.close();
      }
    });
  }
}