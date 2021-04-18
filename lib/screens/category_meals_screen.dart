import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals.elementAt(index).id,
              title: categoryMeals.elementAt(index).title,
              imageUrl: categoryMeals.elementAt(index).imageUrl,
              affordability: categoryMeals.elementAt(index).affordability,
              complexity: categoryMeals.elementAt(index).complexity,
              duration: categoryMeals.elementAt(index).duration);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
