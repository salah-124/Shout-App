import 'package:flutter/material.dart';
import 'package:shout_app/features/category/widgets/coustom_category2.dart';

class CoustomCategory2Row extends StatelessWidget {
  const CoustomCategory2Row({super.key, required this.image1, required this.title1, required this.subTitle1, required this.onTap1, required this.image2, required this.title2, required this.subTitle2, required this.onTap2});
final String image1;
  final String title1;
  final String subTitle1;
  final void Function() onTap1;
  final String image2;
  final String title2;
  final String subTitle2;
  final void Function() onTap2;


  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      CoustomCategory2(image: image1, title: title1, subTitle: subTitle1, onTap: onTap1),
      CoustomCategory2(image: image2, title: title2, subTitle: subTitle2, onTap: onTap2)
    ],);
  }
}