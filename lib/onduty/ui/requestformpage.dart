// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smartcampus/components/file_pick.dart';

class ElegantForm extends StatefulWidget {
  const ElegantForm({
    super.key,
  });
  @override
  // ignore: library_private_types_in_public_api
  _ElegantFormState createState() => _ElegantFormState();
}
class _ElegantFormState extends State<ElegantForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _registerUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  List<File> selectedFiles = [];

  @override
  void dispose() {
    _studentNameController.dispose();
    _emailController.dispose();
    _eventNameController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _registerUrlController.dispose();
    _animationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Request'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.purple.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              FadeTransition(
                opacity: _animation,
                child: _buildTextField('Student Name', _studentNameController,
                    isReadOnly: true),
              ),
              const SizedBox(height: 16),
              FadeTransition(
                opacity: _animation,
                child: _buildTextField('Student Email', _emailController,
                    isReadOnly: true),
              ),
              const SizedBox(height: 16),
              _buildTextField('Requst name', _eventNameController),
              const SizedBox(height: 16),
              _buildTextField('Description', _descriptionController,
                  maxLines: 6),
              const SizedBox(height: 16),
              _buildDateField('Date', _dateController),
              const SizedBox(height: 16),
              _buildTextField('Location', _locationController),
              const SizedBox(height: 16),
              _buildTextField('Register URL', _registerUrlController),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              _buildGradientButton('Submit'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isReadOnly = false, int? maxLines}) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      minLines: maxLines != null ? 4 : null,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: isReadOnly
            ? Colors.grey.shade300.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: Colors.black54),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: _buildTextField(label, controller, isReadOnly: false),
      ),
    );
  }

  Widget _buildGradientButton(String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text("Submit")
    );
  }
}
