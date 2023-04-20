import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/router.dart';
import '../viewmodels/base_model.dart';
import '../viewmodels/home_viewmodel.dart';
import 'base_view.dart';
import 'widgets/recipe_card.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favourite Recipes 🤍',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
          height: 80.h,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(180, 80),
                  bottomRight: Radius.circular(150)),
              color: Colors.amberAccent),
        ),
        BaseView<HomeViewmodel>(onModelReady: (model) {
          model.initialiseFavourite();
        }, builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.only(top: 80.h),
            child: Column(
              children: [
                value.state == ViewState.Busy ?
                Center(child: CircularProgressIndicator(),) :
                Flexible(
                  child: ListView.builder(
                    itemCount: value.favouriteRecipesList.length,
                    itemBuilder: (context, i) {
                        return RecipeCard(
                            recipe: value.favouriteRecipesList[i],
                            onClick: () { Navigator.pushNamed(context, recipeDetailsRoute, arguments: value.favouriteRecipesList[i]);},
                            isFavourited: value.isFavourited(value.favouriteRecipesList[i].id),
                            onFavorit: () {value.removeFavouriteRecipe(value.favouriteRecipesList[i]);});
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }
}