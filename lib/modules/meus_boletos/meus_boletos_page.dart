import 'package:flutter/material.dart';
import 'package:payflow_flutterapp/shared/themes/app_colors.dart';
import 'package:payflow_flutterapp/shared/themes/app_text_styles.dart';
import 'package:payflow_flutterapp/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow_flutterapp/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        Container(child: BoletoInfoWidget(size: 14)),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Text("Meus boletos", style: TextStyles.titleBoldHeading),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
        ),
        Container(child: BoletoListWidget()),
      ]),
    );
  }
}
