import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoney/src/shared/helpers/text_input_formatter.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/components/app_button.dart';
import '../../../shared/components/bar_modal.dart';
import '../../../shared/helpers/input_mask.dart';
import 'app_title.dart';
import 'package:intl/intl.dart';

class ExpenseRegisterModal extends StatefulWidget {
  const ExpenseRegisterModal({super.key});

  @override
  State<ExpenseRegisterModal> createState() => _ExpenseRegisterModalState();
}

class _ExpenseRegisterModalState extends State<ExpenseRegisterModal> {
  final TextInputFormatter moneyFormatter = InputMask.moneyFormatter;

  late final TextEditingController? moneyTextEditingController =
      TextEditingController(text: moneyFormatter.formatText("0,00"));

  late final TextEditingController? descricaoTextEditingController =
      TextEditingController();

  late final TextEditingController? dateController = TextEditingController();

  String dropdownValue = 'Alimentação';

  DateTime data = DateTime.now();
  late String initialDateValue = dataFormatada(data);

  String dataFormatada(DateTime data_) {
    final DateFormat formatadorData = DateFormat('dd/MM/yyyy');

    String dataFormatada = formatadorData.format(data_);

    return dataFormatada;
  }

  void _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: data,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        initialDateValue = dataFormatada(value!);
      });
    });
  }

  void printValue() {
    print('$moneyTextEditingController');
    print('$descricaoTextEditingController');
    print('$dateController');
  }

  @override
  void initState() {
    super.initState();
    printValue();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = <String>[
      'Alimentação',
      'Casa',
      'Dívidas',
      'Educaçao',
      'Lazer',
      'Pessoal',
      'Saúde',
      'Serviço',
      'Transporte'
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        backgroundColor: AppColors.appPageBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BarModal(),
              const AppTitle(title: 'Nova despesa'),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //========= campo do valor============//
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [moneyFormatter],
                        controller: moneyTextEditingController,
                        enabled: true,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      //====================================//

                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        //============Descrição=============//
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: descricaoTextEditingController,
                          enabled: true,
                          textAlign: TextAlign.start,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              label: Text(
                                'Descrição',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              prefixIcon: Icon(
                                Icons.description_outlined,
                                color: Colors.green,
                              )),
                        ),
                        //================================//
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 10, left: 5),
                        //============categoria==========//
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.category_outlined,
                              color: Colors.green),
                          enableFeedback: true,
                          isExpanded: true,
                          value: dropdownValue,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.green,
                          ),
                          onChanged: (String? valor) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = valor!;
                            });
                          },
                          items: categories
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      //========================================//

                      //================Data====================//
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: CupertinoActionSheetAction(
                            
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  initialDateValue,
                                  style: const TextStyle(
                                    color: AppColors.logo,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    height: 1,
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: AppColors.logo,
                                ),
                              ],
                            ),
                            onPressed: () {
                              _showDataPicker();
                            }),
                      ),

                      Container(
                          height: 1,
                          color: Colors.green,
                          margin: const EdgeInsets.only(right: 8, left: 5)),
                      //===============================//

                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: AppButton(
                            action: () {
                              Navigator.pop(context);
                            },
                            label: 'Despesa'),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
