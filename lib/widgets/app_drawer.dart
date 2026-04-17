import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final ValueChanged<int>? onMenuSelected;
  
  const AppDrawer({super.key, this.onMenuSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF181A25),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF181A25),
                        ),
                        child: const Icon(Icons.inventory_2, color: Color(0xFF1CB5E0), size: 32),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'stokku',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: const Color(0xFF1CB5E0),
                              fontSize: 26,
                              letterSpacing: -1,
                            ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white54, size: 28),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFF222432),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
                leading: const Icon(Icons.grid_view_rounded, color: Color(0xFF1CB5E0)),
                title: Text(
                  'Beranda',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  if (onMenuSelected != null) onMenuSelected!(0);
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'MENU',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white38,
                      fontSize: 12,
                      letterSpacing: 1.5,
                    ),
              ),
            ),
            const SizedBox(height: 12),
            _buildExpandableDrawerItem(
              context: context,
              icon: Icons.shopping_cart_outlined,
              iconColor: const Color(0xFF1CB5E0),
              title: 'eCommerce',
              children: [
                {'title': 'Unit', 'index': 6},
                {'title': 'Kategori', 'index': 7},
                {'title': 'Produk', 'index': 8},
                {'title': 'Pesanan', 'index': 9},
              ],
              onMenuSelected: onMenuSelected,
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.person_outline, 
              title: 'Pelanggan', 
              onTap: () {
                Navigator.pop(context);
                if (onMenuSelected != null) onMenuSelected!(2);
              }
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.shopping_basket_outlined, 
              title: 'Pembelian', 
              onTap: () {
                Navigator.pop(context);
                if (onMenuSelected != null) onMenuSelected!(3);
              }
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.person_outline, 
              title: 'Data Supplier', 
              onTap: () {
                Navigator.pop(context);
                if (onMenuSelected != null) onMenuSelected!(5);
              }
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.precision_manufacturing_outlined, 
              title: 'Produksi', 
              onTap: () {
                Navigator.pop(context);
                if (onMenuSelected != null) onMenuSelected!(4);
              }
            ),
          ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({required BuildContext context, required IconData icon, required String title, VoidCallback? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      leading: Icon(icon, color: Colors.white24, size: 24),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white60,
              fontSize: 15,
            ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white24, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildExpandableDrawerItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<Map<String, dynamic>> children,
    ValueChanged<int>? onMenuSelected,
  }) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24.0),
        leading: Icon(icon, color: iconColor, size: 24),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
        ),
        iconColor: Colors.white,
        collapsedIconColor: Colors.white60,
        children: children.map((item) {
          return InkWell(
            onTap: () {
              Navigator.pop(context);
              if (onMenuSelected != null) onMenuSelected(item['index']);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 64.0, right: 24.0, top: 12.0, bottom: 12.0),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    item['title'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
