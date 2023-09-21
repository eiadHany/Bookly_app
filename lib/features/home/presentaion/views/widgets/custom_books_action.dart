import 'package:bookly_app/core/uitls/function/launch_url.dart';
import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: CustomButton(
            backGroundColor: Colors.white,
            text: 'Free',
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              launchCustomUrl(bookModel.volumeInfo.previewLink, context);
            },
            backGroundColor: const Color(0xffEF8262),
            text: getText(bookModel),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16)),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if ((bookModel.volumeInfo.previewLink) == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
