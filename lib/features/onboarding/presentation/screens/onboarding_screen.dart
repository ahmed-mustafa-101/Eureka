import 'package:eureka/core/design_system/colors/app_colors.dart';
import 'package:eureka/core/design_system/spacing/app_spacing.dart';
import 'package:eureka/core/design_system/widgets/buttons/app_button.dart';
import 'package:eureka/features/onboarding/data/onboarding_page_data.dart';
import 'package:eureka/features/onboarding/presentation/widgets/onboarding_dot_indicator.dart';
import 'package:eureka/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  bool get _isLastPage => _currentIndex == pages.length - 1;

  void _onNextPressed() {
    if (_isLastPage) {
      widget.onFinished();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          child: Column(
            children: [
              // Skip button row
              Row(
                children: [
                  TextButton(
                    onPressed: widget.onFinished,
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPageView(model: pages[index]);
                  },
                ),
              ),
              // Bottom section
              OnboardingDotIndicator(
                count: pages.length,
                currentIndex: _currentIndex,
              ),
              const Gap(AppSpacing.space24),
              AppButton(
                text: _isLastPage ? 'متابعه' : 'التالي',
                onPressed: _onNextPressed,
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
              ),
              const Gap(AppSpacing.space32),
            ],
          ),
        ),
      ),
    );
  }
}
