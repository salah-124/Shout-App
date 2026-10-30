class ArticleModel {
  final String? articleImage;
  final String? theCompny;
  final String? title;
  final String? desc;
  final String? autherName;
  final String? autherJop;
  final String? result;

  ArticleModel({
    required this.articleImage,
    required this.theCompny,
    required this.title,
    required this.autherName,
    required this.autherJop,
    required this.result,
    this.desc,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      articleImage: json['urlToImage'],
      theCompny: json['source']['name'],
      title: json['title'],
      desc: json['description'],
      autherName: json['author'],
      autherJop: json['source']['name'],
      result: json['content'],
    );
  }
}
