import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ReportingForm extends StatefulWidget {
  @override
  _ReportingFormState createState() => _ReportingFormState();
}

class _ReportingFormState extends State<ReportingForm> {
  String victimStatus = '';
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController parentGuardianNameController = TextEditingController();
  TextEditingController parentGuardianEmailController = TextEditingController();

  TextEditingController incidentDateController = TextEditingController();
  TextEditingController platformController = TextEditingController();
  TextEditingController times112Controller = TextEditingController();
  TextEditingController incidentDetailsController = TextEditingController();
  TextEditingController suspectsController = TextEditingController();

  TextEditingController feelingsController = TextEditingController();
  TextEditingController sharedWithController = TextEditingController();
  TextEditingController actionsTakenController = TextEditingController();

  FocusNode _fullNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _dobFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  FocusNode _genderFocus = FocusNode();
  FocusNode _stateFocus = FocusNode();
  FocusNode _cityFocus = FocusNode();
  FocusNode _occupationFocus = FocusNode();
  FocusNode _parentGuardianNameFocus = FocusNode();
  FocusNode _parentGuardianEmailFocus = FocusNode();
  FocusNode _incidentDateFocus = FocusNode();
  FocusNode _platformFocus = FocusNode();
  FocusNode _times112Focus = FocusNode();
  FocusNode _incidentDetailsFocus = FocusNode();
  FocusNode _suspectsFocus = FocusNode();
  FocusNode _feelingsFocus = FocusNode();
  FocusNode _sharedWithFocus = FocusNode();
  FocusNode _actionsTakenFocus = FocusNode();

  final reports = FirebaseFirestore.instance.collection('incident_reports'); // Use Firestore collection
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report Form',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Victim Details'),
            _buildRadioTile('I am the victim'),
            _buildRadioTile('I am reporting on behalf of the victim'),
            _buildTextField('Full Name', fullNameController, focusNode: _fullNameFocus),
            _buildTextField('Email', emailController, focusNode: _emailFocus),
            _buildTextField('Date of Birth', dobController, onTap: () {
              _selectDate(context, dobController);
            }, focusNode: _dobFocus),
            _buildTextField('Mobile Number', mobileController, focusNode: _mobileFocus),
            _buildTextField('Gender', genderController, focusNode: _genderFocus),
            _buildTextField('State', stateController, focusNode: _stateFocus),
            _buildTextField('City', cityController, focusNode: _cityFocus),
            _buildTextField('Occupation', occupationController, focusNode: _occupationFocus),
            _buildTextField('Parent/Guardian Name', parentGuardianNameController, focusNode: _parentGuardianNameFocus),
            _buildTextField('Parent/Guardian Email', parentGuardianEmailController, focusNode: _parentGuardianEmailFocus),

            _buildSectionTitle('Incident Details'),
            _buildTextField('Incident Date', incidentDateController, onTap: () {
              _selectDate(context, incidentDateController);
            }, focusNode: _incidentDateFocus),
            _buildTextField('Platform of Cyber Bullying', platformController, focusNode: _platformFocus),
            _buildTextField('Number of Times', times112Controller, focusNode: _times112Focus),
            _buildTextField('Incident Details', incidentDetailsController, focusNode: _incidentDetailsFocus),
            _buildTextField('Number of Suspects', suspectsController, focusNode: _suspectsFocus),

            _buildSectionTitle('Impact Details'),
            _buildTextField('How are you feeling?', feelingsController, focusNode: _feelingsFocus),
            _buildTextField('Shared with', sharedWithController, focusNode: _sharedWithFocus),
            _buildTextField('Actions Taken So Far', actionsTakenController, focusNode: _actionsTakenFocus),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                submitReport();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Submit Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      controller.text = formattedDate;
    }
  }

  void submitReport() {
    // Generate a unique code for form reference
    String formReference = uuid.v4();

    // Store the form data in Firestore
    reports.doc(formReference).set({
      'victimStatus': victimStatus,
      'fullName': fullNameController.text,
      'email': emailController.text,
      'dob': dobController.text,
      'mobile': mobileController.text,
      'gender': genderController.text,
      'state': stateController.text,
      'city': cityController.text,
      'occupation': occupationController.text,
      'parentGuardianName': parentGuardianNameController.text,
      'parentGuardianEmail': parentGuardianEmailController.text,
      'incidentDate': incidentDateController.text,
      'platform': platformController.text,
      'times112': times112Controller.text,
      'incidentDetails': incidentDetailsController.text,
      'suspects': suspectsController.text,
      'feelings': feelingsController.text,
      'sharedWith': sharedWithController.text,
      'actionsTaken': actionsTakenController.text,
    }).then((_) {
      // Show a dialog box with the unique ID and success message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Form Submitted Successfully'),
            content: Column(
              children: [
                Text('Your form has been submitted with the reference ID:'),
                SizedBox(height: 8),
                Text(
                  formReference,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to a new tab to display form details if needed
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FormDetailsScreen(formReference)));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      // Handle error, show a snackbar, toast, or log the error
      print('Error submitting report: $error');
    });
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildRadioTile(String title) {
    return RadioListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      value: title,
      groupValue: victimStatus,
      onChanged: (value) {
        setState(() {
          victimStatus = value.toString();
        });
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {VoidCallback? onTap, FocusNode? focusNode}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        focusNode: focusNode,
        style: TextStyle(color: focusNode?.hasFocus ?? false ? Colors.red : Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: focusNode?.hasFocus ?? false ? Colors.red : Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
