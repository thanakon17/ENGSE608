// lib/data/th_cities.dart
class THCity {
  final String name;   // ชื่อเมือง/จังหวัด
  final double lat;    // ละติจูด
  final double lon;    // ลองจิจูด
  const THCity(this.name, this.lat, this.lon);
}

/// เมืองตัวอย่างเดิม (ไว้ให้แอปใช้งานได้ทันที)
const thCities = <THCity>[
  THCity('Bangkok', 13.7563, 100.5018),
  THCity('Chiang Mai', 18.7883, 98.9853),
  THCity('Phuket', 7.8804, 98.3923),
  THCity('Khon Kaen', 16.4419, 102.8350),
  THCity('Udon Thani', 17.3647, 102.8158),
  THCity('Hat Yai', 7.0086, 100.4747),
];

/// จังหวัด "ภาคเหนือ" (เหนือ + เหนือตอนล่าง 17 จังหวัด)
/// พิกัดเป็นตำแหน่งตัวเมืองของแต่ละจังหวัด เหมาะกับการเรียกพยากรณ์ระดับจังหวัด
const thNorthernProvinces = <THCity>[
  // เหนือตอนบน (8 จังหวัด)
  THCity('เชียงใหม่ (Chiang Mai)', 18.7883, 98.9853),
  THCity('เชียงราย (Chiang Rai)', 19.9105, 99.8406),
  THCity('ลำพูน (Lamphun)', 18.5733, 99.0087),
  THCity('ลำปาง (Lampang)', 18.2889, 99.4928),
  THCity('แม่ฮ่องสอน (Mae Hong Son)', 19.3013, 97.9685),
  THCity('น่าน (Nan)', 18.7750, 100.7710),
  THCity('พะเยา (Phayao)', 19.1667, 99.9010),
  THCity('แพร่ (Phrae)', 18.1459, 100.1410),

  THCity('Tokyo (โตเกียว)', 35.6895, 139.6917),
  THCity('Osaka (โอซาก้า)', 34.6937, 135.5023),
  THCity('Kyoto (เกียวโต)', 35.0116, 135.7681),
  THCity('Sapporo (ซัปโปโร)', 43.0611, 141.3544),
  THCity('Fukuoka (ฟุกุโอกะ)', 33.5902, 130.4017),
  THCity('Nagoya (นาโกย่า)', 35.1815, 136.9066),
  THCity('Hiroshima (ฮิโรชิม่า)', 34.3853, 132.4553),
  THCity('Okinawa (โอกินาว่า)', 26.2124, 127.6809),
  THCity('Sendai (เซนได)', 38.2682, 140.8694),
  THCity('Yokohama (โยโกฮาม่า)', 35.4433, 139.6380),
];

/// (ทางเลือก) รวมจังหวัดภาคเหนือเข้ากับรายการหลักไว้ให้เลือกใน Dropdown เดียว
const thCitiesWithNorthern = <THCity>[
  ...thCities,
  ...thNorthernProvinces,
];
