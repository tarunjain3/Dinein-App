import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Order'),
        icon: const Icon(Icons.outdoor_grill_outlined),
        onPressed: () {
          
        },
      ),
        body: favoriteMeals.isEmpty
            ? const Center(
                child: Text('You have no favorites yet - start adding some!'),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    imageUrl: favoriteMeals[index].imageUrl,
                    duration: favoriteMeals[index].duration,
                    affordability: favoriteMeals[index].affordability,
                    complexity: favoriteMeals[index].complexity,
                  );
                },
                itemCount: favoriteMeals.length,
              ));
  }
}
