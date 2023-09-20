import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../date/models/book_model/book_model.dart';
import '../../../date/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimillarBooks({required String category}) async {
    var result = await homeRepo.fetchSimillarBooks(category: category);
    emit(SimilarBooksLoading());
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
