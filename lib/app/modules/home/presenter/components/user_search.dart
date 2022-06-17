import 'package:flutter/material.dart';

class UserSearch extends StatefulWidget {
  final Function(String search) goToSearch;
  const UserSearch({super.key, required this.goToSearch});

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  final _searchController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void validator() {
    if (_searchController.text.isNotEmpty) {
      widget.goToSearch(_searchController.text);
    }
    setState(() {
      _searchController.text.isEmpty ? _validate = true : _validate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          TextField(
            controller: _searchController,
            onSubmitted: (text) => validator(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: 'Search by username',
              errorText: _validate ? 'Can\'t be empty' : null,
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 60,
              height: 60,
              child: IconButton(
                onPressed: validator,
                icon: const Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}
