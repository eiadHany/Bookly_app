import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/uitls/errors.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimillarBooks(
      {required String category});
  Future<Either<Failure, List<BookModel>>> fetchsearchBooks(
      {required String bookName});
}
