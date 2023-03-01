import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/navigation/app_router.dart';
import '../../core/extension/string_extension_custom.dart';
import '../../core/init/lang/locale_keys.g.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HealthRoute(),
        WorkRoute(),
        ReminderRoute(),
        ProfileRoute(),
      ],
      animationCurve: Curves.easeInBack,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
                label: LocaleKeys.page_name_health.locale,
                icon: const Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: LocaleKeys.page_name_work.locale,
                icon: const Icon(Icons.desktop_windows)),
            BottomNavigationBarItem(
                label: LocaleKeys.page_name_reminders.locale,
                icon: const Icon(Icons.notifications_sharp)),
            BottomNavigationBarItem(
                label: LocaleKeys.page_name_profile.locale,
                icon: const Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
