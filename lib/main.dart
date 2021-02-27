// Imports the material package
import 'package:flutter/material.dart'; // Imports the material package
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                const Tab(text: 'Find', icon: Icon(Icons.person, size: 40)),
                const Tab(
                    text: 'Favourite', icon: Icon(Icons.favorite, size: 40)),
                const Tab(text: 'Chat', icon: Icon(Icons.chat, size: 40)),
              ],
              indicatorColor: Colors.transparent,
              labelColor: Colors.pink[600],
              unselectedLabelColor: Colors.grey[600],
            ),
            foregroundColor: Colors.white,
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: [Find_Screen(), Fav_Screen(), Chat_Screen()],
          ),
        ),
      ),
    );
  }
}

class Find_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: new GridView.count(
                crossAxisCount: 3,
                children: new List.generate(100, (index) {
                  return new GridTile(
                      child: new Card(
                    color: Colors.grey[200],
                    child: new Center(
                        child: Icon(
                      Icons.favorite,
                      size: 40,
                      color: Colors.pink[600],
                    )),
                  ));
                }))));
  }
}

class Fav_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
          child: Text('You have no favourites'),
        )));
  }
}

class Chat_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChatWidget(),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: ListView(
        children: <Widget>[
          getSenderView(
              ChatBubbleClipper1(type: BubbleType.sendBubble), context),
          getReceiverView(
              ChatBubbleClipper1(type: BubbleType.receiverBubble), context),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Text getTitleText(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      );

  ChatBubble getSenderView(CustomClipper clipper, BuildContext context) =>
      ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.pink[600],
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Hey Sharon! cool tab bar demo :)",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  ChatBubble getReceiverView(CustomClipper clipper, BuildContext context) =>
      ChatBubble(
        clipper: clipper,
        backGroundColor: Colors.grey[300],
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Hey you! Thanks :D ",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
