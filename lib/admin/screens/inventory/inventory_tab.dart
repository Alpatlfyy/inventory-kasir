import 'package:flutter/material.dart';

class InventoryTab extends StatefulWidget {
  const InventoryTab({super.key});

  @override
  State<InventoryTab> createState() => _InventoryTabState();
}

class _InventoryTabState extends State<InventoryTab> {
  String selectedFilter = 'Produk';
  final List<String> filters = ['S/M/L', 'Kategori', 'Produk', 'Penyimpanan'];

  final List<Map<String, dynamic>> dummyProducts = [
    {
      'image':
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&q=80&w=400',
      'sku': 'SKU: PRO-001',
      'title': 'Premium Wrist Watch',
      'stock': '42 Unit',
      'price': 'Rp 1.250.000',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&q=80&w=400',
      'sku': 'SKU: PRO-002',
      'title': 'Audio Studio HD-1',
      'stock': '5 Unit',
      'price': 'Rp 3.799.000',
      'lowStock': true,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=400',
      'sku': 'SKU: PRO-003',
      'title': 'Nitro Running Shoes',
      'stock': '125 Unit',
      'price': 'Rp 890.000',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&q=80&w=400',
      'sku': 'SKU: PRO-004',
      'title': 'Snap-It Instant Camera',
      'stock': '12 Unit',
      'price': 'Rp 1.450.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildTitle(),
                  const SizedBox(height: 16),
                  _buildFilterChips(),
                  const SizedBox(height: 16),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  ...dummyProducts.map((p) => _buildProductCard(p)),
                  _buildAddProductButton(),
                  const SizedBox(height: 80), // padding for FAB
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[700],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                'Indigo Ledger',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              const Icon(Icons.notifications_none, color: Colors.blue),
              Positioned(
                right: 2,
                top: 2,
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
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'eCommerce\nManagement',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.2),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = filter == selectedFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.blue[700] : Colors.grey[600],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    selectedFilter = filter;
                  });
                }
              },
              backgroundColor: Colors.grey[100],
              selectedColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                ),
              ),
              elevation: isSelected ? 2 : 0,
              padding: const EdgeInsets.symmetric(horizontal: 4),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari produk...',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              product['image'],
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['sku'],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stok',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(
                          product['stock'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: product['lowStock'] == true
                                ? Colors.orange[700]
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Harga',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(
                          product['price'],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddProductButton() {
    return InkWell(
      onTap: () {
        // logic to add product
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.blue.withOpacity(0.3),
            width: 2,
            style: BorderStyle
                .solid, // Can't easily do native dotted without package or custom painter
          ),
        ),
        child: Column(
          children: [
            Icon(Icons.add, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              'Tambah Produk Baru',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
