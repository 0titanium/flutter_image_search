import 'package:flutter/material.dart';
import 'package:flutter_image_search/presentation/components/image_card_widget.dart';
import 'package:flutter_image_search/presentation/search_list/search_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({super.key});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  final _queryTextEditingController = TextEditingController();

  @override
  void dispose() {
    _queryTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('image search 1'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _queryTextEditingController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'search word...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _queryTextEditingController.text;
                    print(query);
                    viewModel.onSearch(query);
                  },
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: viewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: viewModel.photos
                          .map((e) => ImageCardWidget(photo: e))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
