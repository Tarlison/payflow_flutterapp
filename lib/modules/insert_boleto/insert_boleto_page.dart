import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:payflow_flutterapp/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow_flutterapp/shared/themes/app_colors.dart';
import 'package:payflow_flutterapp/shared/themes/app_text_styles.dart';
import 'package:payflow_flutterapp/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow_flutterapp/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;

  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dueDataInputTextController = MaskedTextController(mask: "00/00/0000");

  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: BackButton(
            color: AppColors.input,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 93),
                  child: Text(
                    "Preencha os dados do boleto",
                    style: TextStyles.titleBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                        label: "Nome do boleto",
                        icon: Icons.description_outlined,
                        validator: controller.validateName,
                      ),
                      InputTextWidget(
                        onChanged: (value) {
                          controller.onChange(dueDate: value);
                        },
                        controller: dueDataInputTextController,
                        label: "Vencimento",
                        icon: FontAwesomeIcons.timesCircle,
                        validator: controller.validateVencimento,
                      ),
                      InputTextWidget(
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                        controller: moneyInputTextController,
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        validator: (_) => controller.validateValor(
                            moneyInputTextController.numberValue),
                      ),
                      InputTextWidget(
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                        controller: barcodeInputTextController,
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        validator: controller.validateCodigo,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: SetLabelButtons(
          primaryLabel: "Cancelar",
          primaryOnPressed: () {
            Navigator.pop(context);
          },
          secondaryLabel: "Cadastrar",
          secondaryOnPressed: () async {
            await controller.cadastrarBoleto();
            Navigator.pop(context);
          },
          enableSecundaryColor: true,
        ));
  }
}
