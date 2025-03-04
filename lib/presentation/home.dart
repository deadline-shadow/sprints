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
                          //use SingleChildScrollView to allow natural height
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
            child: Column(children: []),
          ),
        ],
      ),
    );
  }
}
