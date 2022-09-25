import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

import '../../../classes/theme.dart';

class DeviceAppsWidget extends StatefulWidget {
  const DeviceAppsWidget({Key? key}) : super(key: key);

  @override
  State<DeviceAppsWidget> createState() => _DeviceAppsWidgetState();
}

class _DeviceAppsWidgetState extends State<DeviceAppsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceApps.getInstalledApplications(
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
        includeSystemApps: true,
      ),
      builder: (context, snapshot) {
        if (ConnectionState.waiting == snapshot.connectionState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return LiTheme.isError(snapshot.error.toString());
        }
        final apps = snapshot.data as List<dynamic>;
        return Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 25),
          child: GestureDetector(
            child: Container(
              width: 350,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: LiTheme.onBgColor(),
              ),
              // Container(
              //   margin: EdgeInsets.all(10),
              //   width: 100,
              //   height: 100,
              //   color: Colors.green,
              // ),
              child: SingleChildScrollView(
                child: GridView.builder(
                  itemCount: apps.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () => apps[i].openApp(),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      child: Column(
                        children: [
                          Image.memory(
                            apps[i].icon,
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(height: 15),
                          LiTheme.text(apps[i].appName),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
