import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../OrderingSystem/ordershopsystem.dart';
import 'laundry_dashboard_screen.dart';

class AllShopsScreen extends StatefulWidget {
  final int userId;
  final String token;
  final bool isGuest;

  const AllShopsScreen({
    super.key,
    required this.userId,
    required this.token,
    this.isGuest = false,
  });

  @override
  State<AllShopsScreen> createState() => _AllShopsScreenState();
}

class _AllShopsScreenState extends State<AllShopsScreen> {
  bool _isLoading = true;
  List<LaundryShop> allShops = [];
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchAllShops();
  }

  Future<void> _fetchAllShops() async {
  try {
    setState(() => _isLoading = true);

    final response = await http.get(
      Uri.parse('http://localhost:5000/shops'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final shopsList = data is List ? data : data['shops'] as List;

      setState(() {
        allShops = shopsList.map((shop) {
          return LaundryShop(
            id: shop['id']?.toString() ?? '',
            name: shop['shop_name'] ?? '',
            image: shop['image'] ?? 'assets/default_shop.png',
            rating: 0.0, // Not needed anymore
            distance: shop['distance']?.toString() ?? 'N/A',
            isOpen: shop['is_open'] ?? false, // Make sure this is properly set in backend
            location: shop['location'] ?? 'Unknown Location',
            status: shop['status'] ?? 'Unknown',
            totalPrice: shop['total_price']?.toString() ?? 'N/A',
          );
        }).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load shops: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching shops: $e');
    setState(() {
      _errorMessage = 'Error loading shops: $e';
      _isLoading = false;
    });
  }
}

  Future<Map<String, dynamic>> _fetchCompleteShopData(String shopId) async {
    try {
      if (shopId.isEmpty) {
        throw Exception('Shop ID is empty');
      }

      final shopResponse = await http.get(
        Uri.parse('http://localhost:5000/shop/$shopId'),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      if (shopResponse.statusCode != 200) {
        throw Exception('Failed to load shop data: ${shopResponse.statusCode}');
      }

      final shopData = jsonDecode(shopResponse.body);

      final servicesResponse = await http.get(
        Uri.parse('http://localhost:5000/shop/$shopId/services'),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      final clothingResponse = await http.get(
        Uri.parse('http://localhost:5000/shop/$shopId/clothing'),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      final householdResponse = await http.get(
        Uri.parse('http://localhost:5000/shop/$shopId/household'),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      return {
        'id': shopId,
        'shop_name': shopData['shop_name'] ?? '',
        'image': shopData['image'] ?? 'assets/default_shop.png',
        'rating': shopData['rating'] ?? 0.0,
        'distance': shopData['distance'] ?? 'N/A',
        'is_open': shopData['is_open'] ?? false,
        'location': shopData['location'] ?? 'Unknown Location',
        'status': shopData['status'] ?? 'Unknown',
        'total_price': shopData['total_price'] ?? 'N/A',
        'contact_number': shopData['contact_number'] ?? '',
        'zone': shopData['zone'] ?? '',
        'street': shopData['street'] ?? '',
        'barangay': shopData['barangay'] ?? '',
        'building': shopData['building'] ?? '',
        'opening_time': shopData['opening_time'] ?? '',
        'closing_time': shopData['closing_time'] ?? '',
        'services': servicesResponse.statusCode == 200 
            ? (jsonDecode(servicesResponse.body)['services'] as List).map((service) => {
                'service_name': service['service_name'],
                'description': service['description'] ?? '',
                'price': service['price']?.toString() ?? '0',
                'color': service['color']?.toString() ?? '0xFF1A0066',
              }).toList()
            : [],
        'clothing_types': clothingResponse.statusCode == 200 
            ? jsonDecode(clothingResponse.body)['types'] ?? []
            : [],
        'household_items': householdResponse.statusCode == 200 
            ? jsonDecode(householdResponse.body)['items'] ?? []
            : [],
      };
    } catch (e) {
      print('Error fetching complete shop data: $e');
      throw e;
    }
  }

  void _navigateToShop(LaundryShop shop) {
    if (widget.isGuest) {
      return;
    }

    _fetchCompleteShopData(shop.id).then((fullShopData) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderShopSystem(
            userId: widget.userId,
            token: widget.token,
            shopData: fullShopData,
            initialService: null,
            initialItems: null,
          ),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading shop details: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0066),
        title: const Text(
          'All Laundry Shops',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading 
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1A0066)),
            ),
          )
        : _errorMessage.isNotEmpty
          ? Center(
              child: Text(_errorMessage),
            )
          : RefreshIndicator(
              onRefresh: _fetchAllShops,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: allShops.length,
                itemBuilder: (context, index) {
                  final shop = allShops[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => _navigateToShop(shop),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shop.name,
                              style: const TextStyle(
                                fontSize: 20, // Increased font size
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A0066),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              shop.location,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}