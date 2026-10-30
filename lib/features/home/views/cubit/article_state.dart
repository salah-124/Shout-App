part of 'article_cubit.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticlSuccess extends ArticleState {}

final class ArticleError extends ArticleState {
  final String errorMessage;

  ArticleError( this.errorMessage);
}
