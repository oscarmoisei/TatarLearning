import 'package:app/shared/entity/word_card.dart';

import 'word_card_detail_builder.dart';
import 'word_card_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'word_card_detail_state.dart';
import 'word_card_detail_event.dart';


class WordCardDetailScreen extends StatelessWidget {

  final WordCardDetailBloc wordCardDetailBloc;

  final WordCard wordCard;

  const WordCardDetailScreen({@required this.wordCardDetailBloc, 
                              @required this.wordCard});

  Widget _buildImage(BuildContext context){
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            tag: "card-${wordCard.translates.hashCode}",
            child:Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              alignment: Alignment.center,
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  wordCard.imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Text(wordCard.word,
              style: Theme.of(context).textTheme.headline
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Text(wordCard.translates[0],
              style: Theme.of(context).textTheme.headline
            ),
          )
        ],
      )
    );
  }

  Widget _buildContent(BuildContext context){
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          children: <Widget>[
            Text(wordCard.description,
              style: Theme.of(context).textTheme.subhead.copyWith(
                color: Colors.black54
              )
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(wordCard.word),
        ),
        body: ListView(
          children: <Widget>[
            _buildImage(context),
            _buildContent(context)
          ],
        )
      )
    );
  }

}
			