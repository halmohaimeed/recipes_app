import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/core/router.dart';
import 'package:recipes_app/ui/base_view.dart';
import 'package:recipes_app/ui/widgets/recipe_card.dart';
import 'package:recipes_app/viewmodels/base_model.dart';
import 'package:recipes_app/viewmodels/home_viewmodel.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewmodel>(onModelReady: (model) {
      model.initialise();
      _scrollController.addListener(() {
        // nextPageTrigger will have a value equivalent to 80% of the list size.
        var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;

        // _scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed
        if (_scrollController.position.pixels > nextPageTrigger) {
          model.getMoreRecipes(query: _controller.value.text);
        }
      });
    }, builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Tasty Recipes 🍳',
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, favouritesRoute)
                .then((value) => model.getFavouriteRecipes());
          },
        ),
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
            margin: EdgeInsets.only(top: 80.h),
            child: Column(
              children: [
                //Search field
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  margin: EdgeInsets.only(bottom: 12.h),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(40.w),
                    child: TextField(
                      controller: _controller,
                      maxLines: 1,
                      onSubmitted: (query) => model.queryRecipes(query),
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_rounded),
                          prefixIconColor: Colors.amberAccent,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear_rounded),
                            color: Colors.black54,
                            onPressed: () {
                              _controller.clear();
                              model.queryRecipes(_controller.value.text);
                            },
                          ),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40.w),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),

                if(model.state == ViewState.Error)
                Center(
                  child: Text(model.error),
                )
                else
                Flexible(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: model.recipesList.length +
                        (model.state == ViewState.Busy ? 1 : 0),
                    itemBuilder: (context, i) {
                      if (i ==
                              model.recipesList.length +
                                  (model.state == ViewState.Busy ? 1 : 0) -
                                  1 &&
                          model.state == ViewState.Busy) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var isFavourited = model.isFavourited(model.recipesList[i].id);

                        return RecipeCard(
                            recipe: model.recipesList[i],
                            onClick: () {
                              Navigator.pushNamed(context, recipeDetailsRoute,
                                  arguments: model.recipesList[i]).then((value) => model.getFavouriteRecipes());
                            },
                            isFavourited: isFavourited,
                            onFavorit: () {
                              if(isFavourited){
                                model.removeFavouriteRecipe(model.recipesList[i]);
                              }else{
                                model.addFavouriteRecipe(model.recipesList[i]);
                              }
                            });
                      }
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }
}
