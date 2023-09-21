import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../date/models/book_model/book_model.dart';
import '../../../date/repos/home_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks({required String bookname}) async {
    var result = await homeRepo.fetchsearchBooks(bookName: bookname);
    emit(SearchBooksLoading());
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
