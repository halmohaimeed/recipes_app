
import 'dart:convert';

import 'package:recipes_app/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

import '../core/locator.dart';

const String DB_NAME = 'recipes_database.sqlite';
const String FavouriteRecpiesTableName = 'favouriteRecipes';

class DatabaseService {

  final _migrationService = locator<DatabaseMigrationService>();
  late Database _database;

  Future initialise() async{

    _database = await openDatabase(DB_NAME, version: 1);

    // Apply migration on every start
    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
      ],
      verbose: true,
    );

  }


  Future<List<Recipe>> getFavouriteRecipes() async {
    // Gets all the data in the FavouriteRecpiesTableName
    List<Map<String, dynamic>> recipeResults = await _database.query(FavouriteRecpiesTableName);
    // Maps it to a Recipe object and returns it
    return recipeResults.map((recipe) => Recipe.fromMap(recipe)).toList();
  } 

  /// Adds a new recipe into the database
  Future addFavouriteRecipe(Recipe recipe) async {
    try {
      await _database.insert(
          FavouriteRecpiesTableName,
          recipe.toMap());
    } catch (e) {
      //TODO add proper error handling
      print('Could not insert the recipe: $e');
    }
  }

  /// Adds a new recipe into the database
  Future deleteFavouriteRecipe(Recipe recipe) async {
    try {
      await _database.delete(
          FavouriteRecpiesTableName,
          where: 'id = ?',
          whereArgs: [recipe.id]);
    } catch (e) {
      //TODO add proper error handling
      print('Could not delete the recipe ${recipe.id}: $e');
    }
  }


}