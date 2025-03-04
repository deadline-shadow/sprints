import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sprints_test/common/good.dart';
import 'package:sprints_test/domain/good_service.dart';
import 'package:sprints_test/presentation/cart.dart';
import 'package:sprints_test/presentation/favorite.dart';
import 'package:sprints_test/presentation/home.dart';
import 'package:sprints_test/presentation/notifications.dart';
import 'package:sprints_test/presentation/onboarding.dart';
import 'package:sprints_test/presentation/orders.dart';
import 'package:sprints_test/presentation/popular.dart';
import 'package:sprints_test/presentation/profile.dart';
import 'package:sprints_test/presentation/search.dart';
import 'package:sprints_test/presentation/side_menu.dart';
import 'package:sprints_test/presentation/signup.dart';
import 'package:sprints_test/presentation/signin.dart';
import 'package:sprints_test/presentation/theme.dart';

// TODO Sprint А
// TODO Sprint Б
// TODO Sprint В
// TODO Sprint Г
// TODO Sprint Д
// TODO Sprint Е
// TODO Sprint Ж

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      routes: {
        '/signin':
            (context) => SignIn(
              onLogin: (email, password) {
                return true;
              },
            ),
        '/onboarding': (context) => Onboarding(),
        '/': (context) => Home(goodService: GoodServiceMock()),
        '/sidemenu': (context) => SideMenu(),
        '/profile': (context) => Profile(),
        '/favorite': (context) => Favorite(),
        '/notifications': (context) => Notifications(),
        '/orders': (context) => Orders(),
        '/popular': (context) => Popular(),
        '/cart': (context) => Cart(),
        '/search': (context) => Search(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}

class GoodServiceMock implements IGoodService {
  final List<String> categories = ["Все", "Outdoor", "Tennis", "Running"];

  @override
  Future<String?> findCategoryByID(int categoryId) async {
    return categories.elementAtOrNull(categoryId);
  }

  @override
  Future<Good?> findGoodByID(int goodID) async {
    return GoodMock();
  }

  @override
  Future<List<Good>> findGoodsContaining(String text, int page) async {
    if (GoodMock().getTitle().contains(text)) {
      return [GoodMock()];
    }

    return [];
  }

  @override
  Future<List<String>> getCategories() async {
    return categories;
  }

  @override
  Future<List<Good>> getCategoryGoods(String category, int page) async {
    if (category == "Populer") {
      return [GoodMock()];
    }
    return [];
  }

  @override
  Future<List<Good>> getGoods(int page) async {
    return [GoodMock()];
  }
}

class GoodMock implements Good {
  @override
  String getCategory() {
    return "Популярное";
  }

  @override
  DateTime getCreatedAt() {
    return DateTime.now();
  }

  @override
  String getDescription() {
    return "";
  }

  @override
  int getID() {
    return 1;
  }

  @override
  String getPicture() {
    return "abc";
  }

  @override
  double getPrice() {
    return 752.00;
  }

  @override
  String getTitle() {
    return "Nike Air Max";
  }

  @override
  Future<bool> isFavorite() async {
    return false;
  }

  @override
  Future<bool> isInCart() async {
    return false;
  }
}
