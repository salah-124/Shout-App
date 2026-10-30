import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shout_app/features/artica%20detailes/data/article_model.dart';
import 'package:shout_app/features/artica%20detailes/data/article_repo.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  TextEditingController searchController = TextEditingController();
  final ArticleRepo articleRepo = ArticleRepo();
  List<ArticleModel> articles = [];
  bool isLoading = false;

  // get  Article

  Future<void> getArticle({required String endPoint, required String q}) async {
    emit(ArticleLoading());
    try {
      final data = await articleRepo.get(endPoint: endPoint, q: q);
      articles = data;
      emit(ArticlSuccess());
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}
