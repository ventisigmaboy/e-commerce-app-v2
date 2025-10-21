import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryModel {
  final IconData icon;
  final String label;
  final String? id;

  CategoryModel({
    required this.icon,
    required this.label,
    this.id,
  });
}

class CategoryGrid extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(CategoryModel)? onCategoryTap;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            icon: category.icon,
            label: category.label,
            onTap: () => onCategoryTap?.call(category),
          );
        },
      ),
    );
  }
}
