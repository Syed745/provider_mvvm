import 'package:flutter/material.dart';
import 'package:mvvm/res/component/RoundeButton.dart';
import 'package:mvvm/utils/routes/routesName.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/authView.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  FocusNode emailNode = FocusNode();

  FocusNode passwordNode = FocusNode();

  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthView>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                focusNode: emailNode,
                onFieldSubmitted: (value) {
                  Utils.focusField(context, emailNode, passwordNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: obsecurePassword.value,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: () {
                            obsecurePassword.value = !obsecurePassword.value;
                          },
                          child: Icon(obsecurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                    focusNode: passwordNode,
                  );
                },
              ),
              SizedBox(
                height: hight * .085,
              ),
              RoundedButton(
                  loading: authViewModel.signUpLoading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flashbarMessage('Please Enter email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flashbarMessage('Please Enter password', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flashbarMessage(' password must 6 digit', context);
                    } else {
                      Map data = {
                        "email": _emailController.text,
                        "password": _passwordController.text
                      };
                      authViewModel.signUpApi(data, context);
                      print('hit API');
                    }
                  },
                  title: 'SignUp'),
              SizedBox(
                height: hight * .085,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: const Text("Already have an account Login"),
              ),
            ],
          ),
        ));
  }
}
