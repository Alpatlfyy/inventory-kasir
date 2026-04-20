import 'package:flutter/material.dart';
import 'dashboard/admin_dashboard_screen.dart';
import 'inventory/inventory_tab.dart';
import 'customer/customer_tab.dart';
import 'more/more_tab.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const AdminDashboardScreen(),
    const InventoryTab(),
    const CustomerTab(),
    const MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue[700],
          unselectedItemColor: Colors.grey[400],
          selectedFontSize: 10,
          unselectedFontSize: 10,
          elevation: 0,
          backgroundColor: Colors.white, // Ensure white background
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'BERANDA',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: 'INVENTARIS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'PELANGGAN',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'LAINNYA',
            ),
          ],
        ),
      ),
    );
  }
}
