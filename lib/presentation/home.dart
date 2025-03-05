import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sprints_test/common/good.dart';
import 'package:sprints_test/presentation/good.dart';

/*
− Описание назначения класса
  Домашний экран приложения, с каталогом товаров и переходом на другие экраны
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  60 минут
*/

// TODO implement this page
class Home extends StatefulWidget {
  final IGoodService goodService;

  const Home({super.key, required this.goodService});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO implement navigation
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: FloatingActionButton(
          onPressed: () {
            // TODO implement navigation to cart
          },
          shape: const CircleBorder(),
          child: SvgPicture.asset(
            'images/icons/bag.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'images/icons/home.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).hintColor,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () => setState(() => _currentIndex = 0),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'images/icons/favorite.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).hintColor,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () => setState(() => _currentIndex = 1),
            ),

            SizedBox(width: 48),

            IconButton(
              icon: SvgPicture.asset(
                'images/icons/notification.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).hintColor,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () => setState(() => _currentIndex = 2),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'images/icons/profile.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).hintColor,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () => setState(() => _currentIndex = 3),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sidemenu');
              },
              icon: SvgPicture.asset('images/icons/drawer.svg'),
            ),
            Text("Главная"),
            CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'images/icons/bag.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).hintColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'images/icons/search.svg',
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).hintColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            'Поиск',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                IconButton.filled(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/icons/sliders.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Категории'),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return FutureBuilder(
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                snapshot.data!.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          item,
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        );
                      },
                      future: widget.goodService.getCategories(),
                    );
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Популярное'),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return FutureBuilder(
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                snapshot.data!.map((item) {
                                  return GoodCard(
                                    good: item,
                                    onFavorite: (id, isFavorite) {},
                                    onCart: (id, isInCart) {},
                                  );
                                }).toList(),
                          ),
                        );
                      },
                      future: widget.goodService.getCategoryGoods("Popular", 0),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoodCard extends StatelessWidget {
  final Good good;

  final Function(int id, bool isFavorite)? onFavorite;
  final Function(int id, bool isInCart)? onCart;

  const GoodCard({super.key, required this.good, this.onFavorite, this.onCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with overlay buttons
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 130,
                        color: Theme.of(context).cardColor,
                        child: Image.asset(
                          'images/onboarding3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text('Product Title'),
                      const SizedBox(height: 8),
                      const Text('₽99.99'),
                    ],
                  ),
                ),

                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon:
                          good.isFavorite()
                              ? Icon(
                                Icons.favorite,
                                color: Theme.of(context).colorScheme.error,
                              )
                              : Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).hintColor,
                              ),
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        if (onFavorite != null) {
                          onFavorite!(good.getID(), !good.isFavorite());
                        }
                      },
                    ),
                  ),
                ),

                Positioned(
                  bottom: -16,
                  right: -16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 12),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          if (onCart != null) {
                            onCart!(good.getID(), !(good.isInCart()));
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
