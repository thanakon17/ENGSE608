import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/th_cities.dart';
import 'models/weather_models.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider()..load(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TH Weather (Open-Meteo)',
      theme: ThemeData(useMaterial3: false, colorSchemeSeed: const Color.fromARGB(255, 79, 226, 255)),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<WeatherProvider>();
    final items = thNorthernProvinces;

    // ถ้า selected ไม่อยู่ใน items ให้ fallback เป็น items.first
    final safeValue = items.contains(p.selected) ? p.selected : items.first;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('สภาพอากาศประเทศไทย (Open-Meteo API)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ตอนนี้'),
              Tab(text: 'รายชั่วโมง'),
              Tab(text: '7 วัน'),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => context.read<WeatherProvider>().refresh(),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text('เมือง: ', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButton<THCity>(
                        isExpanded: true,
                        value: safeValue,
                        items: items
                            .map((c) => DropdownMenuItem(
                                  value: c,
                                  child: Text(
                                      '${c.name} (${c.lat.toStringAsFixed(2)}, ${c.lon.toStringAsFixed(2)})'),
                                ))
                            .toList(),
                        onChanged: (c) {
                          if (c != null) context.read<WeatherProvider>().selectCity(c);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (p.loading)
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Center(child: CircularProgressIndicator()),
                ),
              if (p.error != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('เกิดข้อผิดพลาด: ${p.error}',
                      style: const TextStyle(color: Colors.red)),
                ),
              if (!p.loading && p.error == null && p.bundle != null)
                SizedBox(
                  height: 700, // โซนแท็บ (เลื่อนอิสระ)
                  child: TabBarView(
                    children: [
                      _NowTab(bundle: p.bundle!, cityName: p.selected.name),
                      _HourlyTab(bundle: p.bundle!),
                      _DailyTab(bundle: p.bundle!),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NowTab extends StatelessWidget {
  final WeatherBundle bundle;
  final String cityName;
  const _NowTab({required this.bundle, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = bundle.current;
    final desc = weatherCodeToText(c.weatherCode);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(cityName, style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${c.temperature.toStringAsFixed(1)}°C',
                    style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Text(emojiForCode(c.weatherCode, c.isDay), style: const TextStyle(fontSize: 32)),
              ],
            ),
            const SizedBox(height: 8),
            Text(desc, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 8),
            Wrap(spacing: 16, runSpacing: 8, children: [
              _Chip('รู้สึกร้อนจริง', '${c.apparentTemperature.toStringAsFixed(1)}°C'),
              _Chip('ความชื้น', '${c.humidity.toStringAsFixed(0)}%'),
              _Chip('ลม', '${c.windSpeed.toStringAsFixed(1)} m/s'),
              _Chip('ช่วงเวลา', c.isDay ? 'กลางวัน' : 'กลางคืน'),
            ]),
          ]),
        ),
      ),
    );
  }
}

class _HourlyTab extends StatelessWidget {
  final WeatherBundle bundle;
  const _HourlyTab({required this.bundle});

  @override
  Widget build(BuildContext context) {
    // แสดงเฉพาะ 24 ชม.ถัดไป
    final now = DateTime.now();
    final next24 = bundle.hourly
        .where((h) => h.time.isAfter(now))
        .take(24)
        .toList();

    if (next24.isEmpty) {
      return const Center(child: Text('ไม่มีข้อมูลรายชั่วโมง'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: next24.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final h = next24[i];
        final hhmm = '${h.time.hour.toString().padLeft(2, '0')}:${h.time.minute.toString().padLeft(2, '0')}';
        return ListTile(
          leading: Text(hhmm, style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text('${h.temperature.toStringAsFixed(1)}°C'),
          subtitle: Text(
            '${weatherCodeToText(h.weatherCode)}'
            '${h.precipitationProb != null ? ' • โอกาสฝน ${h.precipitationProb}%' : ''}'
            '${h.humidity != null ? ' • ความชื้น ${h.humidity!.toStringAsFixed(0)}%' : ''}',
          ),
          trailing: Text('${h.windSpeed.toStringAsFixed(1)} m/s'),
        );
      },
    );
  }
}

class _DailyTab extends StatelessWidget {
  final WeatherBundle bundle;
  const _DailyTab({required this.bundle});

  @override
  Widget build(BuildContext context) {
    final days = bundle.daily;
    if (days.isEmpty) {
      return const Center(child: Text('ไม่มีข้อมูลรายวัน'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: days.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final d = days[i];
        final dateStr = '${d.date.day.toString().padLeft(2, '0')}/'
            '${d.date.month.toString().padLeft(2, '0')}';
        final emoji = emojiForCode(d.weatherCode, true);
        return ListTile(
          leading: Text(dateStr, style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text('$emoji  ${weatherCodeToText(d.weatherCode)}'),
          subtitle: Text(
            'สูงสุด ${d.tMax.toStringAsFixed(1)}°C • ต่ำสุด ${d.tMin.toStringAsFixed(1)}°C'
            '${d.precipitationProbMax != null ? ' • โอกาสฝนสูงสุด ${d.precipitationProbMax}%' : ''}'
            '${d.precipitationSum != null ? ' • ปริมาณฝนรวม ${d.precipitationSum!.toStringAsFixed(1)} มม.' : ''}',
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final String value;
  const _Chip(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value'),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
