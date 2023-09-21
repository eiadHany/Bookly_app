import 'package:bookly_app/core/uitls/styles.dart';
import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_books_action.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/similar_featured_list_view.dart';
import 'package:bookly_app/features/home/presentaion/views_model/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimillarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(book: widget.bookModel),
    );
  }
}

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SafeArea(child: CustomBookDetailsAppBar()),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: CustomBookImage(
                      imageUrl: book.volumeInfo.imageLinks?.thumbnail ??
                          'https://m.media-amazon.com/images/I/61JLEeR7IdL._SL1500_.jpg'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  book.volumeInfo.title!,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle30,
                ),
                const SizedBox(
                  height: 4,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  count: book.volumeInfo.ratingsCount ?? 0,
                  rating: book.volumeInfo.averageRating ?? 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                BooksAction(
                  bookModel: book,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SimilarFeaturedBooksListView(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
