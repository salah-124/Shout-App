import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/artica%20detailes/views/artical_detailes_view.dart';
import 'package:shout_app/features/category/widgets/coustom_category_app_bar.dart';
import 'package:shout_app/features/home/views/cubit/article_cubit.dart';
import 'package:shout_app/features/home/widgets/coustom_see_all_container.dart';

class LifestyleView extends StatelessWidget {
  const LifestyleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleCubit()..getArticle(endPoint: 'everything', q: 'Life'),
      child: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          return BlocListener<ArticleCubit, ArticleState>(
            listener: (context, state) {
              if (state is ArticleError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(70),
                    CoustomCategoryAppBar(title: 'Lifestyle'),
                    Expanded(
                      child: state is ArticleLoading
                          ? Center(
                              child: CupertinoActivityIndicator(
                                color: Colors.black,
                              ),
                            )
                          : ListView.builder(
                              itemCount: context
                                  .read<ArticleCubit>()
                                  .articles
                                  .length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final article = context
                                    .read<ArticleCubit>()
                                    .articles[index];
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
            ),
          );
        },
      ),
    );
  }
}
