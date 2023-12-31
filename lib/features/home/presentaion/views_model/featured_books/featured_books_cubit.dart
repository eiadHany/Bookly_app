import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/date/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    var result = await homeRepo.fetchFeaturedBooks();
    emit(FeaturedBooksLoading());
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
