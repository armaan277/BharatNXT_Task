class Article {
  final int id;
  final String title;
  final String description;

  Article({required this.id, required this.title, required this.description,});

  factory Article.fromMap(Map map) {
    return Article(
      id: map['id'],
      title: map['title'],
      description: map['body'],
    );
  }
}