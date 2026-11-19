import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/features/main_layout/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:eureka/features/teacher_groups/presentation/screens/teacher_groups_list_screen.dart';
import 'package:eureka/features/teacher_home/presentation/screens/teacher_home_screen.dart';
import 'package:eureka/features/teacher_subjects/presentation/screens/teacher_subjects_list_screen.dart';
import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    TeacherHomeScreen(),
    TeacherGroupsListScreen(),
    TeacherSubjectsListScreen(),
    Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: Text('المهام')),
    ),
    Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: Text('الماليه')),
    ),
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
