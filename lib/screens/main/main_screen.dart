import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stocks/screens/main/settings_screen.dart';
import 'package:stocks/screens/main/stodk_screen.dart';

final selectedIndexProvider = StateProvider((ref) {
  return 0;
});

class MainScreen extends StatelessWidget {
  static const _screens = [StockScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedIndex = ref.watch(selectedIndexProvider.state);
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            body: _screens[selectedIndex.state],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory),
                  label: "在庫",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "設定",
                ),
              ],
              currentIndex: selectedIndex.state,
              onTap: (value) {
                selectedIndex.state = value;
              },
            ),
          ),
        );
      },
    );
  }
}
