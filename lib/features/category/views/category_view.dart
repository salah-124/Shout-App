import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/category/views/Entertainment_view.dart';
import 'package:shout_app/features/category/views/Genaral_view.dart';
import 'package:shout_app/features/category/views/Health_view.dart';
import 'package:shout_app/features/category/views/Lifestyle_view.dart';
import 'package:shout_app/features/category/views/Politics_view.dart';
import 'package:shout_app/features/category/views/Science_view.dart';
import 'package:shout_app/features/category/views/Sports_view.dart';
import 'package:shout_app/features/category/views/World_view.dart';
import 'package:shout_app/features/category/views/business_view.dart';
import 'package:shout_app/features/category/views/tech_view.dart';
import 'package:shout_app/features/category/widgets/coustom_category2_row.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<String> category = [
    '📰 General'
        '🌍 World'
        '🏛️ Politics '
        '⚽ Sports '
        '💻 Technology'
        '💰 Business'
        '🎬 Entertainment'
        '🔬 Science '
        '🩺 Health '
        '🚗 Lifestyle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50),
              CoustmTextDetailesBG(
                text1: 'Categories',
                text2: 'Thousands of articles in each category',
              ),
              Gap(60),
              CoustomCategory2Row(
                image1: 'assets/newspaper-news-svgrepo-com.png',
                title1: 'General',
                subTitle1: 'Headlines&briefs',
                onTap1: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenaralView()),
                ),
                image2: 'assets/world-map-svgrepo-com.png',
                title2: 'World',
                subTitle2: 'Globalnews&events',
                onTap2: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorldView()),
                ),
              ),
              Gap(40),
              CoustomCategory2Row(
                image1: 'assets/politics-svgrepo-com.png',
                title1: 'Politics',
                subTitle1: 'Politics&government',
                onTap1: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliticsView()),
                ),
                image2: 'assets/football-svgrepo-com.png',
                title2: 'Sports',
                subTitle2: 'Scores&events',
                onTap2: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SportsView()),
                ),
              ),
              Gap(40),
              CoustomCategory2Row(
                image1: 'assets/smartphone-touch-screen-svgrepo-com.png',
                title1: 'Technology',
                subTitle1: 'Tech & digital trends',
                onTap1: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TechView()),
                ),
                image2:
                    'assets/business-woman-hitting-a-computer-svgrepo-com.png',
                title2: 'Business',
                subTitle2: 'business news',
                onTap2: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusinessView()),
                ),
              ),
              Gap(40),
              CoustomCategory2Row(
                image1: 'assets/entertainment-svgrepo-com.png',
                title1: 'Entertainment',
                subTitle1: 'Movies,music',
                onTap1: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EntertainmentView()),
                ),
                image2: 'assets/science-flasks-svgrepo-com.png',
                title2: 'Science',
                subTitle2: 'Discoveries,research',
                onTap2: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScienceView()),
                ),
              ),
              Gap(40),
              CoustomCategory2Row(
                image1: 'assets/health-heart-heart-rate-svgrepo-com.png',
                title1: 'Health',
                subTitle1: 'Health&wellness',
                onTap1: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthView()),
                ),
                image2: 'assets/high-battery-svgrepo-com.png',
                title2: 'Lifestyle',
                subTitle2: 'Life,travel&trends',
                onTap2: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LifestyleView()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
