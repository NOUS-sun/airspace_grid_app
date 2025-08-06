import 'package:flutter/material.dart';

class GridDecoderScreen extends StatefulWidget {
  @override
  _GridDecoderScreenState createState() => _GridDecoderScreenState();
}

class _GridDecoderScreenState extends State<GridDecoderScreen> {
  final _gridCodeCtrl = TextEditingController();
  String _result = '';

  void _decode() {
    setState(() {
      _result = '解析网格编码：${_gridCodeCtrl.text}\n\n（功能开发中，敬请期待）';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('输入网格编码（1~9位）', style: Theme.of(context).textTheme.titleMedium),
          TextField(
            controller: _gridCodeCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例如：123AA1201',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _decode,
              child: Text('解析网格'),
            ),
          ),
          SizedBox(height: 20),
          Text('解析结果：', style: Theme.of(context).textTheme.titleMedium),
          Text(_result),
        ],
      ),
    );
  }
}