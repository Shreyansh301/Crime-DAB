/*import 'package:flutter/material.dart';

class CrimeReportPage extends StatelessWidget {
  const CrimeReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Crime Report Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class CrimeReportPage extends StatefulWidget {
  const CrimeReportPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrimeReportPageState createState() => _CrimeReportPageState();
}

class _CrimeReportPageState extends State<CrimeReportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _crimeDescriptionController = TextEditingController();
  String? _selectedCrimeType;
  String _location = '';

  // Crime types list
  final List<String> _crimeTypes = [
    'Theft',
    'Assault',
    'Robbery',
    'Vandalism',
    'Fraud',
    'Other'
  ];

  // Logger instance
  final Logger _logger = Logger('CrimeReportPage');

  void _submitCrimeReport() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle the form submission
      final crimeDescription = _crimeDescriptionController.text;
      final crimeType = _selectedCrimeType;
      final location = _location;

      // Use logger instead of print
      _logger.info('Crime Report Submitted:');
      _logger.info('Crime Type: $crimeType');
      _logger.info('Location: $location');
      _logger.info('Description: $crimeDescription');

      // Show a success message (you can replace this with your logic to save data)
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Crime Report Submitted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Crime Type Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCrimeType,
              hint: const Text('Select Crime Type'),
              onChanged: (newValue) {
                setState(() {
                  _selectedCrimeType = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a crime type';
                }
                return null;
              },
              items: _crimeTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Crime Location TextField
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Location',
                hintText: 'Enter the location of the crime',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Crime Description TextField
            TextFormField(
              controller: _crimeDescriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Crime Description',
                hintText: 'Describe the crime in detail',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please describe the crime';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submitCrimeReport,
              child: const Text('Submit Crime Report'),
            ),
          ],
        ),
      ),
    );
  }
}
