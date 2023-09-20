import 'package:flutter/material.dart';

class SearchReslutListView extends StatelessWidget {
  const SearchReslutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // child: BookListViewItem(),
        );
      },
      itemCount: 10,
    );
  }
}
