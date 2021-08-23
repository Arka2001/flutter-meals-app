import 'package:meals_app/screens/meal_detail.dart';

import '../screens/categories_screen.dart';
import '../screens/category_meal_screen.dart';

final String homePage = '/';
final String categoriesPage = '/categories';
final String categoryMealPage = '/category-meals';
final String mealDetailsPage = '/meal-details';

final route = {
  // homePage: (context) => CategoriesScreen(),
  categoriesPage: (context) => CategoriesScreen(),
  categoryMealPage: (context) => CategoryMealScreen(),
  mealDetailsPage: (context) => MealDetailScreen(),
};
