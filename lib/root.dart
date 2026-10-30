import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/features/auth/views/profile_view.dart';
import 'package:shout_app/features/category/views/category_view.dart';
import 'package:shout_app/features/home/views/home_view.dart';
import 'package:shout_app/features/saved/views/saved_view.dart';
import 'package:shout_app/shared/coustom_bottom_icon.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController _pageController = PageController();
  int curentState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      curentState = value;
                    });
                  },
                  children: [
                    HomeView(),
                    CategoryView(),
                    SavedView(),
                    ProfileView(),
                  ],
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(15, 840),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 400,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.pColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CoustomBottomIcon(
                        image: 'assets/HomeIcon.svg',
                        onTap: () {
                          setState(() {
                            _pageController.jumpToPage(0);
                          });
                        },
                        isPressed: curentState == 0,
                      ),

                      CoustomBottomIcon(
                        image: 'assets/CategoryIcon.svg',
                        onTap: () {
                          setState(() {
                            _pageController.jumpToPage(1);
                          });
                        },
                        isPressed: curentState == 1,
                      ),
                      CoustomBottomIcon(
                        image: 'assets/SaveIcon.svg',
                        onTap: () {
                          setState(() {
                            _pageController.jumpToPage(2);
                          });
                        },
                        isPressed: curentState == 2,
                      ),
                      CoustomBottomIcon(
                        image: 'assets/ProfileIcon.svg',
                        onTap: () {
                          setState(() {
                            _pageController.jumpToPage(3);
                          });
                        },
                        isPressed: curentState == 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
