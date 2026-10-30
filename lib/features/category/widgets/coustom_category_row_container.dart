import 'package:flutter/cupertino.dart';
import 'package:shout_app/features/category/widgets/coustom_category_container.dart';

class CoustomCategoryRowContainer extends StatelessWidget {
  const CoustomCategoryRowContainer({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap1,
    required this.onTap2,
  });
  final String title1;
  final String title2;
  final void Function() onTap1;
  final void Function() onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoustomCategoryContainer(title: title1, onTap: onTap1),
        CoustomCategoryContainer(title: title2, onTap: onTap2),
      ],
    );
  }
}
