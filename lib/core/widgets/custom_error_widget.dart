import 'package:bookly_app/core/uitls/styles.dart';
import 'package:flutter/material.dart';

class CustomErrMesasge extends StatelessWidget {
  const CustomErrMesasge({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: Styles.textStyle18,
    );
  }
}
