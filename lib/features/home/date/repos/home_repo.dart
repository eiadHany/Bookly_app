import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/uitls/errors.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
