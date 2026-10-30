import 'package:shout_app/core/network/api_services.dart';
import 'package:shout_app/features/artica%20detailes/data/article_model.dart';

class ArticleRepo {
  final ApiServices apiServices = ApiServices();

  // Get EveryThing

  Future<dynamic> get({required String endPoint, required String q}) async {
    final response = await apiServices.get(endPoint: endPoint, q: q);
    if (response is! Map<String, dynamic>) {
      return [];
    }
    final article = response['articles'];

    if (article is! List) {
      return [];
    }
    return article.map((article) => ArticleModel.fromJson(article)).toList();
  }
}
