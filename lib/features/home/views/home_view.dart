import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/artica%20detailes/views/artical_detailes_view.dart';
import 'package:shout_app/features/auth/widgets/coustom_text_feild.dart';
import 'package:shout_app/features/home/views/all_news_view.dart';
import 'package:shout_app/features/home/views/cubit/article_cubit.dart';
import 'package:shout_app/features/home/widgets/coustom_best_rating.dart';
import 'package:shout_app/features/home/widgets/coustom_recommeended.dart';
import 'package:shout_app/features/home/widgets/coustom_see_all.dart';
import 'package:shout_app/shared/coustom_text.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleCubit()..getArticle(endPoint: 'everything', q: 'مصر'),
      child: BlocListener<ArticleCubit, ArticleState>(
        listener: (context, state) {
          if (state is ArticleError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(70),
                      CoustmTextDetailesBG(
                        text1: 'Browse',
                        text2: 'Discover things of this world',
                      ),
                      Gap(30),
                      CoustomTextFeild(
                        hintText: 'Search',
                        controller: context
                            .read<ArticleCubit>()
                            .searchController,
                        prefixIcon: Icon(CupertinoIcons.search),
                      ),
                      Gap(20),
                      CoustomText(
                        text: 'Best Rating',
                        size: 28,
                        fontWeight: FontWeight.w900,
                      ),
                      Gap(10),
                      SizedBox(
                        height: 290,
                        child: state is ArticleLoading
                            ? Center(
                                child: CupertinoActivityIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : ListView.builder(
                                itemCount:
                                    context
                                            .read<ArticleCubit>()
                                            .articles
                                            .length >
                                        10
                                    ? 10
                                    : context
                                          .read<ArticleCubit>()
                                          .articles
                                          .length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final article = context
                                      .read<ArticleCubit>()
                                      .articles[index];
                                  return CoustomBestRating(
                                    image: article.articleImage!,
                                    categoryTyoe: article.theCompny!,
                                    title: article.title!,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ArticalDetailesView(
                                              article: article,
                                            ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                      Gap(20),
                      CoustomSeeAll(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllNewsView(),
                          ),
                        ),
                      ),
                      state is ArticleLoading
                          ? Center(
                              child: CupertinoActivityIndicator(
                                color: Colors.black,
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  context.read<ArticleCubit>().articles.length >
                                      10
                                  ? 20
                                  : context
                                        .read<ArticleCubit>()
                                        .articles
                                        .length,
                              itemBuilder: (context, index) {
                                final article = context
                                    .read<ArticleCubit>()
                                    .articles[index + 10];
                                print('ARTICLE: $article');
                                print('IMAGE: ${article.articleImage}');
                                return CoustomRecommeended(
                                  image: article.articleImage!,
                                  category: article.theCompny!,
                                  title: article.title!,
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// int selectedIndex = 0;
  // TextEditingController _SearchController = TextEditingController();
  // final ArticleRepo articleRepo = ArticleRepo();
  // List<ArticleModel> articles = [];
  // bool isLoading = false;

  // get Best Article

  // Future<void> getBestArticle() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     final data = await articleRepo.get(endPoint: 'everything', q: 'مصر');
  //     print('DATA: $data');
  //     print('DATA LENGTH: ${data.length}');
  //     setState(() {
  //       articles = data;
  //       isLoading = false;
  //     });
  //     print('PRODUCTS LENGTH: ${articles.length}');
  //   } catch (e) {
  //     if (!mounted) return;

  //     setState(() {
  //       isLoading = false;
  //     });

  //     print(e);
  //   }
  // }