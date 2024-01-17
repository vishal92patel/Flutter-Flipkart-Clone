import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/screens/product_list_screen.dart';

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

  void onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const ProductListScreen(),
      ),
    );
  }

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
                child:
                    _TopBannerOne(data: "assets/banner/b1.jpg", onTap: onTap),
              ),
              SliverToBoxAdapter(
                child: _TopCategoriesOne(
                  data: topCategoriesOne,
                  onTap: onTap,
                ),
              ),
              SliverToBoxAdapter(
                child: _TopCategoriesOne(
                  data: topCategoriesTwo,
                  onTap: onTap,
                ),
              ),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(5.0),
              )),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Recently Viewed',
                      style: TextStyle(
                        fontSize: 24,
                        color: theme.colorScheme.onPrimaryContainer,
                      )),
                ),
              ),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(5.0),
              )),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * ((index + 1) % 10)],
                        child: Text('grid item $index'),
                      ),
                    );
                  },
                  childCount: 9,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
              ),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(5.0),
              )),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(5.0),
              )),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Top Trending',
                      style: TextStyle(
                        fontSize: 24,
                        color: theme.colorScheme.onPrimaryContainer,
                      )),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  children: <Widget>[
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(color: Colors.red),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(color: Colors.green),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(color: Colors.blue),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(5.0),
              )),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Top Trending',
                      style: TextStyle(
                        fontSize: 24,
                        color: theme.colorScheme.onPrimaryContainer,
                      )),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid.extent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  children: <Widget>[
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        color: Colors.pink,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        color: Colors.indigo,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        color: Colors.orange,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        color: Colors.pink,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        color: Colors.indigo,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTap(context),
                      child: Container(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
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
  const _TopCategoriesOne({required this.data, required this.onTap});

  final List<Map<String, String>> data;
  final Function onTap;

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
              child: InkWell(
                onTap: () => onTap(context),
                child: SizedBox(
                  child: Image.asset(
                    "assets/topCategories/${data[index]['imgName']}.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TopBannerOne extends StatelessWidget {
  const _TopBannerOne({required this.data, required this.onTap});

  final String data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFDF3DA),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: InkWell(
            onTap: () => onTap(context),
            child: SizedBox(
              child: Image.asset(
                data,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
