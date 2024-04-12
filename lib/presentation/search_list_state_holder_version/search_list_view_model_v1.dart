import 'package:flutter/widgets.dart';
import 'package:flutter_image_search/data/repository/photo_repository.dart';
import 'package:flutter_image_search/presentation/search_list_state_holder_version/search_list_state.dart';

class SearchListViewModelV1 with ChangeNotifier {
  final PhotoRepository _photoRepository;

  SearchListViewModelV1(this._photoRepository);

  SearchListState _state = const SearchListState();

  SearchListState get state => _state;

  void onSearch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
        photos: await _photoRepository.getPhotos(query),
        isLoading: false,
    );
    notifyListeners();
  }
}