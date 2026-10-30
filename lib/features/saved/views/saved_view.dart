import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/home/widgets/coustom_recommeended.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(70),
            CoustmTextDetailesBG(
              text1: 'Bookmarks',
              text2: 'Saved articles to the library',
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CoustomRecommeended(
                    image:
                        "https://iphoneislam.com/wp-content/uploads/2026/09/gpt-6-astra-01.jpg",
                    category: 'ذكي AI',
                    title:
                        'أوبن إيه آي تطلق GPT-6 Astra: قفزة كبرى في التحكم بالحواسيب والأمن السيبراني',
                    onTap: () {},
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.trash)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
