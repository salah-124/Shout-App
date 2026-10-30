import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomRecommeended extends StatelessWidget {
  const CoustomRecommeended({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String category;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: NetworkImage(image)),
            ),
          ),
          Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                  text: category,
                  size: 15,
                  fontWeight: FontWeight.w300,
                ),
                Gap(15),
                CoustomText(text: title, size: 15, fontWeight: FontWeight.w800),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
