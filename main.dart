import 'package:flutter/material.dart';
import 'screens/grid_generator.dart';
import 'screens/grid_decoder.dart';
import 'screens/dms_converter.dart';

void main() {
  runApp(AirspaceGridApp());
}

class AirspaceGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '空域网格编码系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    GridGeneratorScreen(),
    GridDecoderScreen(),
    DMSConverterScreen(),
  ];

  final List<String> _titles = ['网格编码', '网格解析', '度分秒转换'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: '编码'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '解析'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: '转换'),
        ],
      ),
    );
  }
}