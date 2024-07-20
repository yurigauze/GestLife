import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/colors.dart';

class CosmeticBottomNavigationBar extends StatefulWidget {
  const CosmeticBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CosmeticBottomNavigationBar> createState() =>
      _CosmeticBottomNavigationBarState();
}

class _CosmeticBottomNavigationBarState
    extends State<CosmeticBottomNavigationBar> {
  int index = 0;

  final screens = [
    Center(child: Text('Início Screen')),
    Center(child: Text('Pedidos Screen')),
    Center(child: Text('Produtos Screen')),
    Center(child: Text('Marcas Screen')),
    Center(child: Text('Clientes Screen')),
    Center(child: Text('Conta Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: cosmeticPrimaryColor.withOpacity(.2),
          height: 60,
          elevation: 10,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.spa_outlined,
              ),
              label: 'Início',
              selectedIcon: Icon(
                Icons.spa,
                color: cosmeticPrimaryColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.inventory_outlined,
              ),
              label: 'Pedidos',
              selectedIcon: Icon(
                Icons.inventory_rounded,
                color: cosmeticPrimaryColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'Produtos',
              selectedIcon: Icon(
                Icons.shopping_bag_rounded,
                color: cosmeticPrimaryColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.dashboard,
              ),
              label: 'Marcas',
              selectedIcon: Icon(
                Icons.space_dashboard_rounded,
                color: cosmeticPrimaryColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.supervisor_account_outlined,
              ),
              label: 'Clientes',
              selectedIcon: Icon(
                Icons.supervisor_account,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Conta',
              selectedIcon: Icon(
                Icons.account_circle_rounded,
                color: cosmeticPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
