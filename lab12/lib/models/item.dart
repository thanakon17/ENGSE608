// lib/models/item.dart
class Medicine {
  final String id;
  final String name;
  final String type;
  final int amount;
  final String? date; // เติม ? เพื่อให้เป็น Nullable

  Medicine({
    required this.id,
    required this.name,
    required this.type,
    required this.amount,
    this.date, // เอา required ออกสำหรับ date
  });
}