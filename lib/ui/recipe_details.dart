import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/models/recipe.dart';

import '../core/router.dart';
import '../viewmodels/base_model.dart';
import '../viewmodels/home_viewmodel.dart';
import 'base_view.dart';
import 'widgets/recipe_card.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewmodel>(onModelReady: (model) {
      model.initialiseFavourite();
    }, builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
          Container(
            margin: EdgeInsets.only(top: 60.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  value.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RecipeCard(
                          recipe: recipe,
                          onClick: () {},
                          isFavourited: value.isFavourited(recipe.id),
                          onFavorit: () {
                            if(value.isFavourited(recipe.id)){
                                value.removeFavouriteRecipe(recipe);
                              }else{
                                value.addFavouriteRecipe(recipe);
                              }
                          }),
            
                          Card(
                            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                            elevation: 3,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
                            child: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50.h,
                                    margin: EdgeInsets.all(4.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('👍🏼 ${recipe.positiveRatings} Positive Ratings'),
                                        VerticalDivider(
                                          indent: 2.w,
                                          endIndent: 2.w,
                                          width: 1,
                                          color: Colors.black26,
                                        ),
                                        Text('👎🏼 ${recipe.negativeRatings} Negative Ratings'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Row(
                                          children: [
                                            Icon(Icons.shopping_basket_rounded, color: Colors.amberAccent, ),
                                            Text(
                                              ' Ingredients',
                                              softWrap: true,
                                              style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20.sp,
                                  
                                              ),
                                              ),
                                          ],
                                        ),
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: recipe.ingredients.length,
                                    itemBuilder: (context, index) => 
                                    Row(
                                      children: [
                                        Icon(Icons.circle_rounded, color: Colors.amberAccent, size: 6.w,),
                                        Container(
                                          width: 300.w,
                                          child: Text(
                                            ' ${recipe.ingredients[index]}',
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16.sp,
                                        
                                            ),
                                            ),
                                        ),
                                      ],
                                    ),),
                              
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Row(
                                          children: [
                                            Icon(Icons.restaurant_rounded, color: Colors.amberAccent, ),
                                            Text(
                                              ' Instructions',
                                              softWrap: true,
                                              style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20.sp,
                                  
                                              ),
                                              ),
                                          ],
                                        ),
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: recipe.instructions.length,
                                    itemBuilder: (context, index) => 
                                    Row(
                                      children: [
                                        Icon(Icons.circle_rounded, color: Colors.amberAccent, size: 6.w,),
                                        Container(
                                          width: 300.w,
                                          child: Text(
                                            ' ${recipe.instructions[index]}',
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16.sp,
                                        
                                            ),
                                            ),
                                        ),
                                      ],
                                    ),),
                                ],
                              ),
                            ),
                          ),
            
            
                          
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }
}
