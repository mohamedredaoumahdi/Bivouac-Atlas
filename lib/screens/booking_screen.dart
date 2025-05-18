import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/activity.dart';
import '../models/accommodation.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_switch.dart';

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
  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.completeBooking),
        centerTitle: true,
        actions: const [
          LanguageSwitch(),
          SizedBox(width: 8),
        ],
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        const Color(0xFFF5F5DC).withOpacity(0.3), // Warm Beige
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.bookingSummary,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF333333), // Dark Charcoal
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildSummaryRow(
                          l10n.selectedActivity,
                          widget.selectedActivity.title,
                          '\$${widget.selectedActivity.price}',
                          widget.selectedActivity.icon,
                        ),
                        const Divider(height: 24),
                        _buildSummaryRow(
                          l10n.chooseAccommodation,
                          widget.selectedAccommodation.title,
                          '\$${widget.selectedAccommodation.price}/${l10n.perNight}',
                          widget.selectedAccommodation.icon,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Trip Type Selection
              Text(
                l10n.chooseTripType,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF333333), // Dark Charcoal
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...TripType.values.map((type) => _buildTripTypeCard(type, l10n)),
              const SizedBox(height: 24),

              // Personal Information
              Text(
                l10n.personalInformation,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF333333), // Dark Charcoal
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Full Name
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: '${l10n.fullName} *',
                  hintText: 'e.g. John Doe',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.pleaseEnterName;
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
                    return 'Name can only contain letters and spaces';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Auto-capitalize first letter of each word
                  if (value.isNotEmpty) {
                    final words = value.split(' ');
                    final capitalizedWords = words.map((word) {
                      if (word.isNotEmpty) {
                        return word[0].toUpperCase() + word.substring(1).toLowerCase();
                      }
                      return word;
                    }).join(' ');
                    
                    if (capitalizedWords != value) {
                      _nameController.value = TextEditingValue(
                        text: capitalizedWords,
                        selection: TextSelection.collapsed(offset: capitalizedWords.length),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              
              // Email Address
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: '${l10n.emailAddress} *',
                  hintText: 'example@email.com',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.pleaseEnterEmail;
                  }
                  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return l10n.pleaseEnterValidEmail;
                  }
                  return null;
                },
                onChanged: (value) {
                  // Auto-lowercase email
                  final lowercaseValue = value.toLowerCase();
                  if (lowercaseValue != value) {
                    _emailController.value = TextEditingValue(
                      text: lowercaseValue,
                      selection: TextSelection.collapsed(offset: lowercaseValue.length),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              
              // Phone Number
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-\s\(\)]')),
                ],
                decoration: InputDecoration(
                  labelText: '${l10n.phoneNumber} *',
                  hintText: '+1 234 567 8900',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.pleaseEnterPhone;
                  }
                  final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
                  if (digitsOnly.length < 10) {
                    return 'Phone number must have at least 10 digits';
                  }
                  if (digitsOnly.length > 15) {
                    return 'Phone number cannot exceed 15 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Stay Details
              Text(
                l10n.stayDetails,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF333333), // Dark Charcoal
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Check-in and Check-out Dates
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _checkInController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: '${l10n.checkInDate} *',
                        hintText: 'Select date',
                        prefixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                      validator: (value) {
                        if (_checkInDate == null) {
                          return 'Please select check-in date';
                        }
                        if (_checkInDate!.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
                          return 'Check-in date cannot be in the past';
                        }
                        return null;
                      },
                      onTap: () => _selectCheckInDate(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _checkOutController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: '${l10n.checkOutDate} *',
                        hintText: 'Select date',
                        prefixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                      validator: (value) {
                        if (_checkOutDate == null) {
                          return 'Please select check-out date';
                        }
                        if (_checkInDate != null && _checkOutDate!.isBefore(_checkInDate!)) {
                          return 'Check-out must be after check-in';
                        }
                        if (_checkInDate != null && _checkOutDate!.isAtSameMomentAs(_checkInDate!)) {
                          return 'Minimum stay is 1 night';
                        }
                        return null;
                      },
                      onTap: () => _selectCheckOutDate(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Number of Adults and Children
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _adultsController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                        labelText: '${l10n.adults} *',
                        hintText: '1',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter number of adults';
                        }
                        final adults = int.tryParse(value);
                        if (adults == null || adults < 1) {
                          return 'At least 1 adult required';
                        }
                        if (adults > 20) {
                          return 'Maximum 20 adults allowed';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _childrenController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                        labelText: l10n.children,
                        hintText: '0',
                        prefixIcon: const Icon(Icons.child_care),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          final children = int.tryParse(value);
                          if (children == null || children < 0) {
                            return 'Invalid number of children';
                          }
                          if (children > 15) {
                            return 'Maximum 15 children allowed';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Special Requests
              TextFormField(
                controller: _specialRequestsController,
                maxLines: 3,
                maxLength: 500,
                decoration: InputDecoration(
                  labelText: l10n.specialRequests,
                  hintText: l10n.specialRequestsHint,
                  prefixIcon: const Icon(Icons.note_add),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value != null && value.length > 500) {
                    return 'Special requests cannot exceed 500 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF388E3C), // Forest Green
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 3,
                  ),
                  child: Text(
                    l10n.completeBookingButton,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Terms Notice
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5DC).withOpacity(0.5), // Warm Beige
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF757575).withOpacity(0.3), // Cool Gray
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: const Color(0xFF757575), // Cool Gray
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.termsNotice,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF757575), // Cool Gray
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String title, String price, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50).withOpacity(0.1), // Natural Green
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4CAF50), // Natural Green
            size: 24,
          ),
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
                  color: Color(0xFF757575), // Cool Gray
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333), // Dark Charcoal
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
            color: Color(0xFF388E3C), // Forest Green
          ),
        ),
      ],
    );
  }

  Widget _buildTripTypeCard(TripType type, AppLocalizations l10n) {
    final isSelected = _selectedTripType == type.name;
    
    String getLocalizedTitle(TripType type) {
      switch (type) {
        case TripType.luxury:
          return l10n.luxury;
        case TripType.moderate:
          return l10n.moderate;
        case TripType.budget:
          return l10n.budget;
      }
    }
    
    String getLocalizedDesc(TripType type) {
      switch (type) {
        case TripType.luxury:
          return l10n.luxuryDesc;
        case TripType.moderate:
          return l10n.moderateDesc;
        case TripType.budget:
          return l10n.budgetDesc;
      }
    }
    
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
                ? Border.all(color: const Color(0xFF4CAF50), width: 2) // Natural Green
                : null,
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF4CAF50).withOpacity(0.05), // Natural Green
                      const Color(0xFFF5F5DC).withOpacity(0.3), // Warm Beige
                    ],
                  )
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
                        ? const Color(0xFF4CAF50) // Natural Green
                        : const Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    type.icon,
                    color: isSelected ? Colors.white : const Color(0xFF4CAF50), // Natural Green
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getLocalizedTitle(type),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xFF388E3C) // Forest Green
                              : const Color(0xFF333333), // Dark Charcoal
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        getLocalizedDesc(type),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575), // Cool Gray
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF4CAF50), // Natural Green
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _checkInDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF4CAF50), // Natural Green
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: const Color(0xFF333333), // Dark Charcoal
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _checkInDate = picked;
        _checkInController.text = '${picked.day}/${picked.month}/${picked.year}';
        
        // Reset checkout date if it's before the new check-in date
        if (_checkOutDate != null && _checkOutDate!.isBefore(picked)) {
          _checkOutDate = null;
          _checkOutController.clear();
        }
      });
    }
  }

  Future<void> _selectCheckOutDate(BuildContext context) async {
    final DateTime minDate = _checkInDate?.add(const Duration(days: 1)) ?? 
                            DateTime.now().add(const Duration(days: 2));
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _checkOutDate ?? minDate,
      firstDate: minDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF4CAF50), // Natural Green
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: const Color(0xFF333333), // Dark Charcoal
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _checkOutDate = picked;
        _checkOutController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      if (_selectedTripType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.pleaseSelectTripType),
            backgroundColor: const Color(0xFFE57373), // Soft Red
          ),
        );
        return;
      }

      final l10n = AppLocalizations.of(context)!;
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.1), // Natural Green
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xFF4CAF50), // Natural Green
                  size: 60,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.bookingConfirmed,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333), // Dark Charcoal
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.thankYouForBooking,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333), // Dark Charcoal
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.confirmationEmailSent,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575), // Cool Gray
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C), // Forest Green
                  foregroundColor: Colors.white,
                ),
                child: Text(l10n.returnToHome),
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