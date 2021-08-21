import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/sizeConfig.dart';

class CategoryTileWidget extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryTileWidget(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/category-meals',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);
    final textScale = sc.textScale;
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20 * textScale),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
