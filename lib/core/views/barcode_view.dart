import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BarcodeView extends StatefulWidget {
  String? valueBarcode;
  BarcodeView({this.valueBarcode, Key? key}) : super(key: key);

  @override
  State<BarcodeView> createState() => _BarcodeViewState();
}

class _BarcodeViewState extends State<BarcodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Barcode for ${widget.valueBarcode}'.toLowerCase(),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 250,
              child: SfBarcodeGenerator(
                value: widget.valueBarcode,
                symbology: QRCode(),
                showValue: false,
              ),
            ),
            SizedBox(
              height: 200,
              child: SfBarcodeGenerator(
                value: widget.valueBarcode,
                symbology: Code128(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
