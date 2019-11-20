import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../dumy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/cateogry-meals';

  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal =
        DUMMY_MEALS.where((x) => x.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            title: categoryMeal[idx].title,
            imageUrl: categoryMeal[idx].imageUrl,
            duration: categoryMeal[idx].duration,
            affordability: categoryMeal[idx].affordability,
            complexity: categoryMeal[idx].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
