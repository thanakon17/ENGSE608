// Function 1: ไม่รับค่า / ไม่รีเทิร์นค่า
void showTitle() {
  print("=== ระบบเกรดของวิชา Dart ===");
}

// Function 2: รับค่า (ชื่อ + คะแนน) / ไม่รีเทิร์นค่า
void printStudentScore(String name, double score) {
  print("แสดงข้อมูลนักศึกษา");
  print("ชื่อ: $name");
  print("คะแนน: $score");
}

// Function 3: ไม่รับค่า / รีเทิร์นค่า (ชื่อวิชา)
String getCourseName() {
  return "Dart Programming";
}

// Function 4: รับค่า (คะแนน) / รีเทิร์นค่า (เกรด A–F)
String calculateGrade(double score) {
  if (score >= 80) return "A";
  else if (score >= 70) return "B";
  else if (score >= 60) return "C";
  else if (score >= 50) return "D";
  else return "F";
}

void main() {
  // Function 1
  showTitle();

  // Function 3
  String course = getCourseName();
  print("รายวิชา: $course");
  print("-----------");

  // Function 2
  printStudentScore("Tanapat", 78.5);

  // Function 4
  String grade = calculateGrade(78.5);
  print("เกรดที่ได้: $grade");
}