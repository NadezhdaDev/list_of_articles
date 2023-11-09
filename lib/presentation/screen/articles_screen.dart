import 'package:flutter/material.dart';
import 'package:list_of_articles/data/mapper/json_mapper.dart';
import '../../data/model/article.dart';
import '../navigation/la_route_path.dart';
import '../navigation/navigation.dart';
import '../utils/page_control.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late Future<List<Article>> futureNumbersList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: JsonMapper().getArticleListFromJson(context, PageControl.get()),
        builder: (context, snapshot) {
          return RefreshIndicator(
            onRefresh: () => _pullRefresh(context),
            child: _listView(snapshot),
          );
        },
      ),
    );
  }

  Widget _listView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  title: Text(snapshot.data[index].title.toString()),
                  subtitle:
                      Text(snapshot.data[index].shortDescription.toString()),
                ),
              ),
              onTap: () {
                navigate(
                  LARoutePath.articleDetailsScreen,
                  argument: snapshot.data[index],
                );
              },
            );
          },
        ),
      );
    } else if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('THE END'),
            TextButton(
                onPressed: () => setState(() => _pageCounterReset()),
                child: const Text('Смотреть снова'))
          ],
        ),
      );
    } else {
      return const Center(
        child: Text('Loading data...'),
      );
    }
  }

  Future<void> _pullRefresh(BuildContext context) async {
    List<Article> freshNumbers =
        await JsonMapper().getArticleListFromJson(context, PageControl.get());
    return setState(() {
      PageControl.pageCounterInc();
      futureNumbersList = Future.value(freshNumbers);
    });
  }

  _pageCounterReset() => PageControl.pageCounterReset();
}
