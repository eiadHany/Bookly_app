import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../home/presentaion/views_model/search_books/search_books_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController searchController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        String searchTerm = searchController.text;
        searchController.clear();

        // Dispatch the search event to the SearchBooksCubit
        BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(bookname: searchTerm);
      },
      controller: searchController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorde(),
        enabledBorder: buildOutlineInputBorde(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            String searchTerm = searchController.text;
            searchController.clear();

            // Trigger the API call by dispatching an event to the search cubit
            BlocProvider.of<SearchBooksCubit>(context)
                .fetchSearchBooks(bookname: searchTerm);
          },
          icon: const Opacity(
            opacity: .7,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorde() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(16));
}
