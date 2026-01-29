import 'package:flutter/material.dart';

// 1. สร้าง Class สำหรับเก็บข้อมูลสถานที่ เพื่อให้จัดการง่าย
class Place {
  final String name;
  final String address;
  final String description;
  final String imageUrl;
  final int stars;

  Place({
    required this.name,
    required this.address,
    required this.description,
    required this.imageUrl,
    required this.stars,
  });
}

// 2. เตรียมข้อมูล 5 สถานที่ ใกล้ถนนเจริญประเทศ/ช้างคลาน
final List<Place> places = [
  Place(
    name: 'วัดชัยมงคล (Wat Chai Mongkhon)',
    address: 'ถนนเจริญประเทศ ต.ช้างคลาน อ.เมือง เชียงใหม่',
    description:
        'วัดราษฎร์มหานิกายเก่าแก่ริมแม่น้ำปิง เป็นท่าน้ำสำคัญสำหรับทำบุญปล่อยนกปล่อยปลา บรรยากาศร่มรื่น สวยงามด้วยสถาปัตยกรรมล้านนาผสมผสาน',
    imageUrl:
        'https://today-obs.line-scdn.net/0hohWr1RfUMEdqCyPa2RlPEFJdPDZZbSpOSGh6J0YIO34VJyNFXzhjJE9ZOmtPPHBBSj52IUkCZydOOCQTAg/w1200',
    stars: 41,
  ),
  Place(
    name: 'ขัวเหล็ก (Iron Bridge)',
    address: 'ข้ามแม่น้ำปิง เชื่อมถนนลอยเคราะห์และถนนเจริญประเทศ',
    description:
        'สะพานเหล็กจำลองข้ามแม่น้ำปิง เป็นแลนด์มาร์คยอดฮิตสำหรับถ่ายรูป โดยเฉพาะช่วงพระอาทิตย์ตกและตอนกลางคืนที่มีการเปิดไฟสวยงาม',
    imageUrl:
        'https://scontent.fbkk4-2.fna.fbcdn.net/v/t1.6435-9/161688508_3604561162982268_745628284902618499_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeElC5MatgrcPcM9tXFA5GqvYB0qgn5hU_dgHSqCfmFT98rpVtJEfXOcB7Ecl0P98eyXIzHzOR01Um0p_ym9vQoU&_nc_ohc=E1W59tgSRnwQ7kNvwGs3qdZ&_nc_oc=AdlmVPiMBVU1xZ71EyKl2BakEkehInxT_lDe9SvIIVF7v1FBmg1Xy6sUEaoNXS0YePw&_nc_zt=23&_nc_ht=scontent.fbkk4-2.fna&_nc_gid=EmhMTIYndrf5mepBpde0qg&oh=00_Afq7Qnd8RKCc4fvJmdJJgzG5PaUn0eE1vqGFi477Zmyveg&oe=69990652',
    stars: 55,
  ),
  Place(
    name: 'เชียงใหม่ ไนท์บาซาร์',
    address: 'ถนนช้างคลาน อ.เมือง เชียงใหม่',
    description:
        'ตลาดนัดกลางคืนที่มีชื่อเสียงระดับโลก แหล่งรวมสินค้าพื้นเมือง เสื้อผ้า ของที่ระลึก และสตรีทฟู้ดมากมาย คึกคักไปด้วยนักท่องเที่ยว',
    imageUrl:
        'https://blog.bangkokair.com/wp-content/uploads/2024/08/image-17.png',
    stars: 89,
  ),
  Place(
    name: 'อาสนวิหารพระหฤทัย',
    address: 'ถนนเจริญประเทศ ต.ช้างคลาน อ.เมือง เชียงใหม่',
    description:
        'โบสถ์คริสต์นิกายโรมันคาทอลิกที่สวยงามและเก่าแก่ ทาสีชมพูพาสเทลโดดเด่น เป็นศูนย์รวมจิตใจของคริสต์ศาสนิกชนในเชียงใหม่',
    imageUrl:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2d/97/87/15/caption.jpg?w=1200&h=-1&s=1',
    stars: 35,
  ),
  Place(
    name: 'แม่น้ำปิง (Ping River)',
    address: 'เลียบถนนเจริญประเทศ',
    description:
        'แม่น้ำสายหลักของเชียงใหม่ สามารถเดินเล่นรับลมชมวิวริมน้ำ หรือล่องเรือหางแมงปองชมวิถีชีวิตสองฝั่งแม่น้ำได้',
    imageUrl:
        'https://www.tripgether.com/wp-content/uploads/tripgetter/Aruntara_1.jpg',
    stars: 48,
  ),
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5 สถานที่ท่องเที่ยวใกล้บ้าน',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('สถานที่ท่องเที่ยวใกล้บ้าน'),
          backgroundColor: Colors.deepPurple, // กำหนดสีพื้นหลัง
          foregroundColor: Colors.white, // กำหนดสีตัวอักษรและไอคอนให้เป็นสีขาว
          centerTitle: true,
        ),
        // ใช้ ListView.builder เพื่อสร้างรายการ 5 สถานที่
        body: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            // ส่งข้อมูลสถานที่แต่ละแห่ง (places[index]) ไปสร้างการ์ด
            return PlaceCard(place: places[index]);
          },
        ),
      ),
    );
  }
}

// สร้าง Widget ใหม่ที่รวบรวม Layout ของ 1 สถานที่เอาไว้ด้วยกัน
class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      // ใช้ Card เพื่อความสวยงามและมีขอบเขตชัดเจน
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: [
          ImageSection(imageUrl: place.imageUrl),
          TitleSection(
            name: place.name,
            address: place.address,
            stars: place.stars,
          ),
          const ButtonSection(),
          TextSection(description: place.description),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final String imageUrl;
  const ImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
      // เพิ่ม errorBuilder กันกรณีรูปโหลดไม่ได้
      errorBuilder: (context, error, stackTrace) => Container(
        height: 240,
        color: Colors.grey,
        alignment: Alignment.center,
        child: const Icon(Icons.broken_image, size: 50),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String address;
  final int stars;

  const TitleSection({
    super.key,
    required this.name,
    required this.address,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(address, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          Text('$stars'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  final String description;
  const TextSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}
