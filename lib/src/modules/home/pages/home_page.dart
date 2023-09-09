import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mymoney/src/modules/home/components/app_title.dart';
import 'package:mymoney/src/modules/home/components/expanse_count.dart';
import 'package:mymoney/src/modules/home/components/expense_list.dart';
import 'package:mymoney/src/modules/home/components/management_idicator.dart';
import 'package:mymoney/src/modules/home/controller/home_controller.dart';
import 'package:mymoney/src/modules/personalRegister/pages/personalRegister_page.dart';
import 'package:mymoney/src/shared/components/app_button.dart';
import 'package:mymoney/src/shared/components/custom_bottom_bar.dart';
import 'package:mymoney/src/shared/components/expense_button.dart';
import 'package:mymoney/src/shared/components/logout_dialog.dart';
import '../../../config/appKeys.dart';
import '../../../config/app_settings.dart';
import '../../../shared/colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Logout_dialog logout_dialog = Logout_dialog();
  HomeController controller = HomeController();

  //======AppBar name=======//
  late String? savedName = '';

  void loadSavedValue() async {
    String? valueName = await AppSettings.getData(AppKeys.user_fullName);
    setState(() {
      savedName = valueName;
    });
  }
  //========================//

  @override
  void initState() {
    super.initState();
    controller.loadData;
    loadSavedValue();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.logo,
          elevation: 10,
          leading: IconButton(
            icon: const Icon(Icons.settings_sharp),
            color: AppColors.initialPageBackground,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const personalRegisterPage()));
            },
          ),
          title: Text(
            '$savedName',
          ),
          titleTextStyle: const TextStyle(
              color: AppColors.initialPageBackground, fontSize: 20),
          titleSpacing: -10,
          shadowColor: AppColors.black,
          actions: [
            IconButton(
              onPressed: () {
                logout_dialog.throwDialog(context);
              },
              icon: const Icon(Icons.logout),
              color: AppColors.appPageBackground,
            ),
          ],
        ),
        backgroundColor: AppColors.appPageBackground,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppTitle(title: "Dashboard My Money"),
                    Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ExpenseCount(
                          title: "Gasto acumulativo",
                          icon: Icons.trending_down_rounded,
                          valor: controller.accValue,
                          color: AppColors.expense,
                        ),
                        ExpenseCount(
                          title: "Gasto planejado",
                          icon: Icons.trending_up_rounded,
                          valor: controller.goalValue,
                          color: AppColors.logo,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xB3D0D2D1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ManegementIndicator(
                                      value: 20,
                                      subtitle: "Saldo gasto planejado",
                                      isMoney: true,
                                      isASC: false,
                                      maxValueAxis: 1,
                                      minValueAxis: 0),
                                  ManegementIndicator(
                                      value: 20,
                                      subtitle: "Saldo despesa diária",
                                      isMoney: true,
                                      isASC: false,
                                      maxValueAxis: 1,
                                      minValueAxis: 0)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ManegementIndicator(
                                      value: 2,
                                      subtitle: "Dias decorridos",
                                      isMoney: false,
                                      maxValueAxis: 1,
                                      minValueAxis: 0),
                                  ManegementIndicator(
                                      value: 20,
                                      subtitle: "Despesa do dia",
                                      isMoney: true,
                                      maxValueAxis: 1,
                                      minValueAxis: 0)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: ExpenseList(
                        expenses: controller.expenses,
                        title: "Gastos Recentes"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: AppButton(action: () {}, label: "Historico"),
                  )
                ],
              ),
            ),
          )),
        ),
        floatingActionButton: ExpenseButton.add(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBar(
          shape: CircularNotchedRectangle(),
        ),
      );
    });
  }

}
