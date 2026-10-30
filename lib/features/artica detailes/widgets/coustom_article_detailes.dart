import 'package:flutter/material.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class CoustomArticleDetailes extends StatelessWidget {
  const CoustomArticleDetailes({
    super.key,
    required this.scrollController,
    required this.topPadding, required this.text,
  });
  final ScrollController scrollController;
  final double topPadding;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: topPadding),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: CoustmTextDetailesBG(
              text1: 'Results',
              text2:
                  text,
            ),
          ),
        ),
      ),
    );
  }
}
