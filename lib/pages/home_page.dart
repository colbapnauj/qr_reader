import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigator.dart';
import 'package:qr_reader/widgets/scan_button.dart';

import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text('Historial'), actions: [
        IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos();
            }),
      ]),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    // TODO Temporal leer la base de daos
    // final tempScan = new ScanModel(valor: 'http://jean.net.pe');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(16);
    // DBProvider.db.getTodosLosScans().then(print);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
