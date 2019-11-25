import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../dumy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/cateogry-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeal;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeal =
          DUMMY_MEALS.where((x) => x.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeal.removeWhere((x) => x.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            removeItem: _removeMeal,
            id: categoryMeal[idx].id,
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
