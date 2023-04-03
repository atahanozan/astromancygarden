import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/profilepage/highsign.dart';
import 'package:fortunetell/core/profilepage/moonsign.dart';
import 'package:fortunetell/core/profilepage/signcommand.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusSectionPage extends StatefulWidget {
  const StatusSectionPage({Key? key}) : super(key: key);

  @override
  State<StatusSectionPage> createState() => _StatusSectionPageState();
}

class _StatusSectionPageState extends State<StatusSectionPage> {
  final AuthService _authService = AuthService();

  String? uid, name, email, imgUrl;
  String gender = "Erkek";
  String day = "01";
  String month = "01";
  String year = "1950";
  String hour = "01";
  String minute = "00";
  double _height = 0;
  String sign = "Koç";

  String koc =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F1.png?alt=media&token=35754344-0317-47d4-96c2-740ab4571004';
  String boga =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F2.png?alt=media&token=1821ffe7-0a85-4976-995e-12a3453ea31b';
  String ikizler =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F3.png?alt=media&token=cc466a48-9157-4557-ac39-4150cccfb027';

  String yengec =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F4.png?alt=media&token=8225c04a-410c-4742-817a-ae7c9a313230';

  String aslan =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F5.png?alt=media&token=dbbb22e7-73a9-41d8-8841-687e82aeeaca';

  String basak =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F6.png?alt=media&token=5397fd8c-8ecf-4f61-b4e9-5f4859db1d90';

  String terazi =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F7.png?alt=media&token=2ee3bbf3-a08e-4f6b-8a78-341426385295';

  String akrep =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F8.png?alt=media&token=fddf1d66-000c-462a-8183-e0d6a421af0a';

  String yay =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F9.png?alt=media&token=8f713342-26a7-4f28-bfbd-3a54d21bb46f';

  String oglak =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F10.png?alt=media&token=739067aa-26de-4fa1-8201-d5cf3e632c08';

  String kova =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F11.png?alt=media&token=173b72de-4a65-4547-b749-d227d5537349';

  String balik =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F12.png?alt=media&token=ef62273c-38c1-4b89-a495-006a58f97f7e';

  @override
  void initState() {
    super.initState();
    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
        email = user?.email;
      });
    });
  }

  List<String> genders = ['Erkek', 'Kadın'];

  List<String> years = [
    "1950",
    "1951",
    "1952",
    "1953",
    "1954",
    "1955",
    "1956",
    "1957",
    "1958",
    "1959",
    "1960",
    "1961",
    "1962",
    "1963",
    "1964",
    "1965",
    "1966",
    "1967",
    "1968",
    "1969",
    "1970",
    "1971",
    "1972",
    "1973",
    "1974",
    "1975",
    "1976",
    "1977",
    "1978",
    "1979",
    "1980",
    "1981",
    "1982",
    "1983",
    "1984",
    "1985",
    "1986",
    "1987",
    "1988",
    "1989",
    "1990",
    "1991",
    "1992",
    "1993",
    "1994",
    "1995",
    "1996",
    "1997",
    "1998",
    "1999",
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
  ];
  List<String> days = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];
  List<String> months = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
  ];
  List<String> hours = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
  ];
  List<String> minutes = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Status')
          .where('uid', isEqualTo: uid.toString())
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Text(
                'Hesaplanıyor...',
                style: TextStyle(color: Colors.green),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot status = snapshot.data!.docs[index];
                  String customday = status['day'];
                  String custommonth = status['month'];
                  String customyear = status['year'];
                  String customhour = status['hour'];
                  String customminute = status['minute'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'KİŞİSEL BİLGİLER',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Hakkında',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${status['status']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                          onTap: () {
                                            TextEditingController
                                                _aboutcontroller =
                                                TextEditingController();
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      content: TextField(
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          label:
                                                              Text('Hakkında'),
                                                        ),
                                                        controller:
                                                            _aboutcontroller,
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.purple,
                                                            ),
                                                            onPressed: () {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Status')
                                                                  .doc(
                                                                      status.id)
                                                                  .update({
                                                                'status':
                                                                    _aboutcontroller
                                                                        .text
                                                              });
                                                              _aboutcontroller
                                                                  .clear();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Düzenle')),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'İptal',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .purple),
                                                            )),
                                                      ],
                                                    ));
                                          },
                                          child:
                                              const Icon(Icons.edit_rounded))),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Cinsiyet',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${status['gender']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      content: DropdownButton(
                                                        value: gender,
                                                        onChanged:
                                                            (String? newvalue) {
                                                          setState(() {
                                                            gender = newvalue!;
                                                          });
                                                        },
                                                        items: genders
                                                            .map((String item) {
                                                          return DropdownMenuItem(
                                                            value: item,
                                                            child: Text(item),
                                                          );
                                                        }).toList(),
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.purple,
                                                            ),
                                                            onPressed: () {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Status')
                                                                  .doc(
                                                                      status.id)
                                                                  .update({
                                                                'gender': gender
                                                              });

                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Düzenle')),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'İptal',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .purple),
                                                            )),
                                                      ],
                                                    ));
                                          },
                                          child:
                                              const Icon(Icons.edit_rounded))),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Doğum Tarihi/Saati',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${status['day']}.${status['month']}.${status['year']}  ${status['hour']}:${status['minute']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _height = 120;
                                            });
                                          },
                                          child:
                                              const Icon(Icons.edit_rounded))),
                                ],
                              ),
                              Container(
                                color: Colors.white70,
                                height: _height,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                DropdownButton(
                                                  dropdownColor: Colors.white,
                                                  value: day,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      day = value!;
                                                    });
                                                  },
                                                  items: days.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                                DropdownButton(
                                                  value: month,
                                                  onChanged:
                                                      (String? newvalue) {
                                                    setState(() {
                                                      month = newvalue!;
                                                    });
                                                  },
                                                  items:
                                                      months.map((String item) {
                                                    return DropdownMenuItem(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                                DropdownButton(
                                                  value: year,
                                                  onChanged:
                                                      (String? newvalue) {
                                                    setState(() {
                                                      year = newvalue!;
                                                    });
                                                  },
                                                  items:
                                                      years.map((String item) {
                                                    return DropdownMenuItem(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                DropdownButton(
                                                  value: hour,
                                                  onChanged:
                                                      (String? newvalue) {
                                                    setState(() {
                                                      hour = newvalue!;
                                                    });
                                                  },
                                                  items:
                                                      hours.map((String item) {
                                                    return DropdownMenuItem(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                                DropdownButton(
                                                  value: minute,
                                                  onChanged:
                                                      (String? newvalue) {
                                                    setState(() {
                                                      minute = newvalue!;
                                                    });
                                                  },
                                                  items: minutes
                                                      .map((String item) {
                                                    return DropdownMenuItem(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _height = 0;
                                                });
                                              },
                                              child: const Text(
                                                'İptal',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              )),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.black),
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection('Status')
                                                    .doc(status.id)
                                                    .update({
                                                  'day': day,
                                                  'month': month,
                                                  'year': year,
                                                  'hour': hour,
                                                  'minute': minute,
                                                });
                                                setState(() {
                                                  _height = 0;
                                                });
                                              },
                                              child: const Text('Düzenle')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'YILDIZ BİLGİLERİ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Burç',
                                                    style:
                                                        GoogleFonts.miltonian(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    status['sign'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Ay Burcu',
                                                    style:
                                                        GoogleFonts.miltonian(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const MoonSign(),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Yükselen Burç',
                                                    style:
                                                        GoogleFonts.miltonian(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  HighSign()
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Burç Özellikleri',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Colors.white,
                                                ),
                                          ),
                                          const SignCommendsSate(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
