class Article {
  final int id;
  final String title;
  final String shortDescription;
  final String article;
  final String date;

  Article({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.article,
    required this.date,
  });

  factory Article.fromJson(Map<String, Object?> jsonMap) {
    return Article(
        id: jsonMap["id"] as int,
        title: jsonMap["title"] as String,
        shortDescription: jsonMap["short_description"] as String,
        article: jsonMap["article"] as String,
        date: jsonMap["date"] as String);
  }
}
