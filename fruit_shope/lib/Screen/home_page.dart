import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruit_shope/Model/model.dart';
import 'package:fruit_shope/Screen/item_details.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = foodShopItems();
  List<Item> filteredItems = foodShopItems();
  TextEditingController searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myAppBar(),
              SizedBox(
                height: 22,
              ),
              Text(
                'Fruit and berries',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              mySearchBar(),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: MasonryGridView.builder(
                  crossAxisSpacing: 20,
                  itemCount: filteredItems.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemDetails(item: item)),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          height: item.height.toDouble(),
                          decoration: BoxDecoration(
                              color: item.bgColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.lb,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "\$${item.price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Expanded(
                                child: Hero(
                                  tag: item.imageUrl,
                                  child: Image.asset(item.imageUrl),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Container(
                                  height: 41,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    color: item.myItems
                                        ? item.color
                                        : Colors.transparent,
                                    border:
                                        Border.all(width: 2, color: item.color),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                    ),
                                  ),
                                  child: Icon(
                                    item.myItems
                                        ? Icons.check_sharp
                                        : Icons.add,
                                    color: item.myItems
                                        ? Colors.white
                                        : item.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mySearchBar() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {
          filteredItems = items
              .where((item) =>
                  item.title.toLowerCase().contains(value.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.all(25),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 25, right: 15),
          child: Icon(Icons.search, size: 30),
        ),
      ),
    );
  }

  Widget myAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }
}
