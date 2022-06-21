import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:movies_riverpod/controllers/main_page_controller.dart';
import 'package:movies_riverpod/models/movie.dart';

import '../models/main_page_model.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageController, MainPageModel>((ref) {
  return MainPageController(MainPageModel([], false));
});

class MainPage extends ConsumerWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainPageModel = ref.watch(mainPageDataControllerProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: mainPageModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: mainPageModel.movies?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.star),
                      title: Text("${mainPageModel.movies?[index].title}"));
                }),
      ),
    );
  }
}
