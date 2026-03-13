import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // อย่าลืม flutter pub add intl
import '../models/item.dart';
import '../helpers/db_helper.dart';
import 'package:uuid/uuid.dart';

class MedicineProvider with ChangeNotifier {
  List<Medicine> _items = [];
  List<Medicine> get items => [..._items];

  Future<void> fetchMedicines() async {
    final dataList = await DBHelper.getData('inventory');
    _items = dataList.map((item) => Medicine(
      id: item['id'],
      name: item['name'],
      type: item['type'],
      amount: item['amount'],
      date: item['date'] ?? '',
    )).toList();
    notifyListeners();
  }

  Future<void> addOrUpdateMedicine(String? id, String name, String type, int amount) async {
    final dateStr = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    final medicineId = id ?? const Uuid().v4();
    
    final newMedicine = {
      'id': medicineId,
      'name': name,
      'type': type,
      'amount': amount,
      'date': dateStr,
    };

    await DBHelper.insert('inventory', newMedicine);
    await fetchMedicines(); // ดึงข้อมูลใหม่หลังบันทึก
  }

  Future<void> deleteMedicine(String id) async {
    await DBHelper.delete('inventory', id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}