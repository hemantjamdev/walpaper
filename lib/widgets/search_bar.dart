import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String)? onSearch;

  const SearchBar({Key? key, this.onSearch}) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        if (widget.onSearch != null) {
          widget.onSearch!(_textEditingController.text);
          FocusScope.of(context).unfocus();
        }
      },
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (widget.onSearch != null) {
              FocusScope.of(context).unfocus();
              widget.onSearch!(_textEditingController.text);
            }
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
