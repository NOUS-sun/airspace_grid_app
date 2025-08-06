import 'package:flutter/material.dart';

class GridGeneratorScreen extends StatefulWidget {
  @override
  _GridGeneratorScreenState createState() => _GridGeneratorScreenState();
}

class _GridGeneratorScreenState extends State<GridGeneratorScreen> {
  // 输入控制器
  final _degLonCtrl = TextEditingController();
  final _minLonCtrl = TextEditingController();
  final _secLonCtrl = TextEditingController();
  final _degLatCtrl = TextEditingController();
  final _minLatCtrl = TextEditingController();
  final _secLatCtrl = TextEditingController();

  String _result = '';

  void _generate() {
    // 这里暂时模拟结果，后续替换为真实逻辑
    setState(() {
      _result = '''
一级网格编码：123AA
二级网格编码：123AA1
三级网格编码：123AA12
四级网格编码：123AA1201
      '''.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('输入经度（东经）', style: Theme.of(context).textTheme.titleMedium),
          _buildDMSInput('度', _degLonCtrl),
          _buildDMSInput('分', _minLonCtrl),
          _buildDMSInput('秒', _secLonCtrl),

          SizedBox(height: 20),
          Text('输入纬度（北纬）', style: Theme.of(context).textTheme.titleMedium),
          _buildDMSInput('度', _degLatCtrl),
          _buildDMSInput('分', _minLatCtrl),
          _buildDMSInput('秒', _secLatCtrl),

          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: _generate,
              child: Text('生成网格编码'),
            ),
          ),
          SizedBox(height: 20),
          Text('生成结果：', style: Theme.of(context).textTheme.titleMedium),
          Text(_result),
        ],
      ),
    );
  }

  Widget _buildDMSInput(String label, TextEditingController ctrl) {
    return Row(
      children: [
        Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: ctrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}