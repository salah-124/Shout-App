import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/artica%20detailes/data/article_model.dart';
import 'package:shout_app/features/artica%20detailes/data/article_repo.dart';
import 'package:shout_app/features/artica%20detailes/views/artical_detailes_view.dart';
import 'package:shout_app/features/home/widgets/coustom_see_all_container.dart';
import 'package:shout_app/shared/coustom_text.dart';

class AllNewsView extends StatefulWidget {
  const AllNewsView({super.key});

  @override
  State<AllNewsView> createState() => _AllNewsViewState();
}

class _AllNewsViewState extends State<AllNewsView> {
  final ArticleRepo articleRepo = ArticleRepo();
  bool isLoading = false;
  List<ArticleModel> articles = [];

  Future<void> allEgyptNews() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await articleRepo.get(endPoint: 'everything', q: 'مصر');
      setState(() {
        articles = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      print(e);
    }
  }

  @override
  void initState() {
    allEgyptNews();
    super.initState();
  }

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
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(CupertinoIcons.back, fontWeight: FontWeight.w900),
                ),
                Gap(30),
                CoustomText(
                  text: 'All Egypt News',
                  size: 28,
                  fontWeight: FontWeight.w900,
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return CoustomSeeAllContainer(
                    image: article.articleImage!,
                    title: article.title!,
                    desc: article.desc!,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticalDetailesView(article: article,),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
