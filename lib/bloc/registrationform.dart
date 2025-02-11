import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smartcampus/models/ModelProvider.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

Future<List<StaffUserProfile>> getAllStaffProfile() async {
  try {
    final request = ModelQueries.list(StaffUserProfile.classType, limit: 10);
    final response = await Amplify.API.query(request: request).response;
    return response.data?.items.whereType<StaffUserProfile>().toList() ?? [];
  } catch (e) {
    print('Error fetching staff profiles: $e');
    return [];
  }
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> years = ['1st Year', '2nd Year', '3rd Year', 'Final Year'];

  String? selectedYear;
  String? selectedDepartmentId;
  String? selectedProctorId;
  String? selectedACId;
  String? selectedHODId;
  String email = '';
  String name = '';
  String regNo = '';

  List<StaffUserProfile> staffList = [];
  List<String> departments = [];
  List<StaffUserProfile> proctors = [];
  List<StaffUserProfile> academicCoordinators = [];
  List<StaffUserProfile> hods = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadStaffData();
  }

  Future<void> _loadStaffData() async {
    try {
      final staff = await getAllStaffProfile();

      final uniqueDepartments = staff
          .map((s) => s.department)
          .where((d) => d != null)
          .toSet()
          .toList();

      final proctors = staff.where((s) => s.name == 'Proctor').toList();
      final acs = staff.where((s) => s.name == 'Academic Coordinator').toList();
      final hods = staff.where((s) => s.name == 'HOD').toList();

      setState(() {
        this.staffList = staff;
        this.departments = uniqueDepartments.cast<String>();
        this.proctors = proctors;
        this.academicCoordinators = acs;
        this.hods = hods;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load staff data: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(errorMessage!),
              ElevatedButton(
                onPressed: _loadStaffData,
                child: const Text('Retry'),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Registration Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter registration number';
                  }
                  return null;
                },
                onSaved: (value) => regNo = value!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(),
                ),
                value: selectedYear,
                items: years.map((year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select year' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                ),
                value: selectedDepartmentId,
                items: departments.map((dept) {
                  return DropdownMenuItem<String>(
                    value: dept,
                    child: Text(dept),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDepartmentId = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select department' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Proctor',
                  border: OutlineInputBorder(),
                ),
                value: selectedProctorId,
                items: proctors.map((proctor) {
                  return DropdownMenuItem<String>(
                    value: proctor.id,
                    child: Text(proctor.name ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProctorId = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select proctor' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Academic Coordinator (AC)',
                  border: OutlineInputBorder(),
                ),
                value: selectedACId,
                items: academicCoordinators.map((ac) {
                  return DropdownMenuItem<String>(
                    value: ac.id,
                    child: Text(ac.name ?? 'Unnamed AC'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedACId = value;
                  });
                },
                validator: (value) => value == null ? 'Please select AC' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'HOD',
                  border: OutlineInputBorder(),
                ),
                value: selectedHODId,
                items: hods.map((hod) {
                  return DropdownMenuItem<String>(
                    value: hod.id,
                    child: Text(hod.name ?? 'Unnamed HOD'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedHODId = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select HOD' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the form data with actual IDs
                    print('Student Details:');
                    print('Email: $email');
                    print('Name: $name');
                    print('Reg No: $regNo');
                    print('Year: $selectedYear');
                    print('Department ID: $selectedDepartmentId');
                    print('Proctor ID: $selectedProctorId');
                    print('AC ID: $selectedACId');
                    print('HOD ID: $selectedHODId');
                  }
                },
                child: const Text('Submit', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
