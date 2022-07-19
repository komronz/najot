import 'package:flutter/material.dart';
import 'package:najot/data/bloc/favorite-add_cubit/favorite_add_cubit.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/ui/pages/saved_page/widgets/charity_saved_page.dart';
import 'package:najot/ui/pages/saved_page/widgets/crowdfunding_saved_page.dart';
class CharityCrowdfunding extends StatelessWidget {
  CharityCrowdfunding({required this.favouriteModel, Key? key }) : super(key: key);
  final FavouriteModel favouriteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
    CrowdfundingSavedPage(model: favouriteModel, visible: true)

      );
    }
  }

