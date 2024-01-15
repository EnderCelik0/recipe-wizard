import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/recipe/get_recipe/model/recipe_get_model.dart';


abstract class IRecipeGetService{
 IRecipeGetService(this.dio);
   final Dio   dio ;
   final _path = "api/Recipe";
   Future<List<RecipeModel>?> getAllRecipe();
   Future<RecipeModel?> getByIdRecipe(String id);
    Future<List<RecipeModel>?> GetFavoriteRecipes(String userId,String recipeId);
   Future<List<RecipeModel>?>  SearchRecipes(String letter);

}

class RecipeGetService extends IRecipeGetService{
  RecipeGetService(Dio dio) : super(dio);
  
  @override
  Future<List<RecipeModel>?> GetFavoriteRecipes(String userId, String recipeId) {
    // TODO: implement GetFavoriteRecipes
    throw UnimplementedError();
  }
  
  @override
  Future<List<RecipeModel>?> SearchRecipes(String letter) {
    // TODO: implement SearchRecipes
    throw UnimplementedError();
  }
  
  @override
  Future<List<RecipeModel>?> getAllRecipe() {
    // TODO: implement getAllRecipe
    throw UnimplementedError();
  }
  
  @override
  Future<RecipeModel?> getByIdRecipe(String id) {
    // TODO: implement getByIdRecipe
    throw UnimplementedError();
  }

}