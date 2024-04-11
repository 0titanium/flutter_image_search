import 'package:flutter/cupertino.dart';
import 'package:flutter_image_search/data/model/photo.dart';
import 'package:flutter_image_search/data/repository/photo_repository.dart';

class SearchListViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;

  SearchListViewModel(this._photoRepository);

  List<Photo> _photos = [];

  List<Photo> get photos => List.unmodifiable(_photos);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void onSearch(String query) async {
    _isLoading = true;
    notifyListeners();

    _photos = await _photoRepository.getPhotos(query);
    _isLoading = false;
    notifyListeners();
  }
}