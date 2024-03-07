import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SafeSphere/screens/components/side_menu.dart';
import 'package:SafeSphere/components/functions.dart';
import 'package:SafeSphere/components/reportform.dart';

class IncidentReport extends StatefulWidget {
  const IncidentReport({Key? key}) : super(key: key);

  @override
  _IncidentReportState createState() => _IncidentReportState();
}

class _IncidentReportState extends State<IncidentReport> {
  bool _isChecked = false;

  void _navigateToReportingForm(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportingForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SafeSphere',
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black, // Keeping the AppBar color as black
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () => navigateBack(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Report an Incident',
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Before you report',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text:
                    'Submitting an incident report is a straightforward process, typically taking about 5-7 minutes to complete our report form. The form is organized into three sections, and it is essential to fill out all three sections before submitting your report.\n\n',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black87),
                    children: [
                      TextSpan(
                        text:
                        'Before you start, please make sure you have the necessary information, which includes:\n\n',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: '- Screenshots depicting the incident or threat\n'
                            '- Links to the perpetrator\'s social media accounts\n'
                            '- Parents\' names and contact details (if the victim is under 18)\n\n',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text:
                        'If you have experienced financial loss, promptly report it to the national helpline at 1930 and contact your bank immediately.\n\n',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text:
                        'In the event of immediate danger, alert a trusted adult and dial the emergency police number at 100.',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'When you submit your report',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text:
                    'After submitting your report, you will receive a case number and our team of expert cyber professionals will update you on the further steps. You can view the same under the "Track my report" tab.\n\n',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black87),
                    children: [
                      TextSpan(
                        text:
                        'If the case is sensitive, our trained expert counsellors can assist you. Chat with a Counsellor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                      ),
                      Text(
                        'I understand & agree',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: TextButton(
                  onPressed: _isChecked
                      ? () => _navigateToReportingForm(context)
                      : null,
                  style: TextButton.styleFrom(
                    backgroundColor: _isChecked ? Colors.red : Colors.grey,
                    minimumSize: Size(2000, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Proceed to report',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
