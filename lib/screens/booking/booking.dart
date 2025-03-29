import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SalonBookingScreen extends StatefulWidget {
  static const String routeName = '/salon-booking';

  const SalonBookingScreen({super.key});

  @override
  State<SalonBookingScreen> createState() => _SalonBookingScreenState();
}

class _SalonBookingScreenState extends State<SalonBookingScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  // Dropdown values
  String? _selectedCity;
  String? _selectedSalon;
  String? _selectedBarber;
  String? _selectedService;
  String? _selectedTimeSlot;

  // Sample data
  final List<String> _cities = [
    'Homagama',
    'Maharagama',

  ];
  final Map<String, List<String>> _salonsByCity = {
    'Homagama': ['Salon U', 'Isuru salon', 'Salon Highly',],
    'Maharagama': ['Looks Salon', 'Ruvoma SALON'],

  };
  final Map<String, List<String>> _barbersBySalon = {
    'Salon U': ['John Doe', 'Mike Smith'],
    'Isuru salon': ['David Johnson', 'Robert Brown'],
    'Salon Highly': ['James Wilson', 'Thomas Taylor'],
    'Looks Salon': ['William White', 'Christopher Lee'],
    'Ruvoma SALON': ['Daniel Clark', 'Matthew Lewis'],
    // Add more as needed
  };
  final List<String> _services = [
    'Haircut',
    'Beard Trim',
    'Hair Coloring',
    'Shaving',
    'Hair Styling',
    'Facial'
  ];
  final List<String> _timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _clearForm() {
    setState(() {
      _selectedCity = null;
      _selectedSalon = null;
      _selectedBarber = null;
      _selectedService = null;
      _selectedTimeSlot = null;
      _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
      _timeController.clear();
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the booking
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Booking Confirmed'),
          content: Text(
              'Your appointment with ${_selectedBarber} at ${_selectedSalon} for ${_selectedService} on ${_dateController.text} at ${_selectedTimeSlot} has been booked.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _clearForm();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salon Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // City Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCity,
                decoration: const InputDecoration(
                  labelText: 'Select City',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city),
                ),
                items: _cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCity = newValue;
                    _selectedSalon = null;
                    _selectedBarber = null;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a city' : null,
              ),
              const SizedBox(height: 16),

              // Salon Dropdown (only visible when city is selected)
              if (_selectedCity != null)
                DropdownButtonFormField<String>(
                  value: _selectedSalon,
                  decoration: const InputDecoration(
                    labelText: 'Select Salon',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.store),
                  ),
                  items: _salonsByCity[_selectedCity]!.map((String salon) {
                    return DropdownMenuItem<String>(
                      value: salon,
                      child: Text(salon),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSalon = newValue;
                      _selectedBarber = null;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a salon' : null,
                ),
              if (_selectedCity != null) const SizedBox(height: 16),

              // Barber Dropdown (only visible when salon is selected)
              if (_selectedSalon != null)
                DropdownButtonFormField<String>(
                  value: _selectedBarber,
                  decoration: const InputDecoration(
                    labelText: 'Select Barber',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.face),
                  ),
                  items: _barbersBySalon[_selectedSalon]!.map((String barber) {
                    return DropdownMenuItem<String>(
                      value: barber,
                      child: Text(barber),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedBarber = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a barber' : null,
                ),
              if (_selectedSalon != null) const SizedBox(height: 16),

              // Service Dropdown
              DropdownButtonFormField<String>(
                value: _selectedService,
                decoration: const InputDecoration(
                  labelText: 'Select Service',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cleaning_services),
                ),
                items: _services.map((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedService = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a service' : null,
              ),
              const SizedBox(height: 16),

              // Date Picker
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Select Date',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) =>
                    value!.isEmpty ? 'Please select a date' : null,
              ),
              const SizedBox(height: 16),

              // Time Slot Dropdown
              DropdownButtonFormField<String>(
                value: _selectedTimeSlot,
                decoration: const InputDecoration(
                  labelText: 'Select Time Slot',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
                items: _timeSlots.map((String time) {
                  return DropdownMenuItem<String>(
                    value: time,
                    child: Text(time),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTimeSlot = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a time slot' : null,
              ),
              const SizedBox(height: 24),

              // Buttons Row
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _clearForm,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: const Text(
                        'Clear',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFFFFB22C),
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
