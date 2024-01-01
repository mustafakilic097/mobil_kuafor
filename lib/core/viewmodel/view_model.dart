import 'package:flutter/material.dart';
import 'package:mobil_kuafor/core/model/customer.dart';
import 'package:mobil_kuafor/core/model/calisma_saati.dart';

class ViewModel {
  static List<Customer> sira = [
    Customer(ad: "Müşteri 1", randevuSaat: "12:45"),
    Customer(ad: "Müşteri 2", randevuSaat: "13:45"),
    Customer(ad: "Müşteri 3", randevuSaat: "15:00"),
    Customer(ad: "Müşteri 4", randevuSaat: "16:00"),
    Customer(ad: "Müşteri 5", randevuSaat: "16:30"),
    Customer(ad: "Müşteri 6", randevuSaat: "17:00"),
    Customer(ad: "Müşteri 7", randevuSaat: "18:45"),
  ];

  static List<CalismaSaati> calismaSaati = [
    CalismaSaati(title: "İşe Başlangıç", saat: "10:00", icon: const Icon(Icons.start)),
    CalismaSaati(title: "Öğle arası", saat: "13:00", icon: const Icon(Icons.cookie_outlined)),
    CalismaSaati(title: "Öğle arası bitişi", saat: "13:45", icon: const Icon(Icons.start)),
    CalismaSaati(title: "İş Kapanış", saat: "19:30", icon: const Icon(Icons.close)),
  ];
}
