import 'package:car/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../classes/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.arguments, {Key? key}) : super(key: key);
  final dynamic arguments;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(
      builder: (context) {
        return Center(
          child: Text(
            '${widget.arguments}',
            style: LiTheme.textStyle(),
          ),
        );
      },
    );
  }
}
