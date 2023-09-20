import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarFeaturedBooksListView extends StatelessWidget {
  const SimilarFeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CustomBookImage(
              imageUrl:
                  'https://www.freepik.com/free-vector/hand-drawn-flat-design-stack-books_24005145.htm#query=book%20illustration&position=0&from_view=keyword&track=ais',
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
