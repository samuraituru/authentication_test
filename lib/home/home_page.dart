import 'package:authentication_test/home/home_model.dart';
import 'package:authentication_test/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Consumer<HomeModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    FloatingActionButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                          ),
                      );
                    }
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