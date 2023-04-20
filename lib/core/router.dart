import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/ui/favourite_list.dart';
import 'package:recipes_app/ui/home.dart';

import '../ui/recipe_details.dart';

const homeRoute = '/';
const recipeDetailsRoute = '/RecipeDetails';
const favouritesRoute = '/Favorites';

class Router{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case homeRoute:
      return MaterialPageRoute(builder: (context) => Home(),); 
      case favouritesRoute:
      return MaterialPageRoute(builder: (context) => FavouriteList(),); 
      case recipeDetailsRoute:
      Recipe selectedRecipe = settings.arguments as Recipe;
      return MaterialPageRoute(builder: (context) => RecipeDetails(recipe: selectedRecipe,),); 
      default:
      return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("No such route"),),));
    }
  }

  

}