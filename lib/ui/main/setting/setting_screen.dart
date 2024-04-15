import 'package:ecommerce_mobile/ui/widgets/padding_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../main.dart';
import '../../../res/app_locale.dart';

class SettingScreen extends StatefulWidget {
  static const String id = "setting_screen";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddingScreen(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('back')),
            Text(AppLocale.setting.getString(context)),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('English'),
                    onPressed: () {
                      _localization.translate('en');
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Việt nam'),
                    onPressed: () {
                      _localization.translate('vn');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
