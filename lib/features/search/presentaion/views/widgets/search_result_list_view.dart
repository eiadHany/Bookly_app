import 'package:flutter/material.dart';

import '../../../../home/presentaion/views/widgets/best_seller_list_view_item.dart';

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
          child: BookListViewItem(),
        );
      },
      itemCount: 10,
    );
  }
}
