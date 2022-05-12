import 'package:flutter/material.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/ui/pages/saved_page/widgets/charity_saved_page.dart';
import 'package:najot/ui/pages/saved_page/widgets/kraufanding_saved_page.dart';

class CharityKraufanding extends StatelessWidget {
  CharityKraufanding({required this.cardModel, Key? key}) : super(key: key);
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: cardModel.type == KraudfandingSavedPage
            ? KraudfandingSavedPage(cardModel: cardModel, visible: true)
            : CharitySavedPage(cardModel: cardModel, visible: true));
  }
}
