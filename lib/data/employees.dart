class Employee {
  Employee(
      {required this.name,
      required this.age,
      required this.job,
      required this.experience,
      required this.description,
      required this.image,
      required this.email,
      required this.phone});

  String name;
  String age;
  List job;
  List experience;
  List description;
  String image;
  String email;
  String phone;
}

var employees = [
  Employee(
      name: 'Pēteris',
      age: '31',
      job: ['Vecākais sistēmu administrators'],
      experience: ['Prakse uzņēmumumā SIA "Tet"'],
      image: 'assets/images/employee_1.png',
      description: [
        'Absolvēju Informācijas Tehnoloģijas Rīgas Tehniskajā universitātē',
        'Neliela interese programēšanā',
        'Brivo laiku labprāt izbaudu ar aktīvo atpūtu',
        'Efektīvi strādāju komandā',
        'Pārvietojos tikai ar savu BMW'
      ],
      email: 'peteris123@gmail.com',
      phone: '28584769'),
  Employee(
      name: 'Andris',
      age: '28',
      job: ['Jaunākais back-end programmētājs'],
      experience: ['2 gadu pieredze PHP programmēšanā'],
      image: 'assets/images/employee_2.jpg',
      description: [
        'Bakalaura grāds datorzinātnēs',
        'Pārzinu latviešu, krievu, angļu valodu',
      ],
      email: 'andrisandris@gmail.com',
      phone: '22558877'),
  Employee(
      name: 'Jānis',
      age: '45',
      job: ['Projektu vadītājs'],
      experience: ['2015.-2017. g. projektu vadītājs "Swedbank"'],
      image: 'assets/images/employee_3.jpg',
      description: [
        'Maģistra grāds ekonomikā',
        'Pārzinu latviešu, krievu, vācu, angļu valodu',
        'B kategorijas vadītāja apliecība',
        'Varu strādāt gan, ofisā, gan mājās'
      ],
      email: 'janiskalns@gmail.com',
      phone: '26565897'),
  Employee(
      name: 'Zane',
      age: '26',
      job: ['UX dizainere'],
      experience: [
        '3 gadu pieredze mājaslapas dizaina izstrādē uzņēmumā "Rimi"'
      ],
      image: 'assets/images/employee_4.jpg',
      description: [
        'Bakalaura grāds datorzinātnēs',
        'Zinu latviešu, angļu valodu',
        'Pilsētā bieži pārvietojos ar velosipēdu',
      ],
      email: 'zaneliepa@gmail.com',
      phone: '23692587'),
  Employee(
      name: 'Linda',
      age: '28',
      job: ['Pārdošanas speciāliste'],
      experience: ['3 gadu pieredze uzņēmumā "Stenders"'],
      image: 'assets/images/employee_5.jpg',
      description: [
        'Bakalaura grāds ekonomikā',
        'Bakalaura grāds uzņēmējdarbībā',
        'Patīk strādāt komandā',
        'Ir liela pieredze attālinātajā darbā'
      ],
      email: 'lindalinda@gmail.com',
      phone: '22335544')
];
