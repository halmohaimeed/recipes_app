import 'package:recipes_app/services/api_service.dart';
import 'package:recipes_app/viewmodels/base_model.dart';

import '../core/locator.dart';
import '../models/recipe.dart';
import '../services/database_service.dart';

class HomeViewmodel extends BaseModel {
  final _apiService = locator<ApiService>();
  final _databaseService = locator<DatabaseService>();
  List<Recipe> recipesList = List.empty(growable: true);
  List<Recipe> favouriteRecipesList = List.empty(growable: true);
  final size = 5;
  var lastItem = 0;
  var hasReachedLast = false;

  Future initialise() async {
    setState(ViewState.Busy);
    await _databaseService.initialise();
    favouriteRecipesList = await _databaseService.getFavouriteRecipes();
    await getRecipesList();
  }
  
  
  Future initialiseFavourite() async {
    setState(ViewState.Busy);
    await _databaseService.initialise();
    favouriteRecipesList = await _databaseService.getFavouriteRecipes();
    setState(ViewState.Idle);
  }

  Future getRecipesList({String query = ''}) async {
    setState(ViewState.Busy);

    var result = await _apiService.getRecipesList(size, lastItem, searchQuery: query);

    result.when((success) {
      if (success.isEmpty) {
        hasReachedLast = true;
      } else {
        recipesList.addAll(success);
      }
      setState(ViewState.Idle);
    }, (error) {
      setError(error.toString());
    });
  }

  Future getMoreRecipes({String query = ''}) async{
    lastItem += size-1;
    await getRecipesList(query: query);
  }

  Future queryRecipes(String query) async{
    lastItem = 0;
    recipesList.clear();
    await getRecipesList(query: query);
  }

  Future getFavouriteRecipes() async{
    setState(ViewState.Busy);
    favouriteRecipesList = await _databaseService.getFavouriteRecipes();
    setState(ViewState.Idle);
  }

  Future removeFavouriteRecipe(Recipe recipe) async{
    setState(ViewState.Busy);
    await _databaseService.deleteFavouriteRecipe(recipe);
    favouriteRecipesList.remove(recipe);
    setState(ViewState.Idle);
  }
  
  
  Future addFavouriteRecipe(Recipe recipe) async{
    setState(ViewState.Busy);
    await _databaseService.addFavouriteRecipe(recipe);
    favouriteRecipesList.add(recipe);
    setState(ViewState.Idle);
  }

  bool isFavourited(int recipeId) => favouriteRecipesList.any((element) => element.id == recipeId);
}
