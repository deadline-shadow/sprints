import 'package:flutter/material.dart';
import 'package:sprints_test/common/good.dart';

class GoodCard extends StatelessWidget {
  final Function(int id, bool isFavorite)? onFavorite;
  final Function(int id, bool inCart)? onCart;

  final Good good;

  const GoodCard({super.key, required this.good, this.onCart, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'BEST SELLER',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(good.getTitle()),
                  Text(''),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: []),
            ],
          ),
        ],
      ),
    );
  }
}
