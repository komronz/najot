import 'package:flutter/material.dart';
import 'package:najot/data/bloc/favorite-add_cubit/favorite_add_cubit.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/ui/pages/saved_page/widgets/charity_saved_page.dart';
import 'package:najot/ui/pages/saved_page/widgets/kraufanding_saved_page.dart';
class CharityKraufanding extends StatelessWidget {
  CharityKraufanding({required this.favouriteModel, Key? key }) : super(key: key);
  final FavouriteModel favouriteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
        KraudfandingSavedPage(model: favouriteModel, visible: true)

      );
    }
  }

