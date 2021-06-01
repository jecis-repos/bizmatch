class Entrepreneur {
  Entrepreneur(
      {required this.name,
      required this.age,
      required this.idea,
      required this.job,
      required this.description,
      required this.image,
      required this.email,
      required this.phone});

  String name;
  String age;
  List idea;
  List job;
  List description;
  String image;
  String email;
  String phone;
}

var entrepreneurs = [
  Entrepreneur(
    name: 'Oļģerts',
    age: '27',
    idea: [
      'Aplikācijas izstrāde, kas paredzēta izmantošanai kulinārijas nozarē.'
    ],
    job: ['Programmētāju', 'Dizaineri', 'Biznesa plānotāju'],
    image: 'assets/images/entrepreneur_1.png',
    description: [
      'Absolvēju Biznesa ekonomiku RTU',
      'Attīstu biznesu kulinarijas jomā',
      'Patīk garas pastaigas gar jūru',
      'Veģetārietis',
      'Pārvietojos tikai ar savu Teslu'
    ],
    email: 'olis1234@inbox.lv',
    phone: '27897897',
  ),
  Entrepreneur(
    name: 'Oskars',
    age: '35',
    idea: ['Mājaslapas izstrāde mājražotājam (medus).'],
    job: ['Back-end programmētāju', 'Front-end programmētāju'],
    image: 'assets/images/entrepreneur_2.jpg',
    description: [
      'Bakalaura grāds uzņēmējdarbībā',
      'Iepriekšēja pieredze pārdošanā',
    ],
    email: 'oskarsbriedis@gmail.com',
    phone: '20506080',
  ),
  Entrepreneur(
    name: 'Sandis',
    age: '29',
    idea: ['Digitālā satura veidošana jaunai mūzikas grupai.'],
    job: ['Pārdošanas speciālistu', 'Satura veidotāju'],
    image: 'assets/images/entrepreneur_3.jpg',
    description: [
      'Kaislība- mūzika, īpaši roks',
      'Esmu aktīvs, sportisks',
      'Nedēļas nogales pavadu uz velosipēda',
    ],
    email: 'sandis4576@gmail.com',
    phone: '24548514',
  ),
  Entrepreneur(
    name: 'Madara',
    age: '35',
    idea: [
      'Informatīvas mājaslapas un sociālās kampaņas izveide par "zaļo" dzīvesveidu.'
    ],
    job: ['Full-stack programmētāju', 'UX dizaineri', 'Satura veidotāju'],
    image: 'assets/images/entrepreneur_4.jpg',
    description: [
      'Iepriekšēja pieredze darbā pašvaldībā',
      'Piekopju un vēlos veicināt "zaļo" dzīvesveidu',
      'Vegāne',
      'Agrāk nodarbojos arī ar bērnu pasākumu organizēšanu',
    ],
    email: 'madara123456@gmail.com',
    phone: '20201458',
  )
];
