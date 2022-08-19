import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import '../../central/authentication/authentication_provider.dart';
import '../../central/widgets/my_sized_box.dart';
import '../../central/widgets/my_text.dart';
import 'package:provider/provider.dart';

import '../../central/widgets/my_loading_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: widgetList(context));
  }

  Widget widgetList(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: myText(
                        txt: "Elred Todo",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            myH(16),

            Consumer<AuthenticationProvider>(
              builder: (ctx, authProvider, _) {
                return authProvider.isLoading
                    ? const MyLoadingWidget()
                    : googleSignInButton(context);
              },
            ),

            // buildTermsText(),
          ],
        ),
      ),
    );
  }

  Widget googleSignInButton(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      shape: const StadiumBorder(),
      onPressed: () {
        context.read<AuthenticationProvider>().signInWithGoogle(context);
      },
    );
  }
}
