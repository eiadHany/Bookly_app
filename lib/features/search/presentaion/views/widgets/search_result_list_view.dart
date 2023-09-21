import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentaion/views_model/search_books/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchReslutListView extends StatelessWidget {
  const SearchReslutListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrMesasge(errMessage: state.errMessage);
        } else {
          // Display a message indicating no search performed yet
          return const Center(
            child: Text(
              'Perform a search to see results',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
      },
    );
  }
}
