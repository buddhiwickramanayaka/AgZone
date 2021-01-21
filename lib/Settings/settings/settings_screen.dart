import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'languages_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool use = true;
  bool darkmode = true;

  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: Text(
            "Settings",
          )),
      body: SettingsList(
        // backgroundColor: Colors.orange,
        sections: [
          SettingsSection(
            title: 'Common',
            // titleTextStyle: TextStyle(fontSize: 30),
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                title: 'Help',
                leading: Icon(Icons.help),
                onTap: () => print('e'),
              ),
              SettingsTile.switchTile(
                title: 'Enable Dark Mode',
                leading: Icon(Icons.lightbulb),
                switchValue: darkmode,
                onToggle: (bool value) {
                  setState(() {
                    darkmode = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: use,
                onToggle: (bool value) {
                  setState(() {
                    use = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Enable Notifications',
                  leading: Icon(Icons.notifications_active),
                  switchValue: notificationsEnabled,
                  onToggle: (bool value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  }),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                SizedBox(height: 200),
                Text(
                  'Version: 1.21.01',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
