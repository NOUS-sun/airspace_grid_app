import 'package:flutter/material.dart';

class DMSConverterScreen extends StatefulWidget {
  @override
  _DMSConverterScreenState createState() => _DMSConverterScreenState();
}

class _DMSConverterScreenState extends State<DMSConverterScreen> {
  String _result = '';
  bool _isDecimalToDMS = true;

  final _decimalCtrl = TextEditingController();
  final _degCtrl = TextEditingController();
  final _minCtrl = TextEditingController();
  final _secCtrl = TextEditingController();
  final _dirCtrl = TextEditingController();

  void _convert() {
    setState(() {
      if (_isDecimalToDMS) {
        // 十进制 -> 度分秒（模拟）
        _result = '十进制转DMS：${_decimalCtrl.text} → （功能开发中）';
      } else {
        // DMS -> 十进制（模拟）
        _result = 'DMS转十进制：${_degCtrl.text}°${_minCtrl.text}' +
            ''''${_secCtrl.text}\" ${_dirCtrl.text} → （功能开发中）''';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio(
                value: true,
                groupValue: _isDecimalToDMS,
                onChanged: (v) => setState(() => _isDecimalToDMS = v == true),
              ),
              Text('十进制 → 度分秒'),
              SizedBox(width: 20),
              Radio(
                value: false,
                groupValue: _isDecimalToDMS,
                onChanged: (v) => setState(() => _isDecimalToDMS = v == true),
              ),
              Text('度分秒 → 十进制'),
            ],
          ),
          SizedBox(height: 20),
          if (_isDecimalToDMS)
            TextField(
              controller: _decimalCtrl,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '输入十进制度数',
              ),
            )
          else
            Column(
              children: [
                TextField(
                  controller: _degCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: '度'),
                ),
                TextField(
                  controller: _minCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: '分'),
                ),
                TextField(
                  controller: _secCtrl,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: '秒'),
                ),
                TextField(
                  controller: _dirCtrl,
                  decoration: InputDecoration(labelText: '方向 N/E/S/W'),
                ),
              ],
            ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _convert,
              child: Text('转换'),
            ),
          ),
          SizedBox(height: 20),
          Text('转换结果：', style: Theme.of(context).textTheme.titleMedium),
          Text(_result),
        ],
      ),
    );
  }
}