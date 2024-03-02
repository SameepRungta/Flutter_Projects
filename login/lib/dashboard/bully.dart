//import 'package:cyberbulling/cyberbulling.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/components/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/components/functions.dart';

class cyberbulling extends StatefulWidget {
  const cyberbulling({super.key});

  @override
  State<cyberbulling> createState() => _cyberbullingState();
}

class _cyberbullingState extends State<cyberbulling> {
  int? _selectedIndex;

  void _handleTap(int index){
    setState(() {
      if(_selectedIndex == index){
        _selectedIndex=null;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
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
        body: Container(


          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ListView(
                            children:  [
                              // ExpansionTile(
                              //   title: Text('Identifying Cyberbulling'),
                              //   trailing: const Icon(Icons.add),
                              //   children: [
                              //     Text(''),
                              //
                              //   ],
                              // ),



                            Container(
                              padding:EdgeInsets.only(top: 15,left: 15),
                              height: 70,
                              color: Colors.green,
                              child: Text('All about CyberBullying',
                              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
                              textAlign: TextAlign.left,
                              ),
                            )
                            ,

                              ExpansionTile(
                                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                title: Text(
                                  'What is Cyberbullying',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  SizedBox(height: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'images/cyberbulling1.jpeg', // Replace with your image path
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Cyberbullying refers to the use of digital technologies, such as smartphones, social media, the internet, and other digital communication tools, to harass, intimidate, threaten, or harm individuals or groups. It involves the deliberate and repeated use of technology to target others with harmful behavior, often with the intention to cause emotional distress, embarrassment, or humiliation.',
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Cyberbullying can take various forms, including:\n'
                                        '• Harassment: Sending threatening or abusive messages, emails, or comments repeatedly.\n'
                                        '• Flaming: Engaging in online arguments or heated discussions with the intention of provoking others.\n'
                                        '• Doxing: Sharing personal information, such as addresses or phone numbers, to intimidate or harass individuals.\n'
                                        '• Impersonation: Pretending to be someone else online to deceive or manipulate others.\n'
                                        '• Exclusion: Deliberately excluding someone from online groups, chats, or activities to isolate them.\n'
                                        '• Cyberstalking: Persistent monitoring, tracking, or surveillance of someone\'s online activities without their consent.\n'
                                        '• Posting Hurtful Content: Sharing or spreading rumors, gossip, or derogatory comments about someone online.\n'
                                        '• Creating Fake Profiles or Accounts: Creating fake social media profiles or accounts to harass or impersonate others.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                  SizedBox(height: 16),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'images/cyberbulling2.jpeg', // Replace with your image path
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(0);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 0,
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Types of Cyberbullying',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Align(
                                    child: Image.asset(
                                      'images/bullying.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Harassment: Sending repeated, offensive, or threatening messages to the victim via email, social media, or messaging apps.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/flaming.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Flaming: Engaging in online arguments or heated debates with the intention of provoking or insulting the victim.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/outing.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Outing: Sharing the victim\'s personal, private, or embarrassing information online without their consent, potentially leading to humiliation or embarrassment.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/stalking.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Cyberstalking: Monitoring, tracking, or surveilling the victim\'s online activities without their permission, often with the intent to intimidate or frighten them.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/isolation (1).png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Exclusion: Intentionally excluding the victim from online groups, chats, or activities, causing feelings of isolation and rejection.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/impersonation.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Impersonation: Pretending to be someone else online to deceive, manipulate, or harm the victim\'s reputation or relationships.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/doxing.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Doxing: Publishing the victim\'s personal or sensitive information online, such as their address, phone number, or financial details, with the intent to intimidate or harass them.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/catfishing1.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Catfishing: Creating fake profiles or personas online to deceive the victim into forming relationships or sharing personal information.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/trolling1.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Trolling: Posting inflammatory, provocative, or offensive comments or content online to provoke a reaction or upset the victim.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  Align(
                                    child: Image.asset(
                                      'images/cyberbullingbyProxy.png', // Replace with your image path
                                      height: 100,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Cyberbullying by Proxy: Enlisting others to participate in cyberbullying or encouraging them to harass or target the victim online.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(1);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 1,
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Identifying Cyberbullying',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/identify.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Identifying cyberbullying can be challenging, as it often occurs online and may not be immediately visible. However, here are some common signs and indicators that someone may be experiencing cyberbullying:'
                                        '\n\nEmotional Changes: Noticeable changes in mood, behavior, or emotional well-being, such as sudden sadness, anxiety, irritability, or withdrawal.'
                                        '\n\nAvoidance of Technology: Reluctance or hesitation to use computers, smartphones, or social media platforms, especially if the individual was previously active online.'
                                        '\n\nChanges in Online Behavior: Abrupt changes in online behavior, such as avoiding certain websites or apps, deleting social media accounts, or suddenly stopping online activities altogether.'
                                        '\n\nUnexplained Physical Symptoms: Complaints of physical symptoms such as headaches, stomachaches, or difficulty sleeping, which may be stress-related.'
                                        '\n\nSecrecy or Hiding: Attempts to hide or conceal online activity, such as clearing browsing history, using private browsing modes, or avoiding discussing online interactions.'
                                        '\n\nDecreased Self-Esteem: Expressions of low self-esteem, self-doubt, or feelings of worthlessness, possibly resulting from negative interactions or comments online.'
                                        '\n\nSocial Isolation: Withdrawal from social interactions both online and offline, reluctance to participate in social events or gatherings, and a sense of isolation from peers.'
                                        '\n\nAcademic Decline: Decline in academic performance, decreased concentration, or disengagement from schoolwork due to the stress of cyberbullying.'
                                        '\n\nChanges in Friendships: Difficulty maintaining friendships or forming new connections, possibly due to negative experiences or conflicts online.'
                                        '\n\nEvidence of Harassment: Direct evidence of cyberbullying, such as receiving threatening or abusive messages, derogatory comments, or harmful rumors online.'
                                        '\n\nChanges in Eating Habits: Changes in eating habits, appetite, or weight, which may be related to stress or emotional distress caused by cyberbullying.'
                                        '\n\nAvoidance of Specific Places or Activities: Avoidance of specific places, activities, or social gatherings where the individual may encounter the cyberbully or feel vulnerable to harassment.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(2);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 2,
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Impact of Cyberbullying',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/impact.jpg', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Emotional Distress: Cyberbullying causes victims to experience sadness, fear, anger, and helplessness due to ongoing harassment."
                                        "\n\nLow Self-Esteem: Victims may doubt themselves and their worth, leading to feelings of inadequacy and diminished confidence."
                                        "\n\nAnxiety and Depression: Many victims develop symptoms of anxiety and depression due to the stress and isolation caused by cyberbullying."
                                        "\n\nAcademic Decline: The stress of cyberbullying can impact academic performance and attendance, leading to a decline in grades."
                                        "\n\nSocial Withdrawal: Victims may avoid social interactions online and offline to protect themselves from further harassment."
                                        "\n\nIsolation and Loneliness: Cyberbullying can lead to feelings of isolation and loneliness as victims struggle to trust others and seek support."
                                        "\n\nPhysical Health Issues: Chronic stress from cyberbullying can manifest in physical health problems such as headaches, stomachaches, and sleep disturbances."
                                        "\n\nSuicidal Ideation and Self-Harm: In severe cases, cyberbullying may lead to thoughts of self-harm or suicide as victims feel overwhelmed and see no way out of their situation.",
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(3);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 3,
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Prevention',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/prevention.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Education: Teach what cyberbullying is and its consequences.'
                                        '\n\nPromote Digital Citizenship: Instill responsible online behavior.'
                                        '\n\nClear Policies: Establish and enforce rules against cyberbullying.'
                                        '\n\nCommunication: Encourage open dialogue about online experiences.'
                                        '\n\nMonitor Activity: Use parental controls and privacy settings.'
                                        '\n\nEmpathy and Kindness: Promote compassion and understanding.'
                                        '\n\nBystander Intervention: Empower bystanders to speak up.'
                                        '\n\nSupport Resources: Provide access to help for victims.'
                                        '\n\nCollaboration: Work with communities and organizations.'
                                        '\n\nLead by Example: Model respectful behavior online.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(4);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 4,
                              )
,
                              ExpansionTile(
                                title: Text(
                                  'G.E.T.R.I.D of Cyberbullying',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/stop-cyber-bullying.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Stopping cyberbullying requires both proactive measures and effective responses to incidents.'
                                        '\n\nImmediate Action: Take prompt action to stop ongoing cyberbullying. This might involve blocking the perpetrator, reporting the behavior to the platform, or contacting authorities if the situation escalates.'
                                        '\n\nDocument Evidence: Keep records of the cyberbullying, including screenshots, messages, and any other relevant information. This documentation can be useful when reporting the incident and seeking support.'
                                        '\n\nReport to Authorities or Platform: Report the cyberbullying to the appropriate authorities, such as school administrators, HR departments, or the social media platform\'s support team. Many platforms have mechanisms for reporting harassment and cyberbullying.'
                                        '\n\nSeek Support: Reach out to trusted friends, family members, or professionals for support. Counseling or therapy can be beneficial for those experiencing the effects of cyberbullying.'
                                        '\n\nEducate and Empower: Educate others about cyberbullying and empower them to take action against it. Encourage bystanders to speak up, support victims, and report abusive behavior.'
                                        '\n\nLegal Action: In severe cases, legal action may be necessary. Consult with legal professionals to understand your options and pursue justice if needed.'
                                        '\n\nPromote Positive Online Culture: Foster a culture of respect and kindness online. Encourage constructive communication and discourage negative behavior.'
                                        '\n\nMonitor and Prevent Recurrence: Keep an eye on online activity to prevent further incidents of cyberbullying. Utilize privacy settings, block lists, and parental controls to protect against future harassment.'
                                        '\n\nProvide Resources and Support: Offer resources and support to victims of cyberbullying, including access to counseling, helplines, and support groups.'
                                        '\n\nFollow Up: Follow up with the victim to ensure their safety and well-being. Address any lingering concerns and continue to offer support as needed.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(5);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 5,
                              ),
                              ExpansionTile(
                                title: Text(
                                  'How to be an Upstander',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/upstander.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Stay Calm and Confident: \nMaintain your composure and confidence when faced with bullying behavior. Bullies often target those who appear vulnerable or react strongly to their actions.'
                                        '\n\nAssert Yourself:\n Clearly and assertively communicate your boundaries to the bully. Use assertive body language and tone of voice to convey confidence and assertiveness.'
                                        '\n\nDon\'t Retaliate: \nAvoid retaliating or responding with aggression, as this can escalate the situation further. Instead, respond calmly and assertively while avoiding physical or verbal confrontations.'
                                        '\n\nSeek Support: \nReach out to trusted friends, family members, teachers, or colleagues for support. It\'s essential to have a support system to lean on during challenging times.'
                                        '\n\nReport the Bullying: \nReport the bullying behavior to authorities or responsible adults, such as teachers, supervisors, or HR departments. Provide them with specific details and evidence of the bullying.'
                                        '\n\nUse Humor or Deflection: \nSometimes, using humor or deflecting the situation with a witty remark can disarm the bully and diffuse tension. However, use this strategy cautiously and only if it feels safe to do so.'
                                        '\n\nBuild Confidence: \nWork on building your self-esteem and confidence through positive self-talk, self-care, and engaging in activities you enjoy. Confidence can deter bullies and make you less susceptible to their behavior.'
                                        '\n\nStand Up for Others: \nIf you witness someone else being bullied, speak up and offer support. Be an ally to those who are targeted and let them know they\'re not alone.'
                                        '\n\nDocument the Bullying:\nKeep a record of the bullying incidents, including dates, times, and details of what occurred. This documentation can be helpful when reporting the bullying and seeking support.'
                                        '\n\nAdvocate for Change: \nAdvocate for anti-bullying policies and initiatives in your school, workplace, or community. Work with others to raise awareness about the impact of bullying and promote a culture of respect and inclusion.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(6);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 6,
                              )
                              ,
                              ExpansionTile(
                                title: Text(
                                  'Cyberbullying against LGBTQ+ Community',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/lgbt.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'How Cyberbullying Happens:'
                                        '\n\nCyberbullying against LGBTQ+ individuals takes various forms online. It includes hateful comments, harassment through messages, outing without consent, doxxing, impersonation, and targeted attacks from online hate groups.'
                                        '\n\nImpact of Cyberbullying:'
                                        '\n\nCyberbullying has severe consequences for LGBTQ+ individuals, leading to mental health issues like depression and anxiety, diminishing self-esteem, social isolation, physical health problems, and hindering academic or work performance.'
                                        '\n\nPreventing Cyberbullying:'
                                        '\n\nPrevention involves education and awareness, reporting and blocking abusive behavior, fostering supportive communities, advocating for legislation, promoting digital literacy, empowering LGBTQ+ individuals to speak out, and providing safe online spaces.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(7);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 7,
                              )
                              ,
                              ExpansionTile(
                                title: Text(
                                  'Legal Remedies for Cyberbullying in India',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/legal.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Information Technology Act, 2000:'
                                        '\n\nSection 66A:'
                                        '\nPreviously, Section 66A of the Information Technology Act dealt with punishment for sending offensive messages through communication services. However, this section was struck down by the Supreme Court of India in 2015 for being unconstitutional.'
                                        '\n\nSection 66E:'
                                        '\nThis section deals with punishment for violation of privacy by capturing, publishing, or transmitting the image of a private area of any person without their consent.'
                                        '\n\nSection 67:'
                                        '\nSection 67 prohibits the publication or transmission of obscene material in electronic form and provides for punishment for the same.'
                                        '\n\nSection 67A:'
                                        '\nThis section deals with the punishment for publishing or transmitting sexually explicit material in electronic form.'
                                        '\n\nIndian Penal Code (IPC):'
                                        '\n\nSection 503:'
                                        '\nThis section deals with criminal intimidation, which can be applicable in cases of cyberbullying involving threats to harm or intimidate individuals.'
                                        '\n\nSection 509:'
                                        '\nSection 509 deals with word, gesture, or act intended to insult the modesty of a woman. It can be applicable in cases of gender-based cyberbullying.'
                                        '\n\nProtection of Children from Sexual Offences (POCSO) Act, 2012:'
                                        '\nThe POCSO Act addresses sexual offenses against children and provides legal remedies for cyberbullying targeting minors.'
                                        '\n\nCivil Remedies:'
                                        '\nVictims of cyberbullying can also pursue civil remedies such as filing defamation suits, seeking restraining orders, or claiming damages for emotional distress.'
                                        '\n\nReporting to Authorities:'
                                        '\nVictims can report instances of cyberbullying to the Cyber Crime Cell of the local police or the Indian Computer Emergency Response Team (CERT-In) for investigation and action.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(8);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 8,
                              )
                              ,
                              ExpansionTile(
                                title: Text(
                                  'How to Avoid Becoming a Bully',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Text(
                                    'Avoiding becoming a bully involves cultivating self-awareness, empathy, and positive communication skills. Here are some steps you can take to prevent yourself from engaging in bullying behavior:'
                                        '\n\nDevelop Self-Awareness:'
                                        '\nReflect on your own behavior and attitudes towards others. Be mindful of any tendencies towards aggression, dominance, or belittling behavior.'
                                        '\n\nFoster Empathy:'
                                        '\nTry to understand others\' perspectives and feelings. Put yourself in their shoes and consider how your actions might affect them emotionally.'
                                        '\n\nPractice Respect:'
                                        '\nTreat others with kindness, respect, and dignity, regardless of differences in opinions, backgrounds, or abilities.'
                                        '\n\nCommunicate Effectively:'
                                        '\nUse assertive communication techniques to express your thoughts and feelings without resorting to aggression or intimidation.'
                                        '\n\nSet Boundaries:'
                                        '\nRespect others\' boundaries and personal space. Avoid invading their privacy or making them feel uncomfortable.'
                                        '\n\nManage Anger and Frustration:'
                                        '\nLearn healthy ways to cope with negative emotions such as anger and frustration, such as deep breathing, taking a break, or seeking support from friends or mentors.'
                                        '\n\nChallenge Biases and Stereotypes:'
                                        '\nBe mindful of stereotypes or prejudices you may hold and actively work to challenge and overcome them.'
                                        '\n\nSeek Help and Support:'
                                        '\nIf you struggle with controlling your behavior or find yourself engaging in bullying tendencies, don\'t hesitate to seek help from a trusted friend, family member, or mental health professional.'
                                        '\n\nPractice Positive Conflict Resolution:'
                                        '\nWhen conflicts arise, seek constructive solutions that respect the feelings and needs of all parties involved. Avoid resorting to aggression, manipulation, or coercion.'
                                        '\n\nLead by Example:'
                                        '\nBe a positive role model for others by demonstrating kindness, empathy, and respectful behavior in your interactions with others.'
                                        '\n\nEducate Yourself:'
                                        '\nStay informed about the impact of bullying and the importance of creating safe and inclusive environments for everyone.'
                                        '\n\nTake Responsibility:'
                                        '\nIf you realize you have hurt someone or acted inappropriately, take responsibility for your actions, apologize sincerely, and make amends if possible.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(9);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 9,
                              )
                              ,
                              ExpansionTile(
                                title: Text(
                                  'Parents Role',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                childrenPadding: EdgeInsets.all(16),
                                children: [
                                  Image.asset(
                                    'images/parentalrole.png', // Replace with your image path
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Parents play a pivotal role in preventing bullying behavior in their children by nurturing empathy, respect, and positive relationships. They can instill these values by fostering open communication, setting clear expectations, and modeling respectful behavior.'
                                        '\n\nAdditionally, monitoring online activities and teaching conflict resolution skills are crucial preventive measures. Promptly addressing instances of bullying sends a clear message of intolerance for such behavior.'
                                        '\n\nEncouraging positive friendships and promoting inclusivity and diversity further reinforce these values. Active involvement in school activities enables parents to stay informed and address any concerns effectively.'
                                        '\n\nSeeking professional help if needed ensures comprehensive support for children\'s well-being. Through these efforts, parents create a culture of kindness and inclusion, significantly reducing the likelihood of their children engaging in bullying behavior.',
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  if (expanded) {
                                    _handleTap(10);
                                  }
                                },
                                initiallyExpanded: _selectedIndex == 10,
                              )
                              ,
                            ]               )
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }
}
