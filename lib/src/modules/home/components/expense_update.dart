// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoney/src/modules/home/controller/expense_register_controller.dart';
import 'package:mymoney/src/shared/helpers/data_helper.dart';
import 'package:mymoney/src/shared/helpers/text_input_formatter.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/components/app_button.dart';
import '../../../shared/components/bar_modal.dart';
import '../../../shared/helpers/input_mask.dart';
import 'app_title.dart';
import 'package:intl/intl.dart';

class ExpenseUpdateModal extends StatefulWidget {
  late String id;
  late String category;
  late String description;
  late double value;

  ExpenseUpdateModal({
    Key? key,
    required String this.id,
    required String this.category,
    required String this.description,
    required double this.value,
  }) : super(key: key);

  @override
  State<ExpenseUpdateModal> createState() => _ExpenseUpdateModalState();
}

class _ExpenseUpdateModalState extends State<ExpenseUpdateModal> {
  late String categoria;
  late String descripcao;
  late double valor;
  late String registrationData;
  late String dropdownValue;
  late String expense_id;

  ExpenseRegisterController controller = ExpenseRegisterController();
  final TextInputFormatter moneyFormatter = InputMask.moneyFormatter;

  late final TextEditingController moneyTextEditingController =
      TextEditingController(text: moneyFormatter.formatText("0,00"));
  late final TextEditingController descricaoTextEditingController =
      TextEditingController();
  late final TextEditingController categoryController = TextEditingController();
  late final TextEditingController dateController = TextEditingController();

  late DateTime data = DateTime.now();
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
        data = value!;
        initialDateValue = dataFormatada(value);
        dateController.text = initialDateValue;
      });
    });
  }

  double convertToDouble(String string) {
    // Remove símbolos de moeda, espaços em branco à esquerda e substitui ',' por '.'

    String numericString =
        string.trimLeft().replaceAll('R\$', '').replaceAll(',', '.');

    double numericValue = double.parse(numericString);

    return numericValue;
  }

  @override
  void initState() {
    super.initState();
    categoria = widget.category;
    descripcao = widget.description;
    valor = widget.value;
    expense_id = widget.id;

    categoryController.text = categoria;
    descricaoTextEditingController.text = descripcao;
    moneyTextEditingController.text = 'R\$ $valor';
    convertToDouble(moneyTextEditingController.text);
  }

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        backgroundColor: AppColors.appPageBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BarModal(),
              const AppTitle(title: 'Editar despesa'),
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
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 10, left: 5),
                        //============categoria==========//
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.category_outlined,
                              color: Colors.green),
                          enableFeedback: true,
                          isExpanded: true,
                          value: categoryController.text,
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
                              categoryController.text = dropdownValue;
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
                              try {
                                controller.checkDataUpDate(
                                    id: expense_id,
                                    category: categoryController.text,
                                    description:
                                        descricaoTextEditingController.text,
                                    value: convertToDouble(
                                        moneyTextEditingController.text),
                                    registrationDate:
                                        DateHelper.getFormatData(data),
                                    buildContext: context);
                              } catch (e) {
                                print(e);
                              }
                            },
                            label: 'Alterar'),
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
