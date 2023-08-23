import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import '../../home/components/home.dart';
import '../../settings/components/settings.dart';
import '../../settings/components/update_login_pin.dart';
import '../../statement/components/statement.dart';
import '../controller/dashboard_controller.dart';

final CustomTheme theme = CustomTheme();
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bottomNavController = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: bottomNavController.tabIndex.value,
            children: const [Statement(), Home(), Settings()],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              elevation: 0,
              unselectedItemColor: theme.black,
              selectedItemColor: theme.orange,
              currentIndex: bottomNavController.tabIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: bottomNavController.changeTabIndex,
              items: [
                // _bottomNavigationBarItem(icon: 'assets/images/statement.png', label: "Statement"),
                // _bottomNavigationBarItem(icon: 'assets/images/home.png', label: "Home"),
                // _bottomNavigationBarItem(icon: 'assets/images/settings.png', label: "Settings")

                _bottomNavigationBarItem(
                    icon: Icons.compare_arrows, label: "Statement"),
                _bottomNavigationBarItem(
                    icon: Icons.home_filled, label: "Home"),
                _bottomNavigationBarItem(
                    icon: Icons.settings, label: "Settings")
              ]),
        ));
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
