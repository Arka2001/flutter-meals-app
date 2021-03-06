import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_tile_widget.dart';
import '../utils/sizeConfig.dart';

class CategoryMealScreen extends StatefulWidget {
  // final String id;
  // final String title;

  // CategoryMealScreen(this.id, this.title);
  static String routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);

    final widgetArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = widgetArgs['title'];
    final id = widgetArgs['id'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20 * sc.textScale,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealTile(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
