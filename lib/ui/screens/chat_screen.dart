import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Image.asset('assets/images/potato.jpg'),
                          ),
                          title: Text('Md Jihanur Rahman'),
                          subtitle: Text('Hello'),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
