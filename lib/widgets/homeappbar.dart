import 'package:flutter/material.dart';

class HomeAppBar{
  static PreferredSizeWidget homeAppBar(
      bool isSearch,
      TextEditingController searchController,
      VoidCallback onSearchPressed)
  {
    if (isSearch) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              onSearchPressed();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      );
    } else {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Seeyou News",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                onSearchPressed();
              }, icon: const Icon(Icons.search)),
        ],
      );
    }
  }
}