import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_riverpod/pages/main_page.dart';
import 'package:movies_riverpod/services/http_service.dart';
import 'package:movies_riverpod/services/movies_service.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<HttpService>(HttpService());
  getIt.registerSingleton<MoviesService>(MoviesService());
  runApp(ProviderScope(child: const MainPage()));
}
