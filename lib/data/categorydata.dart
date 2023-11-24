import 'package:news_app/model/categorymodel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://cdn.pixabay.com/photo/2015/01/09/11/08/startup-594090_640.jpg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://cdn.pixabay.com/photo/2015/11/22/19/04/crowd-1056764_640.jpg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://cdn.pixabay.com/photo/2016/08/13/11/57/stadium-1590576_640.jpg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "https://cdn.pixabay.com/photo/2023/11/10/16/08/ai-generated-8379668_640.jpg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://cdn.pixabay.com/photo/2014/12/10/21/01/doctor-563428_640.jpg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://cdn.pixabay.com/photo/2016/09/16/19/12/atom-1674878_640.png";
  categories.add(categoryModel);

  return categories;
}