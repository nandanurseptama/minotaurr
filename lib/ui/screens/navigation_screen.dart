import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minotaur/ui/screens/home_screen.dart';
import 'package:minotaur/ui/screens/settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  final GetIt instance;
  const NavigationScreen({super.key, required this.instance});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final ValueNotifier<int> _currentNavigationIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _currentNavigationIndex,
        builder: (context, currentIndex, _) {
          return Scaffold(
            bottomNavigationBar: _bottomNavigation(currentIndex),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                return Container(
                  constraints: constraints,
                  child: IndexedStack(
                    index: currentIndex,
                    children: [
                      HomeScreen(
                        instance: widget.instance,
                      ),
                      SettingsScreen(instance: widget.instance)
                    ],
                  ),
                );
              }),
            ),
          );
        });
  }

  Widget _bottomNavigation(int currentIndex) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          return onChangeNavigation(
              currentIndex: currentIndex, newIndexValue: value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ]);
  }

  void onChangeNavigation({
    required int newIndexValue,
    required int currentIndex,
  }) {
    if (newIndexValue == currentIndex) {
      return;
    }
    setState(() {
      _currentNavigationIndex.value = newIndexValue;
    });
  }
}
