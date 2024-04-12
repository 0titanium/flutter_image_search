import 'package:flutter/material.dart';
import 'package:flutter_image_search/data/api/photo_api.dart';
import 'package:flutter_image_search/data/repository/photo_repository_impl.dart';
// import 'package:flutter_image_search/presentation/search_list/search_list_screen.dart';
// import 'package:flutter_image_search/presentation/search_list/search_list_view_model.dart';
import 'package:flutter_image_search/presentation/search_list_state_holder_version/search_list_screen_v1.dart';
import 'package:flutter_image_search/presentation/search_list_state_holder_version/search_list_view_model_v1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => SearchListViewModelV1(
          PhotoRepositoryImpl(PhotoApi()),
        ),
        child: const SearchListScreenV1(),
      ),
    );
  }
}
