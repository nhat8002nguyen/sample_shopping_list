import 'package:flutter/material.dart';
import '../models/product.dart';
import './card_item.dart';

class CardList extends StatefulWidget {
  const CardList(
      {Key? key,
      required this.items,
      required this.addItem,
      required this.removeItem})
      : super(key: key);

  final List<Product> items;
  final Function addItem;
  final Function removeItem;

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return CardItem(
              id: index,
              product: widget.items[index],
              addItem: widget.addItem,
              removeItem: widget.removeItem);
        });
  }
}
