import 'package:flutter/material.dart';
import 'package:payflow_flutterapp/shared/themes/app_colors.dart';
import 'package:payflow_flutterapp/shared/themes/app_text_styles.dart';
import 'package:payflow_flutterapp/shared/widgets/label_button/label_button.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Escaneie o código de barras do boleto",
          style: TextStyles.buttonBackground,
        ),
        leading: BackButton(color: AppColors.background),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.black,
          )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
              )),
          Expanded(
              child: Container(
            color: Colors.black,
          )),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: LabelButton(
                  label: "Inserir código do boleto", onPressed: () {})),
          Expanded(
              child:
                  LabelButton(label: "Adicionar da galeria", onPressed: () {}))
        ],
      ),
    );
  }
}
