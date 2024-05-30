import 'package:flutter/material.dart';
import 'package:jobs/core/constants/imageassest.dart';

class JobCard extends StatelessWidget {

  const JobCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      CustomCard(),
      Card2(),
      Card3(),
    ]);
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              //'https://example.com/image.jpg',
              AppImageAsset.logo2, // رابط صورة الوظيفة
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'عنوان الوظيفة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'اسم الشركة',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MaterialButton(
                      child: const Text(
                        'التفاصيل',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        // الإجراء عند الضغط
                      },
                    ),
                    const SizedBox(width: 10),
                    MaterialButton(
                      child: const Text(
                        'التقديم',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        // الإجراء عند الضغط
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Card2 extends StatelessWidget {

  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return 
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  elevation: 8,
  margin: const EdgeInsets.all(12),
  child: Column(
    children: <Widget>[
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: Image.asset(
AppImageAsset.logo,

          height: 180.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'عنوان الوظيفة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'اسم الشركة',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('التفاصيل'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // foreground (text) color
                  ),
                  onPressed: () {
                    // الإجراء عند الضغط
                  },
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  child: const Text('التقديم'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green, // foreground (text) color
                  ),
                  onPressed: () {
                    // الإجراء عند الضغط
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
)
;
  }
}



class Card3 extends StatelessWidget {
  const Card3({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0), // حواف مستديرة
  ),
  elevation: 4, // ظل خفيف
  margin: const EdgeInsets.all(10),
  child: InkWell(
    onTap: () {
      // TODO: Navigate to job details
    },
    borderRadius: BorderRadius.circular(15.0),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:AssetImage(AppImageAsset.logo2),
                radius: 30,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     // job.title,
                     "job title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent, // لون بارز
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      // job.company,
                      " job.company,",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
"job.location,",       
               style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.bookmark_border, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image:const AssetImage(AppImageAsset.logo),
                
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
            height: 150,
            width: double.maxFinite,
            
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.info_outline, color: Colors.blue),
                label: const Text('Details', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Apply'),
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.purple, // لون نص الزر
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  )
);  }
}