import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/artica%20detailes/data/article_model.dart';
import 'package:shout_app/features/artica%20detailes/data/article_repo.dart';
import 'package:shout_app/features/artica%20detailes/views/artical_detailes_view.dart';
import 'package:shout_app/features/category/widgets/coustom_category_app_bar.dart';
import 'package:shout_app/features/home/views/cubit/article_cubit.dart';
import 'package:shout_app/features/home/widgets/coustom_see_all_container.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  final ArticleRepo articleRepo = ArticleRepo();
  bool isLoading = false;
  List<ArticleModel> articels = [];

  Future<void> getGeneralNews() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await articleRepo.get(endPoint: 'everything', q: 'Business');
      setState(() {
        articels = data;
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
    getGeneralNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleCubit()..getArticle(endPoint: 'everything', q: 'Business'),
      child: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(70),
                  CoustomCategoryAppBar(title: 'Business'),
                  Expanded(
                    child: state is ArticleLoading
                        ? Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.black,
                            ),
                          )
                        : ListView.builder(
                            itemCount:  context
                            .read<ArticleCubit>().articles.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final article =  context
                            .read<ArticleCubit>().articles[index];
                              return CoustomSeeAllContainer(
                                image: article.articleImage!,
                                title: article.title!,
                                desc: article.desc!,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ArticalDetailesView(article: article),
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
        },
      ),
    );
  }
}
