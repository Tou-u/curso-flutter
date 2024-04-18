import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://phantom-marca.unidadeditorial.es/8b3ad43f8ba8b91f6fcccde0e1a2697e/resize/828/f/jpg/assets/multimedia/imagenes/2024/01/17/17055032869162.jpg'),
          ),
        ),
        title: const Text('Dios'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return MyMessageBubble();
                },
              ),
            ),
            Text('Hola'),
          ],
        ),
      ),
    );
  }
}
