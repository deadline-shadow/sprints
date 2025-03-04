import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
− Описание назначения класса
  Экран для входа в существующий аккаунт
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  60 минут
*/

// TODO implement this page
class SignIn extends StatefulWidget {
  final bool Function(String email, String password)? onLogin;

  const SignIn({super.key, this.onLogin});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${"welcome".tr()}!",
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "fill_details_continue_social_media".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "email".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "xyz@gmail.com",
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "password".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: isPasswordHidden,
                      style: Theme.of(context).textTheme.labelMedium,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          icon:
                              isPasswordHidden
                                  ? SvgPicture.asset(
                                    "images/icons/eye_close.svg",
                                  )
                                  : SvgPicture.asset(
                                    "images/icons/eye_open.svg",
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "forgot_password".tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          var email = emailController.text;
                          var password = passwordController.text;

                          if (password.isEmpty) {
                            var snackBar = SnackBar(
                              content: Text("password".tr()),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            );

                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);

                            return;
                          }

                          if (!isValidEmail(email)) {
                            var snackBar = SnackBar(
                              content: Text("email".tr()),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            );

                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);

                            return;
                          }

                          if (widget.onLogin != null) {
                            var authorized = widget.onLogin!(email, password);
                            if (!authorized) {
                              var snackBar = SnackBar(
                                content: Text(
                                  "fill_details_continue_social_media".tr(),
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.error,
                              );

                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);

                              return;
                            }
                          }

                          Navigator.pushReplacementNamed(context, '/');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              16.0,
                              0,
                              16.0,
                            ),
                            child: Text(
                              "sign_in".tr(),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "${"new_user_create_account".tr().split('?')[0]}?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text(
                    "new_user_create_account".tr().split('?')[1],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  if (email.isEmpty) {
    return false;
  }

  RegExp regExp = RegExp(
    r"^[a-z0-9]+@[a-z0-9]{2,}.+\.[a-z0-9]+$",
    caseSensitive: false,
    multiLine: false,
  );

  if (!regExp.hasMatch(email)) {
    return false;
  }

  return true;
}
