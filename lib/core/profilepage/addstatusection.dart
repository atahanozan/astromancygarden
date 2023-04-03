import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:fortunetell/service/status_service.dart';

class AddStatuSection extends StatefulWidget {
  const AddStatuSection({Key? key}) : super(key: key);

  @override
  State<AddStatuSection> createState() => _AddStatuSectionState();
}

class _AddStatuSectionState extends State<AddStatuSection> {
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
  final StatusService _statusService = StatusService();
  final AuthService _authService = AuthService();

  String? uid, name, email, custom;

  String? _lenght;

  List<String> genders = ['Erkek', 'Kadın'];

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _statuscontroller = TextEditingController();
  String gender = "Erkek";
  String day = "01";
  String month = "01";
  String year = "1950";
  String hour = "01";
  String minute = "00";
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
        email = user?.email;
      });
    });
    FirebaseFirestore.instance
        .collection('Status')
        .where('uid', isEqualTo: uid.toString())
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        setState(() {
          _lenght = element.id.toString();
        });
      }
    });

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: _lenght == null ? 100 : 0,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      'Ekleyeceğiniz kişisel bilgiler yıldız falı için önemlidir. Bu yüzden bilgileri doğru ve eksiksiz doldurduğunuzdan emin olunuz.'),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade50,
                        foregroundColor: Colors.purple),
                    onPressed: () {
                      setState(() {
                        _height = 300;
                      });
                    },
                    child: const Text('Kişisel Bilgilerinizi Ekleyiniz')),
              ],
            ),
          ),
          SizedBox(
            height: _height,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Hakkında')),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: _statuscontroller,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Cinsiyet')),
                    Expanded(
                      flex: 3,
                      child: DropdownButton(
                        value: gender,
                        onChanged: (String? newvalue) {
                          setState(() {
                            gender = newvalue!;
                          });
                        },
                        items: genders.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Doğum Tarihi/Saati')),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          DropdownButton(
                            value: day,
                            onChanged: (String? newvalue) {
                              setState(() {
                                day = newvalue!;
                              });
                            },
                            items: days.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                          DropdownButton(
                            value: month,
                            onChanged: (String? newvalue) {
                              setState(() {
                                month = newvalue!;
                              });
                            },
                            items: months.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                          DropdownButton(
                            value: year,
                            onChanged: (String? newvalue) {
                              setState(() {
                                year = newvalue!;
                              });
                            },
                            items: years.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
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
                            onChanged: (String? newvalue) {
                              setState(() {
                                hour = newvalue!;
                              });
                            },
                            items: hours.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                          DropdownButton(
                            value: minute,
                            onChanged: (String? newvalue) {
                              setState(() {
                                minute = newvalue!;
                              });
                            },
                            items: minutes.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                            color: Colors.purple,
                          ),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {
                          setState(() {
                            _statusService.addStatus(
                              _statuscontroller.text,
                              gender,
                              day,
                              month,
                              year,
                              hour,
                              minute,
                              uid.toString(),
                              '',
                            );
                            _height = 0;
                          });
                        },
                        child: const Text('Tamam'))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
