import 'package:flutter/material.dart';
import 'package:flutter_image_search/presentation/components/image_card_widget.dart';
import 'package:flutter_image_search/presentation/photo_detail/photo_detail_screen.dart';
import 'package:flutter_image_search/presentation/search_list_state_holder_version/search_list_view_model_v1.dart';
import 'package:provider/provider.dart';

class SearchListScreenV1 extends StatefulWidget {
  const SearchListScreenV1({super.key});

  @override
  State<SearchListScreenV1> createState() => _SearchListScreenV1State();
}

class _SearchListScreenV1State extends State<SearchListScreenV1> {
  final _queryTextEditingController = TextEditingController();

  @override
  void dispose() {
    _queryTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchListViewModelV1>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('image search 1'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _queryTextEditingController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'search word...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      final query = _queryTextEditingController.text;
                      viewModel.onSearch(query);
                    },
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: state.photos
                          .map((photo) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PhotoDetailScreen(photo: photo)),
                                  );
                                },
                                child: Hero(
                                    tag: photo.id,
                                    child: ImageCardWidget(photo: photo)),
                              ))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
