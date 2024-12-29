import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/features/home/data/models/category_model.dart';
import 'package:movies/utils/app_routes.dart';

class CategoryIteam extends StatelessWidget {
  const CategoryIteam({
    super.key,
    required this.categoryModel,
    required this.image,
  });
  final CategoryModel categoryModel;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kCategoryView);
      },
      child: SizedBox(
        height: 100,
        width: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              categoryModel.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
