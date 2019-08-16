import 'package:flutter/material.dart';

class Sort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // 进行Named页面跳转 传递参数
          Navigator.pushNamed(context, '/detail');
        },
        child: Text("分类页"),
      ),
    );
  }
}