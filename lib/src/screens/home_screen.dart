import 'package:absurd_launcher/src/widgets/app_tile.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loaded = false;
  List<Application> _appList = [];
  final colsNumber = 4;
  final double padding = 8;

  @override
  void initState() {
    DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    ).then((appList) {
      setState(() {
        _loaded = true;
        _appList = appList
          ..sort(
            (a, b) => a.appName.toLowerCase().compareTo(
                  b.appName.toLowerCase(),
                ),
          );
      });
    }).whenComplete(() => setState(() => _loaded = true));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) return const SizedBox();

    final double tileWidth = (MediaQuery.of(context).size.width / colsNumber) -
        ((padding * 2) / colsNumber);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Wrap(
                  children: List.generate(
                    _appList.length,
                    (i) {
                      return SizedBox(
                        width: tileWidth,
                        child: AppTile(
                          _appList[i],
                          width: tileWidth,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
