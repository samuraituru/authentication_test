import 'package:authentication_test/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Consumer<HomeModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                        child:TextFormField(
                          decoration: InputDecoration(
                              labelText: "メールアドレス"
                          ),
                          onChanged: (String value) {
                          },
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
                      child:TextFormField(
                        decoration: InputDecoration(
                            labelText: "パスワード（8～20文字）"
                        ),
                        obscureText: true,  // パスワードが見えないようRにする
                        maxLength: 20,  // 入力可能な文字数
                        onChanged: (String value) {
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
