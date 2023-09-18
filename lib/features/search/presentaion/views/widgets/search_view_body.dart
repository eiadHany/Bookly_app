import 'package:bookly_app/features/search/presentaion/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/uitls/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchTextField(),
        SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Serach Result',
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: SearchReslutListView()),
      ],
    );
  }
}
