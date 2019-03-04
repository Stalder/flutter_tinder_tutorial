import 'package:flutter/material.dart';
import 'package:fluttery/layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.grey,
            size: 40,
          ),
          onPressed: () {}),
      title: Center(child: FlutterLogo(size: 30, colors: Colors.red)),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.chat_bubble,
              color: Colors.grey,
              size: 40,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildCardStack() {
    return AnchoredOverlay(
        showOverlay: true,
        child: new Center(),
        overlayBuilder:
            (BuildContext context, Rect anchorBounds, Offset anchor) {
          return CenterAbout(
            position: anchor,
            child: Container(
                width: anchorBounds.width,
                height: anchorBounds.height,
                padding: EdgeInsets.all(16),
                child: ProfileCard()),
          );
        });
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: new Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RoundIconButton.small(
                  icon: Icons.refresh,
                  iconColor: Colors.orange,
                  onPressed: () {},
                ),
                RoundIconButton.large(
                  icon: Icons.clear,
                  iconColor: Colors.red,
                  onPressed: () {},
                ),
                RoundIconButton.small(
                  icon: Icons.star,
                  iconColor: Colors.blue,
                  onPressed: () {},
                ),
                RoundIconButton.large(
                  icon: Icons.favorite,
                  iconColor: Colors.green,
                  onPressed: () {},
                ),
                RoundIconButton.small(
                  icon: Icons.lock,
                  iconColor: Colors.purple,
                  onPressed: () {},
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCardStack(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({this.icon, this.iconColor, this.onPressed})
      : size = 60;

  RoundIconButton.small({this.icon, this.iconColor, this.onPressed})
      : size = 50;

  RoundIconButton.standart(
      {this.icon, this.iconColor, this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            new BoxShadow(color: const Color(0x11000000), blurRadius: 10)
          ]),
      child: RawMaterialButton(
          shape: CircleBorder(),
          elevation: 0,
          child: Icon(icon, color: iconColor),
          onPressed: onPressed),
    );
  }
}

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Widget _buildBackground() {
    return new Image.asset(
      'assets/photo_1.jpg',
      fit: BoxFit.cover,
    );
  }

  Widget _buildProfileSynopsis() {
    return new Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ])),
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'First Last',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Some description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            )),
            Icon(
              Icons.info,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Color(0x11000000), blurRadius: 5, spreadRadius: 2)
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _buildBackground(),
                _buildProfileSynopsis(),
              ],
            ),
          )),
    );
  }
}
