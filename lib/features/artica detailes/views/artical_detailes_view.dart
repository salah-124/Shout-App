import 'package:flutter/material.dart';
import 'package:shout_app/features/artica%20detailes/data/article_model.dart';
import 'package:shout_app/features/artica%20detailes/widgets/coustom_article_detailes.dart';
import 'package:shout_app/features/artica%20detailes/widgets/coustom_stack.dart';

class ArticalDetailesView extends StatefulWidget {
  const ArticalDetailesView({super.key, required this.article});
  final ArticleModel article;

  @override
  State<ArticalDetailesView> createState() => _ArticalDetailesViewState();
}

class _ArticalDetailesViewState extends State<ArticalDetailesView> {
  final ScrollController scrollController = ScrollController();
  double top = 440;
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        top = 440 - scrollController.offset;

        if (top < 0) {
          top = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              CoustomStack(
                image: widget.article.articleImage ?? '',
                onBookMarkPressed: () {},
                onSharedPressed: () {},
                theCompany: widget.article.autherJop ?? '',
                title: widget.article.title ?? '',
                avatar: 'assets/1760711895303.jpg',
                avatarName: widget.article.autherName ?? '',
                avatarJop: 'Flutter Developer',
              ),
            ],
          ),
          SizedBox(height: 10),
          CoustomArticleDetailes(
            scrollController: scrollController,
            topPadding: top,
            text: widget.article.desc ?? '',
          ),
        ],
      ),
    );
  }
}
