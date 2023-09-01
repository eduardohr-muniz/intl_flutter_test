import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl_flutter_test/src/core/locale_def.dart';
import 'package:intl_flutter_test/src/currency_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  final LocaleDef locale;
  const HomePage({
    Key? key,
    required this.locale,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Locale _isBrazil(String value) {
    if (value == "pt_BR") return const Locale("pt", "BR");
    return Locale(value);
  }

  @override
  Widget build(BuildContext context) {
    final currencyEC = TextEditingController();
    String name = "Eduardo";
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.helloWord),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            Text(localizations.wellcome(name)),
            const SizedBox(height: 20),
            DropdownMenu(
                initialSelection: "pt",
                onSelected: (value) {
                  widget.locale.setLocale(_isBrazil(value.toString()));
                },
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "pt", label: "pt"),
                  DropdownMenuEntry(value: "pt_BR", label: "pt_BR"),
                  DropdownMenuEntry(value: "en", label: "en"),
                ]),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [CurrencyTextInputFormatter(decimalDigits: 2, locale: Intl.defaultLocale, symbol: "")],
              controller: currencyEC,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Currency"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());
                },
                child: Text(localizations.buttonShowCalendar))
          ],
        )),
      ),
    );
  }
}
