import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/auth.dart';

class MoonSign extends StatefulWidget {
  const MoonSign({Key? key}) : super(key: key);

  @override
  State<MoonSign> createState() => _MoonSignState();
}

class _MoonSignState extends State<MoonSign> {
  final AuthService _authService = AuthService();

  String? uid, name, email, imgUrl;

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

  List<String> moon1 = [
    '1939',
    '1958',
    '1977',
    '1996',
  ];
  List<String> moon2 = [
    '1940',
    '1959',
    '1978',
    '1997',
  ];
  List<String> moon3 = [
    '1941',
    '1960',
    '1979',
    '1998',
  ];
  List<String> moon4 = [
    '1942',
    '1961',
    '1980',
    '1999',
  ];
  List<String> moon5 = [
    '1943',
    '1962',
    '1981',
    '2000',
  ];
  List<String> moon6 = [
    '1944',
    '1963',
    '1982',
    '2001',
  ];
  List<String> moon7 = [
    '1945',
    '1964',
    '1983',
    '2002',
  ];
  List<String> moon8 = [
    '1946',
    '1965',
    '1984',
    '2003',
  ];
  List<String> moon9 = [
    '1947',
    '1966',
    '1985',
    '2004',
  ];
  List<String> moon10 = [
    '1948',
    '1967',
    '1986',
    '2005',
  ];
  List<String> moon11 = [
    '1949',
    '1968',
    '1987',
    '2006',
  ];
  List<String> moon12 = [
    '1950',
    '1969',
    '1988',
    '2007',
  ];
  List<String> moon13 = [
    '1951',
    '1970',
    '1989',
    '2008',
  ];
  List<String> moon14 = [
    '1952',
    '1971',
    '1990',
    '2009',
  ];
  List<String> moon15 = [
    '1953',
    '1972',
    '1991',
    '2010',
  ];
  List<String> moon16 = [
    '1954',
    '1973',
    '1992',
    '2011',
  ];
  List<String> moon17 = [
    '1955',
    '1974',
    '1993',
    '2012',
  ];
  List<String> moon18 = [
    '1956',
    '1975',
    '1994',
    '2013',
  ];
  List<String> moon19 = [
    '1957',
    '1976',
    '1995',
    '2014',
  ];

  List<String> signs = [
    'Koç',
    'Boğa',
    'İkizler',
    'Yengeç',
    'Aslan',
    'Başak',
    'Terazi',
    'Akrep',
    'Yay',
    'Oğlak',
    'Kova',
    'Balık',
  ];

  List<int> addValue = [
    0,
    1,
    1,
    1,
    2,
    2,
    3,
    3,
    4,
    4,
    5,
    5,
    5,
    6,
    6,
    7,
    7,
    8,
    8,
    9,
    9,
    10,
    10,
    10,
    11,
    11,
    12,
    12,
    1,
    1,
    2,
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
              ? const Text('deneme')
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot moon = snapshot.data!.docs[index];
                    String dtYear = '${moon['year']}';
                    String dtMonth = '${moon['month']}';
                    String dtDay = '${moon['day']}';
                    int daypoint = addValue[(int.parse(dtDay) - 1)];

                    String moonsign1 = ((moon1.contains(dtYear) &&
                                    dtMonth == "01") ||
                                (moon1.contains(dtYear) && dtMonth == "10")) ||
                            (moon2.contains(dtYear) && dtMonth == "07") ||
                            (moon3.contains(dtYear) && dtMonth == "12") ||
                            (moon4.contains(dtYear) && dtMonth == "09") ||
                            (moon5.contains(dtYear) && dtMonth == "06") ||
                            ((moon6.contains(dtYear) && dtMonth == "02") ||
                                (moon6.contains(dtYear) && dtMonth == "03") ||
                                (moon6.contains(dtYear) && dtMonth == "11")) ||
                            (moon7.contains(dtYear) && dtMonth == "08") ||
                            (moon8.contains(dtYear) && dtMonth == "05") ||
                            (moon10.contains(dtYear) && dtMonth == "07") ||
                            (moon11.contains(dtYear) && dtMonth == "04") ||
                            (moon12.contains(dtYear) && dtMonth == "01") ||
                            (moon13.contains(dtYear) && dtMonth == "06") ||
                            ((moon14.contains(dtYear) && dtMonth == "03") ||
                                (moon14.contains(dtYear) && dtMonth == "12")) ||
                            (moon16.contains(dtYear) && dtMonth == "05") ||
                            ((moon17.contains(dtYear) && dtMonth == "02") ||
                                (moon14.contains(dtYear) && dtMonth == "11")) ||
                            (moon18.contains(dtYear) && dtMonth == "08") ||
                            (moon19.contains(dtYear) && dtMonth == "05")
                        ? 'Boğa'
                        : (moon1.contains(dtYear) && dtMonth == "05") ||
                                (moon2.contains(dtYear) && dtMonth == "01") ||
                                (moon4.contains(dtYear) && dtMonth == "04") ||
                                (moon5.contains(dtYear) && dtMonth == "09") ||
                                (moon6.contains(dtYear) && dtMonth == "06") ||
                                ((moon7.contains(dtYear) && dtMonth == "03") ||
                                    (moon7.contains(dtYear) &&
                                        dtMonth == "12")) ||
                                (moon10.contains(dtYear) && dtMonth == "11") ||
                                (moon12.contains(dtYear) && dtMonth == "05") ||
                                ((moon13.contains(dtYear) && dtMonth == "01") ||
                                    (moon13.contains(dtYear) &&
                                        dtMonth == "10")) ||
                                (moon14.contains(dtYear) && dtMonth == "07") ||
                                ((moon15.contains(dtYear) && dtMonth == "04") ||
                                    (moon15.contains(dtYear) &&
                                        dtMonth == "12")) ||
                                (moon17.contains(dtYear) && dtMonth == "06") ||
                                ((moon18.contains(dtYear) && dtMonth == "02") ||
                                    (moon18.contains(dtYear) &&
                                        dtMonth == "03") ||
                                    (moon18.contains(dtYear) &&
                                        dtMonth == "11")) ||
                                (moon19.contains(dtYear) && dtMonth == "08")
                            ? 'Terazi'
                            : (moon1.contains(dtYear) && dtMonth == "08") ||
                                    (moon2.contains(dtYear) &&
                                        dtMonth == "05") ||
                                    ((moon3.contains(dtYear) &&
                                            dtMonth == "01") ||
                                        (moon3.contains(dtYear) &&
                                            dtMonth == "10")) ||
                                    (moon4.contains(dtYear) &&
                                        dtMonth == "07") ||
                                    (moon5.contains(dtYear) &&
                                        dtMonth == "04") ||
                                    (moon6.contains(dtYear) && dtMonth == "09") ||
                                    (moon7.contains(dtYear) && dtMonth == "06") ||
                                    ((moon8.contains(dtYear) && dtMonth == "03") || (moon8.contains(dtYear) && dtMonth == "11")) ||
                                    (moon9.contains(dtYear) && dtMonth == "08") ||
                                    (moon10.contains(dtYear) && dtMonth == "05") ||
                                    (moon13.contains(dtYear) && dtMonth == "04") ||
                                    (moon14.contains(dtYear) && dtMonth == "10") ||
                                    (moon16.contains(dtYear) && dtMonth == "12") ||
                                    (moon17.contains(dtYear) && dtMonth == "06") ||
                                    ((moon19.contains(dtYear) && dtMonth == "02") || (moon19.contains(dtYear) && dtMonth == "11"))
                                ? 'Kova'
                                : (moon3.contains(dtYear) && dtMonth == "04") || ((moon4.contains(dtYear) && dtMonth == "01") || (moon4.contains(dtYear) && dtMonth == "10")) || (moon5.contains(dtYear) && dtMonth == "07") || (moon6.contains(dtYear) && dtMonth == "12") || (moon8.contains(dtYear) && dtMonth == "06") || ((moon9.contains(dtYear) && dtMonth == "02") || (moon9.contains(dtYear) && dtMonth == "03") || (moon9.contains(dtYear) && dtMonth == "11")) || (moon10.contains(dtYear) && dtMonth == "08") || (moon11.contains(dtYear) && dtMonth == "05") || (moon12.contains(dtYear) && dtMonth == "10") || (moon13.contains(dtYear) && dtMonth == "07") || (moon14.contains(dtYear) && dtMonth == "04") || (moon15.contains(dtYear) && dtMonth == "09") || (moon16.contains(dtYear) && dtMonth == "06") || (moon17.contains(dtYear) && dtMonth == "03")
                                    ? 'İkizler'
                                    : ((moon2.contains(dtYear) && dtMonth == "02") || (moon2.contains(dtYear) && dtMonth == "11")) || (moon3.contains(dtYear) && dtMonth == "08") || (moon4.contains(dtYear) && dtMonth == "05") || ((moon5.contains(dtYear) && dtMonth == "01") || (moon5.contains(dtYear) && dtMonth == "10")) || (moon6.contains(dtYear) && dtMonth == "07") || (moon7.contains(dtYear) && dtMonth == "04") || (moon8.contains(dtYear) && dtMonth == "08") || (moon9.contains(dtYear) && dtMonth == "06") || ((moon10.contains(dtYear) && dtMonth == "02") || (moon10.contains(dtYear) && dtMonth == "03")) || ((moon11.contains(dtYear) && dtMonth == "02") || (moon11.contains(dtYear) && dtMonth == "03") || (moon11.contains(dtYear) && dtMonth == "08")) || ((moon16.contains(dtYear) && dtMonth == "01") || (moon16.contains(dtYear) && dtMonth == "09")) || (moon17.contains(dtYear) && dtMonth == "07") || (moon18.contains(dtYear) && dtMonth == "12") || (moon19.contains(dtYear) && dtMonth == "09")
                                        ? 'Akrep'
                                        : ((moon6.contains(dtYear) && dtMonth == "01") || (moon6.contains(dtYear) && dtMonth == "10")) || (moon7.contains(dtYear) && dtMonth == "04") || ((moon8.contains(dtYear) && dtMonth == "04") || (moon8.contains(dtYear) && dtMonth == "12")) || (moon9.contains(dtYear) && dtMonth == "09") || (moon10.contains(dtYear) && dtMonth == "06") || (moon11.contains(dtYear) && dtMonth == "11") || (moon12.contains(dtYear) && dtMonth == "08") || (moon13.contains(dtYear) && dtMonth == "05") || (moon14.contains(dtYear) && dtMonth == "01") || (moon15.contains(dtYear) && dtMonth == "07") || (moon16.contains(dtYear) && dtMonth == "04") || (moon17.contains(dtYear) && dtMonth == "09") || (moon18.contains(dtYear) && dtMonth == "06") || (moon19.contains(dtYear) && dtMonth == "03")
                                            ? 'Balık'
                                            : (moon1.contains(dtYear) && dtMonth == "12") || (moon2.contains(dtYear) && dtMonth == "09") || (moon3.contains(dtYear) && dtMonth == "06") || ((moon4.contains(dtYear) && dtMonth == "02") || (moon4.contains(dtYear) && dtMonth == "03") || (moon4.contains(dtYear) && dtMonth == "11")) || (moon5.contains(dtYear) && dtMonth == "08") || (moon6.contains(dtYear) && dtMonth == "05") || ((moon7.contains(dtYear) && dtMonth == "01") || (moon7.contains(dtYear) && dtMonth == "10")) || (moon8.contains(dtYear) && dtMonth == "07") || (moon9.contains(dtYear) && dtMonth == "04") || (moon10.contains(dtYear) && dtMonth == "09") || (moon11.contains(dtYear) && dtMonth == "06") || (moon12.contains(dtYear) && dtMonth == "12") || (moon17.contains(dtYear) && dtMonth == "04") || ((moon18.contains(dtYear) && dtMonth == "01") || (moon18.contains(dtYear) && dtMonth == "10")) || (moon19.contains(dtYear) && dtMonth == "07")
                                                ? 'Aslan'
                                                : (moon1.contains(dtYear) && dtMonth == "06") || ((moon2.contains(dtYear) && dtMonth == "03") || (moon2.contains(dtYear) && dtMonth == "12")) || ((moon5.contains(dtYear) && dtMonth == "02") || (moon5.contains(dtYear) && dtMonth == "11")) || (moon6.contains(dtYear) && dtMonth == "08") || (moon7.contains(dtYear) && dtMonth == "05") || ((moon8.contains(dtYear) && dtMonth == "01") || (moon8.contains(dtYear) && dtMonth == "10")) || (moon9.contains(dtYear) && dtMonth == "07") || (moon10.contains(dtYear) && dtMonth == "12") || (moon11.contains(dtYear) && dtMonth == "09") || (moon12.contains(dtYear) && dtMonth == "06") || ((moon13.contains(dtYear) && dtMonth == "02") || (moon13.contains(dtYear) && dtMonth == "03") || (moon13.contains(dtYear) && dtMonth == "11")) || (moon14.contains(dtYear) && dtMonth == "08") || (moon15.contains(dtYear) && dtMonth == "05") || (moon16.contains(dtYear) && dtMonth == "10") || (moon18.contains(dtYear) && dtMonth == "04")
                                                    ? 'Yay'
                                                    : (moon1.contains(dtYear) && dtMonth == "09") || (moon2.contains(dtYear) && dtMonth == "06") || ((moon3.contains(dtYear) && dtMonth == "02") || (moon3.contains(dtYear) && dtMonth == "03") || (moon3.contains(dtYear) && dtMonth == "11")) || (moon4.contains(dtYear) && dtMonth == "08") || (moon5.contains(dtYear) && dtMonth == "05") || ((moon9.contains(dtYear) && dtMonth == "01") || (moon9.contains(dtYear) && dtMonth == "10")) || (moon11.contains(dtYear) && dtMonth == "12") || ((moon14.contains(dtYear) && dtMonth == "02") || (moon14.contains(dtYear) && dtMonth == "11")) || (moon15.contains(dtYear) && dtMonth == "08") || ((moon17.contains(dtYear) && dtMonth == "01") || (moon17.contains(dtYear) && dtMonth == "10")) || (moon18.contains(dtYear) && dtMonth == "07") || (moon19.contains(dtYear) && dtMonth == "04")
                                                        ? 'Koç'
                                                        : (moon1.contains(dtYear) && dtMonth == "04") || (moon2.contains(dtYear) && dtMonth == "10") || (moon3.contains(dtYear) && dtMonth == "07") || (moon4.contains(dtYear) && dtMonth == "12") || ((moon7.contains(dtYear) && dtMonth == "02") || (moon7.contains(dtYear) && dtMonth == "11")) || (moon8.contains(dtYear) && dtMonth == "08") || (moon9.contains(dtYear) && dtMonth == "05") || ((moon10.contains(dtYear) && dtMonth == "01") || (moon10.contains(dtYear) && dtMonth == "10")) || (moon11.contains(dtYear) && dtMonth == "07") || (moon12.contains(dtYear) && dtMonth == "04") || (moon13.contains(dtYear) && dtMonth == "09") || (moon14.contains(dtYear) && dtMonth == "06") || ((moon15.contains(dtYear) && dtMonth == "02") || (moon15.contains(dtYear) && dtMonth == "03") || (moon15.contains(dtYear) && dtMonth == "11")) || (moon16.contains(dtYear) && dtMonth == "08") || (moon17.contains(dtYear) && dtMonth == "05")
                                                            ? 'Başak'
                                                            : (moon1.contains(dtYear) && dtMonth == "07") || (moon2.contains(dtYear) && dtMonth == "04") || (moon3.contains(dtYear) && dtMonth == "09") || (moon4.contains(dtYear) && dtMonth == "06") || ((moon5.contains(dtYear) && dtMonth == "03") || (moon5.contains(dtYear) && dtMonth == "12")) || (moon8.contains(dtYear) && dtMonth == "02") || (moon10.contains(dtYear) && dtMonth == "04") || ((moon11.contains(dtYear) && dtMonth == "01") || (moon11.contains(dtYear) && dtMonth == "10")) || (moon12.contains(dtYear) && dtMonth == "07") || (moon13.contains(dtYear) && dtMonth == "12") || (moon14.contains(dtYear) && dtMonth == "09") || (moon15.contains(dtYear) && dtMonth == "06") || ((moon16.contains(dtYear) && dtMonth == "02") || (moon16.contains(dtYear) && dtMonth == "03") || (moon16.contains(dtYear) && dtMonth == "11")) || (moon17.contains(dtYear) && dtMonth == "08") || (moon18.contains(dtYear) && dtMonth == "05") || ((moon19.contains(dtYear) && dtMonth == "01") || (moon19.contains(dtYear) && dtMonth == "10") || (moon19.contains(dtYear) && dtMonth == "12"))
                                                                ? 'Oğlak'
                                                                : 'Yengeç';
                    int listline = signs.indexOf(moonsign1);
                    int totalpoint = (listline + daypoint);
                    String lastmoonsign = (totalpoint < 12)
                        ? signs[(totalpoint)]
                        : signs[(totalpoint - 12)];

                    return Text(lastmoonsign);
                  });
        });
  }
}
