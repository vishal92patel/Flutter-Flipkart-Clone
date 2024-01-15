import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> topCategoriesOne = [
    {
      "imgName": "1",
    },
    {
      "imgName": "2",
    },
    {
      "imgName": "3",
    },
    {
      "imgName": "4",
    },
    {
      "imgName": "5",
    },
    {
      "imgName": "6",
    },
    {
      "imgName": "7",
    },
    {
      "imgName": "8",
    },
    {
      "imgName": "9",
    },
    {
      "imgName": "10",
    },
  ];
  final List<Map<String, String>> topCategoriesTwo = [
    {
      "imgName": "10",
    },
    {
      "imgName": "9",
    },
    {
      "imgName": "8",
    },
    {
      "imgName": "7",
    },
    {
      "imgName": "6",
    },
    {
      "imgName": "5",
    },
    {
      "imgName": "4",
    },
    {
      "imgName": "3",
    },
    {
      "imgName": "2",
    },
    {
      "imgName": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light
          .copyWith(statusBarColor: theme.colorScheme.onPrimaryContainer),
    );

    return Container(
      color: theme.colorScheme.onPrimaryContainer,
      child: SafeArea(
        child: Container(
          color: theme.colorScheme.background,
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverAppBar(
                title: _StoreTypeBarHeader(),
                floating: true,
              ),
              SliverAppBar(
                title: _SearchBarHeader(),
                clipBehavior: Clip.none,
                pinned: true,
                collapsedHeight: 64,
              ),
              SliverToBoxAdapter(
                child: _TopCategoriesOne(data: topCategoriesOne),
              ),
              SliverToBoxAdapter(
                child: _TopCategoriesOne(data: topCategoriesTwo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreTypeBarHeader extends StatelessWidget {
  void onFlipkartPress() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: FilledButton.icon(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              onPressed: onFlipkartPress,
              icon: const Icon(
                Icons.store_mall_directory,
              ),
              label: const Text(
                "Flipkart",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: FilledButton.icon(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              onPressed: onFlipkartPress,
              icon: const Icon(Icons.fastfood),
              label: const Text(
                "Grocery",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchBarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: TextField(
        style: TextStyle(
          color: theme.colorScheme.primaryContainer,
        ),
        decoration: InputDecoration(
            hintText: "Search on Flipkart",
            hintStyle: TextStyle(
              color: theme.colorScheme.primaryContainer,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: theme.colorScheme.primaryContainer,
            ),
            contentPadding: const EdgeInsets.all(12)),
      ),
    );
  }
}

class _TopCategoriesOne extends StatelessWidget {
  const _TopCategoriesOne({required this.data});

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFDF3DA),
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 90.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: SizedBox(
                child: Image.asset(
                  "assets/topCategories/${data[index]['imgName']}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
