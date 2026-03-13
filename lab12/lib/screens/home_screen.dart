import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/medicine_provider.dart';
import '../models/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  String selectedType = 'tablet';

  final Map<String, IconData> typeIcons = {
    'tablet': Icons.medication,
    'liquid': Icons.science,
    'cream': Icons.opacity,
    'bandage': Icons.healing,
  };

  void _openModal(Medicine? medicine) {
    if (medicine != null) {
      nameController.text = medicine.name;
      amountController.text = medicine.amount.toString();
      selectedType = medicine.type;
    } else {
      nameController.clear();
      amountController.clear();
      selectedType = 'tablet';
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20, right: 20, top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(medicine == null ? 'เพิ่มยาใหม่' : 'แก้ไขข้อมูลยา',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'ชื่อยา')),
              TextField(controller: amountController, decoration: const InputDecoration(labelText: 'จำนวน'), keyboardType: TextInputType.number),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: typeIcons.entries.map((e) => IconButton(
                  icon: Icon(e.value, color: selectedType == e.key ? Colors.red : Colors.grey, size: 35),
                  onPressed: () => setModalState(() => selectedType = e.key),
                )).toList(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty) return;
                  Provider.of<MedicineProvider>(context, listen: false).addOrUpdateMedicine(
                    medicine?.id, nameController.text, selectedType, int.parse(amountController.text),
                  );
                  Navigator.pop(context);
                },
                child: Text(medicine == null ? 'บันทึก' : 'อัปเดต'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Pharma'), backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
      body: FutureBuilder(
        future: Provider.of<MedicineProvider>(context, listen: false).fetchMedicines(),
        builder: (ctx, snapshot) => Consumer<MedicineProvider>(
          builder: (ctx, data, _) => ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (ctx, i) {
              final item = data.items[i];
              return Card(
                child: ListTile(
                  leading: Icon(typeIcons[item.type], color: Colors.red),
                  title: Text(item.name),
                  subtitle: Text('บันทึกเมื่อ: ${item.date ?? "ไม่มีข้อมูล"}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${item.amount}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => _openModal(item)),
                      IconButton(icon: const Icon(Icons.delete, color: Colors.grey), 
                        onPressed: () => Provider.of<MedicineProvider>(context, listen: false).deleteMedicine(item.id)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _openModal(null), child: const Icon(Icons.add)),
    );
  }
}