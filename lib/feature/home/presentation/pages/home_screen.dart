import 'package:flutter/material.dart';
import 'package:top_institute/core/widget/app_theme.dart';
import 'package:top_institute/feature/home/presentation/pages/attendance_screen.dart';
import 'package:top_institute/feature/home/presentation/pages/files_screen.dart';
import 'package:top_institute/feature/home/presentation/pages/lectures_screen.dart';
import 'package:top_institute/feature/home/presentation/pages/marks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> navigationItems = [
    {
      'icon': Icons.school,
      'label': 'Lectures',
    },
    {
      'icon': Icons.calendar_month,
      'label': 'Attendances',
    },
    {
      'icon': Icons.grade,
      'label': 'Marks',
    },
    {
      'icon': Icons.folder,
      'label': 'Files',
    },
  ];

  int currentIndex = 0;

  final List<Widget> screens = const [
    LecturesScreen(),
    AttendanceScreen(),
    MarksScreen(),
    FilesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; // isDark

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
        ),
        child: Row(
          children: [
            for (int i = 0; i < navigationItems.length; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = i;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        navigationItems[i]['icon'],
                        color: i == currentIndex
                            ? kColorMain
                            : (isDarkMode ? Colors.white70 : kColorOffBlack),
                        size: i == currentIndex ? 28 : 24,
                      ),
                      Text(
                        navigationItems[i]['label'],
                        style: TextStyle(
                          color: i == currentIndex
                              ? kColorMain
                              : (isDarkMode ? kColorwhite : kColorOffBlack),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
