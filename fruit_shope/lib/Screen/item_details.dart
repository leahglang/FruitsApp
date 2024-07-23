import 'package:flutter/material.dart';
import 'package:fruit_shope/Model/model.dart';

class ItemDetails extends StatelessWidget {
  final Item item;

  ItemDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.bgColor,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 55,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 55,
                    ),
                  ),
                ),
                Image.asset(
                  'images/two line.png',
                  height: 30,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              child: Hero(
                tag: item.imageUrl,
                child: Image.asset(item.imageUrl),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 199, 199, 199),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 33),
                        ),
                        Text(
                          item.lb,
                          style: TextStyle(color: Colors.black45, fontSize: 18),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildCounterButton(Icons.add),
                            Text(
                              '1',
                              style: TextStyle(fontSize: 20),
                            ),
                            buildCounterButton(Icons.remove),
                            Text('\$' + item.price,
                                style: TextStyle(fontSize: 28)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Product Description',
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item.description,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          children: [
                            buildActionButton(Icons.favorite, item.color, true),
                            SizedBox(height: 20),
                            Expanded(
                              child: buildActionButton(Icons.shopping_cart,
                                  item.color, false, "Add to cart"),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCounterButton(IconData icon) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: icon == Icons.remove
          ? BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
          : BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
    ),
    child: Icon(icon),
  );
}

Widget buildActionButton(IconData icon, Color color, bool outline,
    [String? text]) {
  return Container(
    height: 75,
    decoration: BoxDecoration(
      color: outline ? Colors.white : color,
      borderRadius: BorderRadius.circular(20),
      border: outline ? Border.all(width: 2, color: color) : null,
    ),
    child: Center(
      child: text == null
          ? Icon(icon, size: 45, color: color)
          : Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
    ),
  );
}
