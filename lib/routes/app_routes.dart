import '../screens/categories_screen.dart';
import '../screens/category_meal_screen.dart';

final String homePage = '/';
final String categoriesPage = '/categories';
final String categoryMealPage = '/category-meals';

final route = {
  // homePage: (context) => CategoriesScreen(),
  categoriesPage: (context) => CategoriesScreen(),
  categoryMealPage: (context) => CategoryMealScreen(),
};
