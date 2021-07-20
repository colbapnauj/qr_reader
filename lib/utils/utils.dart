import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final _url = scan.valor;
  if (scan.tipo == 'http') {
    // abrir el sitio web
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
