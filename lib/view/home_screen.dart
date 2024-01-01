import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;
import 'package:get/get.dart';
import '../core/base/state/base_state.dart';
import '../core/base/view/base_view.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import '../core/viewmodel/view_model.dart';
import 'customer_screen.dart';
import 'kuafor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onPageBuilder: (BuildContext context, String value) {
        return Scaffold(
          appBar: appBar,
          body: screenMode ? const CustomerScreen() : const KuaforScreen(),
          floatingActionButton: !screenMode
              ? null
              : FloatingActionButton.extended(
                  onPressed: showSiraAl,
                  isExtended: true,
                  label: const Text("Sıra Al"),
                  icon: const Icon(Icons.add),
                ),
        );
      },
      onModelReady: (WidgetRef model) {},
    );
  }

  AppBar get appBar => AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: InkWell(
            onTap: () {
              setState(() {
                screenMode = !screenMode;
              });
            },
            child: const Text('Erkek Kuaförü')),
        actions: [
          IconButton(onPressed: showBerberInfo, icon: const Icon(Icons.info_outlined)),
          Switch(
              value: berberAktif,
              onChanged: (v) {
                setState(() {
                  berberAktif = v;
                });
              }),
        ],
      );
  Function() get showBerberInfo => () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Çalışma Saatleri"),
              children: [
                SizedBox(
                  height: 300,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(child: ViewModel.calismaSaati[i].icon),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(ViewModel.calismaSaati[i].saat),
                              ),
                              const Text(" ~ "),
                              Text(ViewModel.calismaSaati[i].title),
                            ],
                          ),
                        );
                      },
                      itemCount: ViewModel.calismaSaati.length),
                )
              ],
            );
          },
        );
      };

  Function() get showSiraAl => () {
        return picker.DatePicker.showDateTimePicker(
          context,
          minTime: DateTime.now(),
          maxTime: DateTime.now().add(const Duration(days: 7)),
          locale: picker.LocaleType.tr,
          onConfirm: (time) {
            Get.printInfo(info: time.day.toString());
          },
        );
      };
}
