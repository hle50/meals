import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    print(this.categoryTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes For the'),
      ),
    );
  }
}
