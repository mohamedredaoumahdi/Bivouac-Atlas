import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../models/accommodation.dart';

class BookingScreen extends StatefulWidget {
  final Activity selectedActivity;
  final Accommodation selectedAccommodation;

  const BookingScreen({
    super.key,
    required this.selectedActivity,
    required this.selectedAccommodation,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  final _adultsController = TextEditingController();
  final _childrenController = TextEditingController();
  final _specialRequestsController = TextEditingController();

  String? _selectedTripType;
  final List<String> _tripTypes = ['Luxury', 'Moderate', 'Budget'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Booking'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Booking Summary
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Booking Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSummaryRow(
                        'Activity',
                        widget.selectedActivity.title,
                        '\$${widget.selectedActivity.price}',
                        widget.selectedActivity.icon,
                      ),
                      const Divider(height: 24),
                      _buildSummaryRow(
                        'Accommodation',
                        widget.selectedAccommodation.title,
                        '\$${widget.selectedAccommodation.price}/night',
                        widget.selectedAccommodation.icon,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Trip Type Selection
              const Text(
                'Choose Trip Type',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 16),
              ...TripType.values.map((type) => _buildTripTypeCard(type)),
              const SizedBox(height: 24),

              // Personal Information
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Stay Details
              const Text(
                'Stay Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _checkInController,
                      decoration: const InputDecoration(
                        labelText: 'Check-in Date *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: 'DD/MM/YYYY',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _checkOutController,
                      decoration: const InputDecoration(
                        labelText: 'Check-out Date *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: 'DD/MM/YYYY',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _adultsController,
                      decoration: const InputDecoration(
                        labelText: 'Adults *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _childrenController,
                      decoration: const InputDecoration(
                        labelText: 'Children',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.child_care),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _specialRequestsController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Special Requests (Optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                  hintText: 'Any dietary restrictions, accessibility needs, etc.',
                ),
              ),
              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitBooking,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Complete Booking',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Terms Note
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'By completing this booking, you agree to our terms and conditions. A confirmation email will be sent to you shortly after submission.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String title, String price, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF4CAF50),
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4CAF50),
          ),
        ),
      ],
    );
  }

  Widget _buildTripTypeCard(TripType type) {
    final isSelected = _selectedTripType == type.name;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        onTap: () => setState(() => _selectedTripType = type.name),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: const Color(0xFF4CAF50), width: 2)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    type.icon,
                    color: isSelected ? Colors.white : const Color(0xFF4CAF50),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xFF4CAF50)
                              : const Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        type.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF4CAF50),
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      if (_selectedTripType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a trip type'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF4CAF50),
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Booking Confirmed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Thank you for booking with Bivouac Atlas!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'A confirmation email has been sent to your email address. Our team will contact you within 24 hours to finalize the details.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Return to Home'),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _checkInController.dispose();
    _checkOutController.dispose();
    _adultsController.dispose();
    _childrenController.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }
}

enum TripType {
  luxury(
    'Luxury',
    'Premium experience with exclusive services, private guides, and luxury amenities',
    Icons.diamond,
  ),
  moderate(
    'Moderate',
    'Balanced experience with quality accommodations and guided activities',
    Icons.star,
  ),
  budget(
    'Budget',
    'Essential experience focusing on core activities and basic comfort',
    Icons.wallet,
  );

  const TripType(this.title, this.description, this.icon);

  final String title;
  final String description;
  final IconData icon;
}