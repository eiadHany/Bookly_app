import 'package:bookly_app/core/uitls/errors.dart';
import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/date/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
