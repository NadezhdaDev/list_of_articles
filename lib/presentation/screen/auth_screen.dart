import 'package:flutter/material.dart';
import 'package:list_of_articles/presentation/navigation/navigation.dart';
import '../navigation/la_route_path.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _userPasswordController;
  bool _passwordVisible = true;
  bool _isError = false;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _userPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Возможно, лучшим методом построения страницы было бы сделась у колонки MainAxisSize.min
    // и убрать вычисляемую высоту, и в таком виде обернуть его в СкроллВиджет, но т.к. я не знаю, предполагается ли
    // использование планшета(какие по размеру делать отступы), этот вариант показался мне более удачным, т.к
    // spaceAround сам расположит виджеты по всему полотну активити

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: _getScreenHeight(context),
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Авторизация',
                        style: TextStyle(
                          fontFamily: 'Destroy',
                          fontSize: 30,
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter your login',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    _isError
                        ? const Text(
                            'Ошибка. Проверьте правильность ввода данных',
                            style: TextStyle(color: Colors.red),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => _checkData(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: const Text(
                    'Авторизоваться',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getScreenHeight(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    final screenHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    return screenHeight;
  }

  void _checkData() {
    final isRight = _userNameController.text == 'admin' &&
        _userPasswordController.text == 'password123';

    isRight
        ? navigate(
            LARoutePath.articlesScreen,
            replace: true,
          )
        : setState(
            () => _isError = true,
          );
  }
}
