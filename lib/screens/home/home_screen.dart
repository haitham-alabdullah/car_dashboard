import 'package:flutter/material.dart';

import 'bottom_bottons/bottom_botton_item_add.dart';
import 'bottom_bottons/bottom_button_item.dart';
import 'google_navigation/google_navigation_widget.dart';
import 'music_player/music_player_widget.dart';
import 'odo_metter/odo_metter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.arguments, {Key? key}) : super(key: key);
  final dynamic arguments;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      key: const ValueKey('main_row'),
      children: [
        Expanded(
          child: Column(
            key: const ValueKey('main_column'),
            children: [
              const Expanded(child: OdoMater()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                key: const ValueKey('buttons_row'),
                children: const [
                  BottomButtonItem(
                    key: ValueKey('Engine'),
                    title: 'Engine',
                    icon: Icons.car_rental_rounded,
                    value: 'ON',
                  ),
                  BottomButtonItem(
                    key: ValueKey('AC'),
                    title: 'AC',
                    icon: Icons.ac_unit_rounded,
                    value: '16° C',
                  ),
                  BottomButtonItem(
                    key: ValueKey('Fans'),
                    title: 'Fans',
                    icon: Icons.mode_fan_off_rounded,
                    value: 'Speed 3',
                  ),
                  BottomButtonItem(
                    key: ValueKey('Volume'),
                    title: 'Volume',
                    icon: Icons.volume_up_rounded,
                    value: '40%',
                  ),
                  BottomButtonItemAdd()
                ],
              ),
            ],
          ),
        ),
        Column(
          key: const ValueKey('2nd_column'),
          children: const [
            Expanded(
              child: GoogleNavigationsWidget(
                title: 'Engine',
                icon: Icons.car_rental_rounded,
                value: 'ON',
              ),
            ),
            MusicPlayerWidget()
          ],
        ),
      ],
    );
  }
}
