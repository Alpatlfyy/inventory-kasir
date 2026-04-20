import 'package:flutter/material.dart';
import 'widgets/stat_card.dart';
import 'widgets/sales_chart_card.dart';
import 'widgets/insight_banner.dart';
import 'widgets/recent_activity_list.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FE,
      ), // Light background like in design
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildStatCards(),
              const SizedBox(height: 8),
              const SalesChartCard(),
              const SizedBox(height: 8),
              const InsightBanner(),
              const RecentActivityList(),
              const SizedBox(height: 80), // Padding for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              // Ideally use NetworkImage or AssetImage here.
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Text(
              'Indigo Ledger',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F52BA), // Deep blue title
              ),
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCards() {
    return Column(
      children: [
        StatCard(
          title: 'Total Penjualan',
          value: 'Rp 84.250.000',
          subtitle: '+12.5% compared to last month',
          subtitleColor: Colors.green[600],
          icon: const Icon(
            Icons.account_balance_wallet,
            color: Colors.blue,
            size: 20,
          ),
          iconBackgroundColor: Colors.blue.withOpacity(0.1),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Monthly',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        StatCard(
          title: 'Produk Aktif',
          value: '1,284',
          subtitle: '24 items added this week',
          icon: const Icon(
            Icons.inventory_2_outlined,
            color: Colors.indigo,
            size: 20,
          ),
          iconBackgroundColor: Colors.indigo.withOpacity(0.1),
        ),
        StatCard(
          title: 'Total Pesanan',
          value: '342',
          subtitle: '12 Orders pending fulfillment',
          subtitleColor: Colors.orange[700],
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.blue,
            size: 20,
          ),
          iconBackgroundColor: Colors.blue.withOpacity(0.1),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Today',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
