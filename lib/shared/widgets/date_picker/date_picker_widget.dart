import 'package:flutter/material.dart';
import 'package:payflow_flutterapp/shared/themes/app_text_styles.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: TextStyles.buttonPrimary);

  String getDate() {
    if (date == null)
      return 'Filtrar';
    else
      return "${date!.day}/${date!.month}/${date!.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(getDate()),
        style: style,
        onPressed: (() => pickDate(context)),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));
    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
