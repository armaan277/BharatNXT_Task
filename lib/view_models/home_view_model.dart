import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/article.dart';
import '../repositories/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _homeRepository;
  HomeViewModel({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  final List<Article> _allArticles = [];

  bool _isArticlesLoading = true;
  bool get isArticlesLoading => _isArticlesLoading;

  final List<Article> _favouriteArticles = [];
  List<Article> get favouriteArticles => _favouriteArticles;

  Future<void> getArticles({required BuildContext context}) async {
    final response = await _homeRepository.getArticles();
    response.fold(
      (l) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(l));
        },
      ),
      (r) => _articles = r,
    );
    _allArticles.clear();
    _allArticles.addAll(_articles);
    await _loadFavouriteArticles();
    _isArticlesLoading = false;
    notifyListeners();
  }

  void favouriteArticleToggle(Article article) {
    if (_favouriteArticles.any((a) => a.id == article.id)) {
      _favouriteArticles.removeWhere((a) => a.id == article.id);
    } else {
      _favouriteArticles.add(article);
    }
    _saveFavouriteArticles();
    notifyListeners();
  }

  void filterArticlesByTitle(String query) {
    if (query.isEmpty) {
      _articles = List.from(_allArticles);
    } else {
      _articles =
          _allArticles
              .where(
                (article) =>
                    article.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }

  Future<void> _saveFavouriteArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = _favouriteArticles.map((a) => a.id.toString()).toList();
    await prefs.setStringList('favourite_article_ids', favIds);
  }

  Future<void> _loadFavouriteArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favourite_article_ids') ?? [];
    _favouriteArticles.clear();
    _favouriteArticles.addAll(
      _articles.where((a) => favIds.contains(a.id.toString())),
    );
  }
}
