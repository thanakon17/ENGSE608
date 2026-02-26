import 'package:flutter/material.dart';

void main() => runApp(const MaterialComponentApp());

class MaterialComponentApp extends StatelessWidget {
  const MaterialComponentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material 3 Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 1, 108, 150)),
        useMaterial3: true,
      ),
      home: const CatalogHomePage(),
    );
  }
}

class CatalogHomePage extends StatefulWidget {
  const CatalogHomePage({super.key});

  @override
  State<CatalogHomePage> createState() => _CatalogHomePageState();
}

class _CatalogHomePageState extends State<CatalogHomePage> {
  String selectedView = 'day'; // สำหรับ SegmentedButton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material 3 Components'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Actions ---
            const SectionHeader(title: '1. Actions'),
            const Text('Common Buttons:', style: TextStyle(color: Color.fromARGB(255, 88, 87, 87))),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(onPressed: null, child: Text('Elevated')),
                FilledButton(onPressed: null, child: Text('Filled')),
                FilledButton.tonal(onPressed: null, child: Text('Tonal')),
                OutlinedButton(onPressed: null, child: Text('Outlined')),
                TextButton(onPressed: null, child: Text('Text')),
              ],
            ),
            const SizedBox(height: 16),
            const Text('FAB Sizes:', style: TextStyle(color: Color.fromARGB(77, 158, 158, 158))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const Divider(height: 40),

            // --- 2. Communication & Selection ---
            const SectionHeader(title: '2. Communication & Selection'),
            const LinearProgressIndicator(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Badge(label: Text('5'), child: Icon(Icons.notifications)),
                Checkbox(value: true, onChanged: (v) {}),
                Switch(value: true, onChanged: (v) {}),
              ],
            ),
            const Divider(height: 40),

            // --- 3. Containment ---
            const SectionHeader(title: '3. Containment'),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Card with ListTile'),
                subtitle: const Text('ตัวอย่างการบรรจุเนื้อหาใน Card'),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ),
            ),
            const Divider(height: 40),

            // --- 4. Selection (Segmented Button) ---
            const SectionHeader(title: '4. Selection (Segmented)'),
            Center(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'day',
                    label: Text('วัน'),
                    icon: Icon(Icons.calendar_view_day),
                  ),
                  ButtonSegment(
                    value: 'month',
                    label: Text('เดือน'),
                    icon: Icon(Icons.calendar_view_month),
                  ),
                  ButtonSegment(
                    value: 'year',
                    label: Text('ปี'),
                    icon: Icon(Icons.calendar_view_week),
                  ),
                ],
                selected: {selectedView},
                onSelectionChanged: (newSelection) {
                  setState(() => selectedView = newSelection.first);
                },
              ),
            ),
            const Divider(height: 40),

            // --- 5. Text Inputs ---
            const SectionHeader(title: '5. Text Inputs'),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรอกข้อมูล',
                hintText: 'กรอกชื่อ-นามสกุล',
                helperText: 'ระบบจะเก็บข้อมูลเป็นความลับ',
              ),
            ),
            const SizedBox(height: 100), // เลื่อนหน้าจอ
          ],
        ),
      ),
      // --- 6. Navigation (AppBar อยู่ด้านบนแล้ว นี่คือ Bottom Navigation) ---
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Widget สำหรับแยกหัวข้อให้สวยงาม
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
