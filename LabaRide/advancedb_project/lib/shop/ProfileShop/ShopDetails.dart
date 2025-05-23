import 'package:flutter/material.dart';

class ShopDetails extends StatefulWidget {
  final int userId;
  final String token;
  final Map<String, dynamic> shopData;

  const ShopDetails({
    super.key,
    required this.userId,
    required this.token,
    required this.shopData,
  });

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  late final TextEditingController _shopNameController;
  late final TextEditingController _businessHoursController;
  late final TextEditingController _contactController;
  late final TextEditingController _shopIdController;
  
  bool _isShopNameEditing = false;
  bool _isBusinessHoursEditing = false;
  bool _isContactEditing = false;

  @override
    void initState() {
      super.initState();
      _shopIdController = TextEditingController(
        text: widget.shopData['id']?.toString() ?? ''
      );
      _shopNameController = TextEditingController(
        text: widget.shopData['shop_name'] ?? ''
      );
      _businessHoursController = TextEditingController(
        text: '${widget.shopData['opening_time'] ?? ''} - ${widget.shopData['closing_time'] ?? ''}'
      );
      _contactController = TextEditingController(
        text: widget.shopData['contact_number'] ?? widget.shopData['user']?['contact_number'] ?? ''
      );
    }

  Future<void> _saveField(String field, String value) async {
    try {
      // TODO: Implement API call to update shop data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Changes saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save changes')),
      );
    }
  }

  Widget _buildEditableField(String label, TextEditingController controller, bool isEditing, Function() onEditPress, {bool isEditable = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A0066),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Expanded(
                child: isEditing
                    ? TextField(
                        controller: controller,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onSubmitted: (value) {
                          _saveField(label, value);
                          onEditPress();
                        },
                      )
                    : Text(
                        controller.text,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
              ),
              if (isEditable)
                GestureDetector(
                  onTap: onEditPress,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isEditing ? const Color(0xFF1A0066) : Colors.grey[400]!,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      isEditing ? 'assets/Admin/Save.png' : 'assets/Admin/Edit.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E0FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A0066)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Shop Details',
          style: TextStyle(
            color: Color(0xFF1A0066),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shop Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A0066),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(widget.shopData['shop_image'] ?? 'assets/Admin/Sample.png'),
                  fit: BoxFit.cover,
                  onError: (_, __) {
                    const AssetImage('assets/Admin/Sample.png');
                  },
                ),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Implement image change functionality
                      },
                      child: Image.asset(
                        'assets/Admin/Change.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildEditableField(
              'Shop ID',
              _shopIdController,
              false,
              () {},
              isEditable: false,
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              'Shop Name',
              _shopNameController,
              _isShopNameEditing,
              () => setState(() => _isShopNameEditing = !_isShopNameEditing),
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              'Business Hours',
              _businessHoursController,
              _isBusinessHoursEditing,
              () => setState(() => _isBusinessHoursEditing = !_isBusinessHoursEditing),
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              'Contact',
              _contactController,
              _isContactEditing,
              () => setState(() => _isContactEditing = !_isContactEditing),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _shopIdController.dispose();
    _shopNameController.dispose();
    _businessHoursController.dispose();
    _contactController.dispose();
    super.dispose();
  }
}