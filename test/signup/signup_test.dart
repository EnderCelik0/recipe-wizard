import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/allergy/model/allergy_model.dart';
import 'package:recipe_wizard/bloc/category/model/category_model.dart';
import 'package:recipe_wizard/bloc/user/createuser/model/user_model.dart';
import 'package:recipe_wizard/bloc/user/createuser/service/create_user_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';
import 'package:recipe_wizard/product/model/response_model.dart';

void main() {
  late ICreateSUserService createUserService;

  setUp(() {
    createUserService =
        CreateUserService(ProjectNetworkManager.instance.service);
  });
  test('Create User Test', () async {
    List<AllergyModel> allergies = [];
    List<CategoryModel> categories = [];

    AllergyModel allergy = AllergyModel(
        name: "Pork",
        id: "5ef7a533-7ea3-4acf-92aa-479731b94127",
        createdDate: DateTime.parse("2024-01-13T13:32:29.4045066"));
    CategoryModel category = CategoryModel(
        categoryName: "Chicken",
        id: "61255672-fc21-4752-a8db-571e174f3f83",
        createdDate: DateTime.parse("2024-01-13T13:32:29.4045066"));
    categories.add(category);
    allergies.add(allergy);
    final response = await createUserService.signUp(UserModel(
        nameSurname: "kubra",
        email: "kubi02@gmail.com",
        userName: "kubi2002",
        password: "hello123",
        passwordConfirm: "hello123",
        addAllergy: allergies,
        addFavoriteCategories: categories));
    expect(response, isNotNull);
    print(response);
    // Response içindeki JSON verilerini ResponseModel'e dönüştür
    print(response.data);
    ResponseModel model = ResponseModel.fromJson(response.data!);
    print(model.succeded);
  });
}
