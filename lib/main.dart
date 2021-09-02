import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail.dart';
import 'screens/tab_bar_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool?> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _changeFilters(Map<String, bool?> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => mealId == meal.id);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals App',
        theme: ThemeData(
          primaryColor: Colors.pink.shade600,
          accentColor: Colors.amberAccent,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: TabsScreen.routeName,
        routes: {
          TabsScreen.routeName: (context) => TabsScreen(_favoriteMeals),
          CategoriesScreen.routeName: (context) => CategoriesScreen(),
          CategoryMealScreen.routeName: (context) =>
              CategoryMealScreen(_availableMeals),
          MealDetailScreen.routeName: (context) =>
              MealDetailScreen(_toggleFavorite, _isMealFavorite),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(_filters, _changeFilters),
        });
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final SizeConfig sc = SizeConfig();
//     sc.init(context);

//     final _textScale = sc.textScale;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.dehaze_rounded,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           "Delicious Meals",
//           style: GoogleFonts.poppins(
//             textStyle: TextStyle(
//               color: Colors.white,
//               fontSize: 20 * _textScale,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
