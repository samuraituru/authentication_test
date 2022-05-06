import 'package:authentication_test/addbook/addbook_page.dart';
import 'package:authentication_test/home/home_page.dart';
import 'package:authentication_test/list/list_model.dart';
import 'package:authentication_test/weight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListModel>(
      create: (_) => ListModel()..getBodys(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListPage'),
        ),
        body: Center(
          child: Consumer<ListModel>(builder: (context, model, child) {
            final List<Body>? bodys = model.bodys;

            if (bodys == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = bodys
                .map(
                  (body) => ListTile(
                    title: Text(body.weight),
                    subtitle: Text(body.fat),
                    leading: Text(body.imageURL),
                  ),
                )
                .toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton:
            Consumer<ListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              // 画面遷移
              final bool? added = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                ),
              );

              if (added != null && added) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('本を追加しました'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              model.getBodys();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
