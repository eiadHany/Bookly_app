import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            backGroundColor: Colors.white,
            text: '19.99€',
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
          ),
        ),
        Expanded(
          child: CustomButton(
            backGroundColor: Color(0xffEF8262),
            text: 'Free preview',
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16)),
          ),
        ),
      ],
    );
  }
}
