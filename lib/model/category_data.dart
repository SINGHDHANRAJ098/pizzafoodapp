import 'package:food_pizza_hot/model/category.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name = "Pizza";
  categoryModel.image = "images/pizza1.png";

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "Burger";
  categoryModel.image = "images/burger2.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "pasta";
  categoryModel.image = "images/pizza1.png";

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "tacos";
  categoryModel.image = "images/tacos.png";

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
