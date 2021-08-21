import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/sizeConfig.dart';
import '../widgets/categoryTileWidget.dart';
import '../utils/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);
    final _screenWidth = sc.screenWidth;
    final _textScale = sc.textScale;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delicious Meals",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20 * _textScale,
            ),
          ),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (category) => CategoryTileWidget(
                category.id,
                category.title,
                category.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _screenWidth * 0.5,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: _screenWidth * 0.05,
          crossAxisSpacing: _screenWidth * 0.05,
        ),
      ),
    );
  }
}
