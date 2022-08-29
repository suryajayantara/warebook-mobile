import 'package:flutter/material.dart';

class DashboardPageNew extends StatefulWidget {
  const DashboardPageNew({Key? key}) : super(key: key);

  @override
  State<DashboardPageNew> createState() => _DashboardPageNewState();
}

class _DashboardPageNewState extends State<DashboardPageNew> {
  int _selectedIndex = 0;
  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(children: [
        ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            return Text('Hello');
          },
        ),
        Text('2')
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined), label: 'Thesis'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'PKM'),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined), label: 'Journal'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTaped,
      ),
    ));
  }
}
