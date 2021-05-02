import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onPressed: () {
                _launchURL(_videoUrl);
              }),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bookOpen,
            ),
            onPressed: () {
              _launchURL(_documentUrl);
            },
          ),
        ],
      ),
      body: Center(
        child: Table(
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                _Container(
                  color: _switch ? Colors.transparent : Colors.teal,
                ),
                _Container(),
                _Container(
                  color: _switch ? Colors.pink : Colors.transparent,
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                _Container(),
                _Container(
                  color: _switch ? Colors.pink : Colors.teal,
                ),
                _Container(),
              ],
            ),
            TableRow(
              children: <Widget>[
                _Container(
                  color: _switch ? Colors.pink : Colors.transparent,
                ),
                _Container(),
                _Container(
                  color: _switch ? Colors.transparent : Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Switch'),
        onPressed: () {
          setState(() {
            _switch = !_switch;
          });
        },
      ),
    );
  }

  final _documentUrl =
      'https://api.flutter.dev/flutter/widgets/Table-class.html';

  final _videoUrl = 'https://youtu.be/_lbE0wsVZSw';

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}

class _Container extends StatelessWidget {
  const _Container({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: screenWidth / 4,
        width: screenWidth / 4,
        color: color,
      ),
    );
  }
}