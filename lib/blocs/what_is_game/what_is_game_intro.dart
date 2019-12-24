import 'package:app/blocs/what_is_game/what_is_game_event.dart';
import 'package:intro_views_flutter/Constants/constants.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import 'what_is_game_bloc.dart';
import 'package:flutter/material.dart';

class WhatIsGameIntro extends StatelessWidget {

  final WhatIsGameBloc whatIsGameBloc;

  WhatIsGameIntro({@required this.whatIsGameBloc});

  var first = PageViewModel(
    pageColor: Colors.green,
    bubbleBackgroundColor: Colors.white54,
    body: Text(
      'Игра, где нужно отвечать на вопрос \"Что это?\" на время',
    ),
    title: Text('Что это?'),
    mainImage: Image.asset(
      'images/quiz/1.png',
      height: 220.0,
      width: 220.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(color: Colors.white),
    bodyTextStyle: TextStyle(color: Colors.white, 
      fontSize: 22),
  );

  var second = PageViewModel(
    pageColor: Colors.blue,
    bubbleBackgroundColor: Colors.white54,
    body: Text(
      'Выберай вариант из предложенных, что изображено на картинке',
    ),
    title: Text('Что делать?'),
    mainImage: OverflowBox(
      maxWidth: 300,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.asset(
            'images/quiz/2.png',
          ),
        )
      )
    ),
    titleTextStyle: TextStyle(color: Colors.white),
    bodyTextStyle: TextStyle(color: Colors.white, 
      fontSize: 22),
  );

  var third = PageViewModel(
    pageColor: Colors.purple,
    bubbleBackgroundColor: Colors.white54,
    body: Text(
      'В конце ты можешь сохранить слова, которые хочешь выучить!',
    ),
    title: Text('Результат'),
    mainImage: OverflowBox(
      maxWidth: 300,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.asset(
            'images/quiz/3.png',
          ),
        )
      )
    ),
    titleTextStyle: TextStyle(color: Colors.white),
    bodyTextStyle: TextStyle(color: Colors.white, 
      fontSize: 22),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: IntroViewsFlutter(
            [first, second, third],
            onTapNextButton: (){print("next");},
            onTapDoneButton: (){
              whatIsGameBloc.add(IntroIsOver());
            },
            showSkipButton: false,
            doneText: const Text("ОК!"),
            pageButtonTextStyles: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )
        )
      )
    );
  }
}
			