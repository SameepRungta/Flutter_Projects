import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ChatBox extends StatefulWidget {
  final String userEmail;

  const ChatBox({Key? key, required this.userEmail}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _messageController = TextEditingController();
  final BehaviorSubject<List<ChatMessage>> _chatController = BehaviorSubject<List<ChatMessage>>.seeded([]);

  @override
  void initState() {
    super.initState();
    _addSystemMessage('Cot: Hello ${widget.userEmail}! How can I assist you today?');
  }

  @override
  void dispose() {
    _messageController.dispose();
    _chatController.close();
    super.dispose();
  }

  void _addSystemMessage(String message) {
    _chatController.add([..._chatController.value, ChatMessage(message, ChatMessageType.system)]);
  }

  void _addUserMessage(String message) {
    _chatController.add([..._chatController.value, ChatMessage(message, ChatMessageType.user)]);
  }

  void _addBotMessage(String message) {
    _chatController.add([..._chatController.value, ChatMessage(message, ChatMessageType.bot)]);
  }

  void handleUserInput(String userInput) {
    // Convert user input to lowercase for case-insensitivity
    String question = userInput.trim().toLowerCase();
    String botResponse;

    // Replace this block with your actual chatbot service integration logic

    // Add questions and corresponding answers
    Map<String, String> questionsAndAnswers = {
      'hello': 'Hello! Welcome to our cyberbullying prevention chatbot. How can I assist you today?',
      'hi there! may i ask your name?': 'Nice to meet you, [name]! How can I help you stay safe online?',
      'could you please share your age with me?': 'Thank you! Your age can help me provide you with tailored advice. Is there anything specific you would like to discuss?',
      'would you like to learn more about cyberbullying prevention tips?': 'We have plenty of helpful tips to keep you safe online. Would you like me to share them with you, [name]?',
      'have you or someone you know experienced cyberbullying?': 'It is important to know you are not alone. If you would like to talk about it, I am here to listen.',
      'what steps have you taken to protect yourself from cyberbullying?': 'Taking proactive steps can help prevent cyberbullying. Let\'s discuss some strategies to keep you safe online.',
      'do you have any questions or concerns about cyberbullying?': 'Feel free to ask anything! I am here to provide information and support to help you navigate through any questions or concerns you may have.',
      'have you ever witnessed cyberbullying?': 'Witnessing cyberbullying can be distressing. If you have seen it happen, let\'s talk about how you can support the person being targeted.',
      'do you know how to recognize signs of cyberbullying?': 'Recognizing the signs of cyberbullying is crucial. Let\'s go through some common signs together so you can stay vigilant.',
      'would you like to know how to report cyberbullying incidents?': 'Reporting cyberbullying is important for taking action. I can guide you through the process if you would like.',
    };

    if (questionsAndAnswers.containsKey(question)) {
      // If the user's input is a known question, provide the corresponding answer
      botResponse = 'Cot: ${questionsAndAnswers[question]}';
    } else {
      // If it's not a known question, provide a default response
      botResponse = 'Cot: I am sorry, I do not have information on that topic right now.';
    }

    _addUserMessage(userInput);
    _addBotMessage(botResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: _chatController.value.map((message) {
                    return ChatBubble(message);
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: (userInput) {
                      handleUserInput(userInput);
                      _messageController.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    handleUserInput(_messageController.text);
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ChatMessageType { system, user, bot }

class ChatMessage {
  final String message;
  final ChatMessageType type;

  ChatMessage(this.message, this.type);
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble(this.message);

  @override
  Widget build(BuildContext context) {
    Color bubbleColor;
    Alignment alignment;
    FontWeight fontWeight;

    switch (message.type) {
      case ChatMessageType.system:
        bubbleColor = Colors.grey.shade300;
        alignment = Alignment.center;
        fontWeight = FontWeight.normal;
        break;
      case ChatMessageType.user:
        bubbleColor = Colors.blueAccent;
        alignment = Alignment.centerRight;
        fontWeight = FontWeight.bold;
        break;
      case ChatMessageType.bot:
        bubbleColor = Colors.greenAccent;
        alignment = Alignment.centerLeft;
        fontWeight = FontWeight.bold;
        break;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: alignment,
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
