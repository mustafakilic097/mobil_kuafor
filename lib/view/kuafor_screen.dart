import 'package:flutter/material.dart';

import '../core/viewmodel/view_model.dart';


class KuaforScreen extends StatefulWidget {
  const KuaforScreen({super.key});

  @override
  State<KuaforScreen> createState() => _KuaforScreenState();
}

class _KuaforScreenState extends State<KuaforScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: ViewModel.sira.length,
            itemBuilder: (context, i) {
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Ara Ver")),
              ElevatedButton(onPressed: () {}, child: const Text("Dükkanı Kapat"))
            ],
          ),
        )
      ],
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
                      return [
                        const PopupMenuItem(child: Text("Mesaj Gönder")),
                        const PopupMenuItem(child: Text("İptal Et"))
                      ];
                    },
                  )
                ],
              ),
              contentPadding: const EdgeInsets.all(16),
              children: const [
                Text("Müşteri Adı: Nazmi B."),
                Text("Randevu alınma saati: 12 Aralık 11:45pm"),
                Text("Müşteri Notu: -"),
                Text("Kuaför Notu: -")
              ],
            );
          },
        );
      };
}
