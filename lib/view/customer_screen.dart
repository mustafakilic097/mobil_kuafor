import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../core/viewmodel/view_model.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DatePicker(
                  DateTime.now(),
                  height: 90,
                  locale: "tr_TR",
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.grey,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      // _selectedValue = date;
                    });
                  },
                ),
              ],
            ),
          ),
          const Align(
              alignment: Alignment(-0.95, 0),
              child: Text(
                "Sırada bekleyenler",
              )),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: ViewModel.sira.length,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: showRandevuInfo,
                  child: Ink(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person_2_outlined),
                      ),
                      title: Text(ViewModel.sira[i].ad, style: const TextStyle(fontSize: 14, color: Colors.black)),
                      subtitle: Text(ViewModel.sira[i].randevuSaat, style: const TextStyle(color: Colors.black)),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.info_outline),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Function() get showRandevuInfo => () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Randevu Detayı"),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [const PopupMenuItem(child: Text("İptal Et"))];
                    },
                  )
                ],
              ),
              contentPadding: const EdgeInsets.all(16),
              children: const [
                Text("Müşteri Adı: ********"),
                Text("Randevu alınma saati: 12 Aralık 12:45pm"),
                Text("Müşteri Notu: -"),
                Text("Kuaför Notu: -")
              ],
            );
          },
        );
      };
}
