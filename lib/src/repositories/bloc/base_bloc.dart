
import 'package:pub_base/src/repositories/base_repository.dart';

class BaseBlocFactory {
  final BaseRepositoryFactory repository;

  BaseBlocFactory(this.repository);

  // final _moviesFetcher = PublishSubject<ItemModel>();

  // Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  // fetchAllMovies() async {
  //   ItemModel itemModel = await _repository.fetchAllMovies();
  //   _moviesFetcher.sink.add(itemModel);
  // }

  dispose() {
    // _moviesFetcher.close();
  }
}