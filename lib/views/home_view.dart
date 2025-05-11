import 'package:bharatnxt_task/routes/routes_list.dart';
import 'package:bharatnxt_task/view_models/home_view_model.dart';
import 'package:bharatnxt_task/widgets/home_view_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchArticles = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().getArticles(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Article App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesList.favouriteArticlesView);
            },
            icon: const Icon(Icons.favorite),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 14.0),
            child: Text('Articles'),
          ),
        ],
      ),
      body:
          providerWatch.isArticlesLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: searchArticles,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: 'Search Article...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<HomeViewModel>().filterArticlesByTitle(
                          value,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await context.read<HomeViewModel>().getArticles(
                            context: context,
                          );
                        },
                        child:
                            providerWatch.articles.isEmpty
                                ? ListView(
                                  children: const [
                                    SizedBox(
                                      height: 600,
                                      child: Center(
                                        child: Text('No Articles Found !!!'),
                                      ),
                                    ),
                                  ],
                                )
                                : ListView.builder(
                                  itemCount: providerWatch.articles.length,
                                  itemBuilder: (context, index) {
                                    final article =
                                        providerWatch.articles[index];
                                    return HomeViewCard(
                                      article: article,
                                      onPressed: () {
                                        providerWatch.favouriteArticleToggle(
                                          article,
                                        );
                                      },
                                    );
                                  },
                                ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
