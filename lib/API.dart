import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class API extends StatefulWidget {
  API({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _APIState();
}

class _APIState extends State<API> {
  String ipAddress = 'Loading ....';
  final url = Uri.https('httpbin.org', 'ip');
  final httpClient = HttpClient();
  @override
  void initState() {
    super.initState();
    _getIPAddress();
  }
  void _getIPAddress() async {
    setState(() => ipAddress = 'Get your ip, please wait ...');
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    print(response.toString());
    var responseBody = await response.transform(utf8.decoder).join();
    String ip = json.decode(responseBody)['origin'];
    setState(() => ipAddress = ip);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check IP'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ipAddress),
            RaisedButton(
              child: Text('Get IP'),
              onPressed: _getIPAddress,
            )
          ],
        ),
      ),
    );
  }
}