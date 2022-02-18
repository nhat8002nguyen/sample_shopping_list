import 'package:flutter/material.dart';
import '../models/product.dart';

class CardItem extends StatelessWidget {
  final int id;
  final Product product;
  final Function addItem;
  final Function removeItem;

  const CardItem(
      {Key? key,
      required this.id,
      required this.product,
      required this.addItem,
      required this.removeItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        const Expanded(
            flex: 1,
            child: Icon(Icons.circle, color: Colors.yellow, size: 100)),
        Expanded(
            child: Column(
              children: [
                Text(product.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text(product.price.toString() + '\$')
              ],
            ),
            flex: 3),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => removeItem(id),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child: const Center(
                      child: Text('-'),
                    ),
                  ),
                ),
                Text((product.count).toString(),
                    style: const TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: () => addItem(id),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child: const Center(
                      child: Text('+'),
                    ),
                  ),
                )
              ],
            ),
            flex: 2)
      ],
    ));
  }
}
