import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onNavTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onNavTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(index: 0, icon: Icons.home_filled, label: 'Beranda'),
          _buildNavItem(index: 1, icon: Icons.receipt_long_outlined, label: 'Transaksi'),
          _buildNavItem(index: 2, icon: Icons.people, label: 'Pelanggan'),
          _buildNavItem(index: 3, icon: Icons.more_horiz, label: 'Lainnya'),
        ],
      ),
    );
  }

  Widget _buildNavItem({required int index, required IconData icon, required String label}) {
    bool isActive = selectedIndex == index || (index == 3 && selectedIndex > 3);
    return GestureDetector(
      onTap: () => onNavTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
             decoration: BoxDecoration(
               color: isActive ? const Color(0xFFEAF5ED) : Colors.transparent,
               borderRadius: BorderRadius.circular(20),
             ),
             child: Icon(
               icon,
               color: isActive ? const Color(0xFF0F6E31) : Colors.black54,
               size: 24,
             ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF0F6E31) : Colors.black54,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
