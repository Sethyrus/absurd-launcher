import 'package:absurd_launcher/src/widgets/tx.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  final Application app;
  final double width;

  const AppTile(
    this.app, {
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 8),
      child: InkWell(
        onTap: () {
          DeviceApps.openApp(app.packageName);
        },
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              if (app is ApplicationWithIcon)
                SizedBox(
                  width: width * 0.5,
                  child: Image.memory(
                    (app as ApplicationWithIcon).icon,
                  ),
                ),
              const SizedBox(height: 6),
              Tx(
                app.appName,
                centerText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
