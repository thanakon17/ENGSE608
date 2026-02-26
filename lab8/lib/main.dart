import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationApp());
}

// ========================================
// Main Application
// ========================================
class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Components & Navigation Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/actions': (context) => const ActionsScreen(),
        '/communication': (context) => const CommunicationScreen(),
        '/containment': (context) => const ContainmentScreen(),
        '/selection': (context) => const SelectionScreen(),
        '/textinputs': (context) => const TextInputsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}

// ========================================
// หน้าจอที่ 1: Home Screen (Navigation)
// ========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Components & Navigation'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade100, Colors.blue.shade50],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.home_rounded, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Flutter Material Components',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // 1. Navigation (หน้าปัจจุบัน)
            _buildCategoryCard(
              context,
              icon: Icons.navigation,
              title: '1. Navigation',
              subtitle: 'หน้าปัจจุบัน - AppBar, NavigationBar',
              color: Colors.blue,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('คุณอยู่ที่หน้า Navigation แล้ว'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),

            // 2. Actions (ใช้ Navigator.push)
            _buildCategoryCard(
              context,
              icon: Icons.touch_app,
              title: '2. Actions',
              subtitle: 'Buttons, FAB, IconButton',
              color: const Color.fromARGB(255, 250, 158, 0),
              onTap: () {
                // Using the Navigator - push()
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const ActionsScreen(),
                  ),
                );
              },
            ),

            // 3. Communication (ใช้ Named Routes)
            _buildCategoryCard(
              context,
              icon: Icons.message,
              title: '3. Communication',
              subtitle: 'SnackBar, Dialog, Banner',
              color: const Color.fromARGB(255, 0, 157, 255),
              onTap: () {
                // Using Named Routes
                Navigator.pushNamed(context, '/communication');
              },
            ),

            // 4. Containment (ใช้ Navigator.push)
            _buildCategoryCard(
              context,
              icon: Icons.inbox,
              title: '4. Containment',
              subtitle: 'Card, Container, Divider',
              color: Colors.orange,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const ContainmentScreen(),
                  ),
                );
              },
            ),

            // 5. Selection (ใช้ Named Routes)
            _buildCategoryCard(
              context,
              icon: Icons.check_circle,
              title: '5. Selection',
              subtitle: 'Checkbox, Radio, Switch, Chip',
              color: const Color.fromARGB(255, 43, 255, 0),
              onTap: () {
                Navigator.pushNamed(context, '/selection');
              },
            ),

            // 6. Text Inputs (ใช้ Navigator.push)
            _buildCategoryCard(
              context,
              icon: Icons.edit,
              title: '6. Text Inputs',
              subtitle: 'TextField, Form, TextFormField',
              color: const Color.fromARGB(255, 1, 73, 255),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const TextInputsScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================
// หน้าจอที่ 2: Actions
// ========================================
class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2. Actions'),
        backgroundColor: const Color.fromARGB(255, 250, 158, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search pressed')));
            },
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '🎯 Actions Widgets',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'วิดเจ็ตที่ช่วยให้ผู้ใช้ดำเนินการต่างๆ',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // ElevatedButton
          const Text(
            'ElevatedButton',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('With Icon'),
            onPressed: () {},
          ),
          const SizedBox(height: 20),

          // OutlinedButton
          const Text(
            'OutlinedButton',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined Button'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save'),
            onPressed: () {},
          ),
          const SizedBox(height: 20),

          // TextButton
          const Text(
            'TextButton',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          const SizedBox(height: 8),
          TextButton.icon(
            icon: const Icon(Icons.cancel),
            label: const Text('Cancel'),
            onPressed: () {},
          ),
          const SizedBox(height: 20),

          // IconButton
          const Text(
            'IconButton',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.thumb_up), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.favorite),
                color: Colors.red,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Navigation Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purple),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧭 Navigation Method:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Navigator.of(context).push(\n'
                  '  MaterialPageRoute(\n'
                  '    builder: (context) => ActionsScreen(),\n'
                  '  ),\n'
                  ');',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('FAB pressed!')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ========================================
// หน้าจอที่ 3: Communication
// ========================================
class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3. Communication'),
        backgroundColor: const Color.fromARGB(255, 0, 157, 255),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '💬 Communication Widgets',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'วิดเจ็ตสำหรับสื่อสารกับผู้ใช้',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // SnackBar
          Card(
            child: ListTile(
              leading: const Icon(Icons.announcement, color: Colors.green),
              title: const Text('SnackBar'),
              subtitle: const Text('แสดงข้อความชั่วคราวด้านล่างหน้าจอ'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('นี่คือ SnackBar!'),
                    action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // AlertDialog
          Card(
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.orange),
              title: const Text('AlertDialog'),
              subtitle: const Text('แสดงข้อความแจ้งเตือน'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const Text('นี่คือตัวอย่าง AlertDialog'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('ยกเลิก'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('ตกลง'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // SimpleDialog
          Card(
            child: ListTile(
              leading: const Icon(Icons.list, color: Colors.blue),
              title: const Text('SimpleDialog'),
              subtitle: const Text('แสดงรายการตัวเลือก'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('เลือกตัวเลือก'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('ตัวเลือก 1'),
                        ),
                        SimpleDialogOption(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('ตัวเลือก 2'),
                        ),
                        SimpleDialogOption(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('ตัวเลือก 3'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // BottomSheet
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.vertical_align_bottom,
                color: Colors.purple,
              ),
              title: const Text('BottomSheet'),
              subtitle: const Text('แสดงเนื้อหาจากด้านล่าง'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Bottom Sheet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('นี่คือเนื้อหาใน Bottom Sheet'),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('ปิด'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          // Navigation Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧭 Navigation Method:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Navigator.pushNamed(\n'
                  '  context,\n'
                  '  \'/communication\',\n'
                  ');',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================
// หน้าจอที่ 4: Containment
// ========================================
class ContainmentScreen extends StatelessWidget {
  const ContainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4. Containment'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '📦 Containment Widgets',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'วิดเจ็ตสำหรับจัดกลุ่มและแสดงเนื้อหา',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Card
          const Text(
            'Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Card Title',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Card subtitle',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('นี่คือเนื้อหาใน Card สามารถใส่อะไรก็ได้'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Container with decoration
          const Text(
            'Container',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.orange.shade100],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              'Container with gradient and shadow',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),

          // ListTile
          const Text(
            'ListTile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.inbox),
                  title: const Text('Inbox'),
                  subtitle: const Text('5 new messages'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.send),
                  title: const Text('Sent'),
                  subtitle: const Text('20 messages'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Trash'),
                  subtitle: const Text('Empty'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Divider
          const Text(
            'Divider',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const Text('เส้นแบ่ง (Divider)'),
          const Divider(thickness: 2),
          const SizedBox(height: 30),

          // Navigation Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧭 Navigation Method:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Navigator.of(context).push(\n'
                  '  MaterialPageRoute(\n'
                  '    builder: (context) => ContainmentScreen(),\n'
                  '  ),\n'
                  ');',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================
// หน้าจอที่ 5: Selection
// ========================================
class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  bool checkboxValue = false;
  bool switchValue = false;
  int? radioValue = 1;
  bool chip1Selected = false;
  bool chip2Selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5. Selection'),
        backgroundColor: const Color.fromARGB(255, 43, 255, 0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '✅ Selection Widgets',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'วิดเจ็ตสำหรับเลือกตัวเลือก',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Checkbox
          const Text(
            'Checkbox',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            child: CheckboxListTile(
              title: const Text('ยอมรับข้อกำหนดและเงื่อนไข'),
              value: checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue = value ?? false;
                });
              },
            ),
          ),
          const SizedBox(height: 20),

          // Switch
          const Text(
            'Switch',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            child: SwitchListTile(
              title: const Text('เปิดการแจ้งเตือน'),
              subtitle: const Text('รับการแจ้งเตือนทาง push notification'),
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),

          // Radio
          const Text(
            'Radio',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                RadioListTile<int>(
                  title: const Text('ตัวเลือก 1'),
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('ตัวเลือก 2'),
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('ตัวเลือก 3'),
                  value: 3,
                  groupValue: radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Chip
          const Text(
            'Chip',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              FilterChip(
                label: const Text('Flutter'),
                selected: chip1Selected,
                onSelected: (bool selected) {
                  setState(() {
                    chip1Selected = selected;
                  });
                },
              ),
              FilterChip(
                label: const Text('Dart'),
                selected: chip2Selected,
                onSelected: (bool selected) {
                  setState(() {
                    chip2Selected = selected;
                  });
                },
              ),
              const Chip(
                avatar: CircleAvatar(child: Text('A')),
                label: Text('Action Chip'),
              ),
              const Chip(label: Text('Choice Chip')),
            ],
          ),
          const SizedBox(height: 30),

          // Navigation Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.teal),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧭 Navigation Method:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Navigator.pushNamed(\n'
                  '  context,\n'
                  '  \'/selection\',\n'
                  ');',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================
// หน้าจอที่ 6: Text Inputs
// ========================================
class TextInputsScreen extends StatefulWidget {
  const TextInputsScreen({super.key});

  @override
  State<TextInputsScreen> createState() => _TextInputsScreenState();
}

class _TextInputsScreenState extends State<TextInputsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('6. Text Inputs'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '✏️ Text Input Widgets',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'วิดเจ็ตสำหรับรับข้อมูลจากผู้ใช้',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Form with TextFormField
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Form Example',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'ชื่อ',
                    hintText: 'กรุณากรอกชื่อของคุณ',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'อีเมล',
                    hintText: 'example@email.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    if (!value.contains('@')) {
                      return 'อีเมลไม่ถูกต้อง';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    hintText: 'กรุณากรอกรหัสผ่าน',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    if (value.length < 6) {
                      return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Multiline TextField
                TextField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'ข้อความ',
                    hintText: 'กรอกข้อความของคุณที่นี่...',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 24),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ข้อมูลถูกต้อง! ✅'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 29, 153, 254),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
                      'ส่งข้อมูล',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Navigation Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.indigo),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧭 Navigation Method:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Navigator.of(context).push(\n'
                  '  MaterialPageRoute(\n'
                  '    builder: (context) => TextInputsScreen(),\n'
                  '  ),\n'
                  ');',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================
// 404 Not Found Screen
// ========================================
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 - Not Found'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 100, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              'Page Not Found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'The route you are looking for does not exist.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
