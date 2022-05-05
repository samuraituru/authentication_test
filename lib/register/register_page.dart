import 'package:authentication_test/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (_) => RegisterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('RegisterPage'),
        ),
        body: Consumer<RegisterModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                        child:TextField(
                          controller: model.titleController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          onChanged: (inputtext) {
                            model.setEmail(inputtext);
                          },
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
                      child: TextField(
                        controller: model.authorController,
                        decoration: InputDecoration(
                          hintText: 'パスワード',
                        ),
                        obscureText: true,  // パスワードが見えないようRにする
                        maxLength: 20,  // 入力可能な文字数
                        onChanged: (inputpass) {
                          model.setPassword(inputpass);
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        model.startLoading();

                        // 追加の処理
                        try {
                          await model.signUp();
                          Navigator.of(context).pop();
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        } finally {
                          model.endLoading();
                        }
                      },
                      child: Text('登録する'),
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
