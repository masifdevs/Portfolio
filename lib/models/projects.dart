class Project {
  final String? name;
  final String? description;
  final String? image;
  final String? url;
  final List<String>? skills;

  Project({this.name, this.description, this.image, this.url, this.skills});
}

// ignore: non_constant_identifier_names
List<Project> PROJECTS = [
  Project(
    name: 'StockGitter',
    description:
        'If you are an expert or struggling to be better financially, get access to relevant investment tools & learn how to invest risk free by challenging yourself and earning prizes.',
    image: 'images/projects/stockgitter.jpeg',
    url: 'https://play.google.com/store/apps/details?id=alburraq.stockgitter',
    skills: [
      'Flutter',
      'Dart',
      'Rest Apis',
      'In App Purchase',
      'Git',
    ],
  ),
  Project(
    name: 'NeuroForce1 Fitness Trainer',
    description:
        'NeuroForce1\'s mobile fitness app is a highly detailed yet easy to understand tool developed to help you optimize your body and improve your health through a series of workout routines. Each workout routine combines a series of NF1 exercises and movements.',
    image: 'images/projects/nf1.png',
    url: 'https://play.google.com/store/apps/details?id=com.idzyns.nf1app',
    skills: [
      'Flutter',
      'Dart',
      'Rest Apis',
      'In App Purchase',
      'Git',
    ],
  ),
  Project(
    name: 'British Lyceum',
    description:
        'British Lyceum is an Online Educational Portal is providing an online education system where anyone from anywhere can get quality education at any time.',
    image: 'images/projects/britishLyceum.jpeg',
    url: 'https://play.google.com/store/apps/details?id=com.britishlyceum.blis',
    skills: [
      'Flutter',
      'Dart',
      'Firebase',
      'Rest Apis',
      'Video Sdk',
      'Payment Gateway',
      'Git',
    ],
  ),
  Project(
    name: 'American Lyceum',
    description:
        'App for Staff and Management of American Lyceum International School.',
    image: 'images/projects/americanLyceum.png',
    url:
        'https://play.google.com/store/apps/details?id=com.americanlyceum.staff',
    skills: [
      'Flutter',
      'Dart',
      'Rest Apis',
    ],
  ),
  Project(
    name: 'Raed Vendor App',
    description:
        'طبيق رائد للاعمال تطبيق متخصص في فتح المتاجر الالكترونية لرواد الاعمال الصغار وتمكينهم من البيع داخل التطبيق بكل سهوله ويسر وجعل استخدام التطبيق امر سهل وسلس الاستخدام',
    image: 'images/projects/raed.jpeg',
    url: 'https://m.apkpure.com/ar/raed-vendor-app/com.vendor.raed',
    skills: [
      'Flutter',
      'Dart',
      'Firebase',
      'Rest Apis',
      'Git',
    ],
  ),
];
