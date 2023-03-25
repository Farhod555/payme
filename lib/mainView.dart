import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payme/items/payme_item.dart';
import 'package:payme/states.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>{

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'My cards',
            style: TextStyle(color: Colors.white),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddPayme');
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return paymeItem(context, items[index]);
    }
      ),
      ),
    );
  }
}
