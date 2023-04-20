import 'dart:convert';

import 'package:multiple_result/multiple_result.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_app/models/recipe_api_model.dart';
import '../models/recipe.dart';

class ApiService {

  Future<Result<List<Recipe>, Exception>> getRecipesList(
      int size, int lastItem,
      {String searchQuery = ''}) async{

    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list', {
      'from': lastItem,
      'size': size,
      'q': searchQuery,
    }.map((key, value) => MapEntry(key, value.toString())));

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '700ee9ddc6msh43e163d88749e0dp132f8fjsnbd992452470d',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
    });

    switch(response.statusCode){
      case 200:
        var data = RecipesResponse.fromJson(jsonDecode(response.body));
        List<Recipe> temp = data.results!.map((e) => Recipe(id: e.id ?? 0, title: e.name ?? '', image: e.thumbnailUrl ?? '', positiveRatings: e.userRatings?.countPositive ?? 0, negativeRatings: e.userRatings?.countNegative ?? 0, ingredients: e.sections?.first.components?.map((e) => e.ingredient?.name ?? '').toList() ?? [], instructions: e.instructions?.map((e) => e.displayText ?? '').toList() ?? []),).toList();

        return Success(temp);
      default:
        return Error(Exception(response.reasonPhrase));
    }
  }
}
