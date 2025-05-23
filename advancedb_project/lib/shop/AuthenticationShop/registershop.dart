import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../user/authenticationuser/signupcomplete.dart';

class RegisterShop extends StatefulWidget {
  final int userId;
  final String token;

  const RegisterShop({
    super.key,
    required this.userId,
    required this.token,
  });

  @override
  State<RegisterShop> createState() => _RegisterShopState();
}

class _RegisterShopState extends State<RegisterShop> {
  final _formKey = GlobalKey<FormState>();
  final _shopNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _zoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _barangayController = TextEditingController();
  final _buildingController = TextEditingController();
  final _openingTimeController = TextEditingController();
  final _closingTimeController = TextEditingController();

  bool _isLoading = false;

@override
void dispose() {
  _shopNameController.dispose();
  _contactNumberController.dispose();
  _zoneController.dispose();
  _streetController.dispose();
  _barangayController.dispose();
  _buildingController.dispose();
  _openingTimeController.dispose();
  _closingTimeController.dispose();
  super.dispose();
}

Future<void> _handleSubmit() async {
  if (!_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all required fields')),
    );
    return;
  }

  setState(() => _isLoading = true);

  try {
    // Add debug prints
    print('Debug - Token being sent: ${widget.token}');
    print('Debug - User ID: ${widget.userId}');

    final response = await http.post(
      Uri.parse('http://localhost:5000/register_shop/${widget.userId}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',  // Add Accept header
        'Authorization': 'Bearer ${widget.token}',
      },
      body: jsonEncode({
        'shop_name': _shopNameController.text.trim(),
        'contact_number': _contactNumberController.text.trim(),
        'zone': _zoneController.text.trim(),
        'street': _streetController.text.trim(),
        'barangay': _barangayController.text.trim(),
        'building': _buildingController.text.trim(),
        'opening_time': _openingTimeController.text.trim(),
        'closing_time': _closingTimeController.text.trim(),
      }),
    );

    print('Debug - Response Status: ${response.statusCode}');
    print('Debug - Response Body: ${response.body}');

    final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        if (!mounted) return;
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpCompleteScreen(),
          ),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? 'Registration failed')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1A0066),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, {bool required = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontFamily: 'Inter',
                ),
              ),
              if (required)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (required && (value == null || value.isEmpty)) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A0066)),
          onPressed: () => Navigator.pop(context),  
        ),
        title: Row(
          children: [
            Image.asset('assets/blacklogo.png', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Register your shop',
              style: TextStyle(
                color: Color(0xFF1A0066),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Shop Information'),
                _buildTextField('Shop Name', 'Enter shop name', _shopNameController),
                _buildTextField('Contact Number', 'Enter contact number', _contactNumberController),
                const SizedBox(height: 24),

                _buildSectionTitle('Address'),
                _buildTextField('Zone Name', 'Enter zone', _zoneController),
                _buildTextField('Street Name', 'Enter street name', _streetController),
                _buildTextField('Barangay Name', 'Enter barangay name', _barangayController),
                _buildTextField('Building Name', 'Enter building name', _buildingController, required: false),
                const SizedBox(height: 24),

                _buildSectionTitle('Business Hours'),
                _buildTextField('Opening Time', 'Enter opening time (eg. 5:00am)', _openingTimeController),
                _buildTextField('Closing Time', 'Enter closing time (eg. 11:00pm)', _closingTimeController),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF375DFB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Register Shop',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}