import 'package:flutter/material.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomSeeAll extends StatelessWidget {
  const CoustomSeeAll({super.key, required this.onTap});
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CoustomText(
                  text: 'Recommended for you',
                  size: 22,
                  fontWeight: FontWeight.w900,
                ),
                GestureDetector(
                  onTap:onTap ,
                  child: CoustomText(
                    text: 'See All',
                    size: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
  }
}