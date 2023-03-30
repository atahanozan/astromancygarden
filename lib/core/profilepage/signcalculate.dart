import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/auth.dart';

class SignCalculate extends StatefulWidget {
  const SignCalculate({Key? key}) : super(key: key);

  @override
  State<SignCalculate> createState() => _SignCalculateState();
}

class _SignCalculateState extends State<SignCalculate> {
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

  List<String> aslan = [
    "23.07",
    "24.07",
    "25.07",
    "26.07",
    "27.07",
    "28.07",
    "29.07",
    "30.07",
    "31.07",
    "01.08",
    "02.08",
    "03.08",
    "04.08",
    "05.08",
    "06.08",
    "07.08",
    "08.08",
    "09.08",
    "10.08",
    "11.08",
    "12.08",
    "13.08",
    "14.08",
    "15.08",
    "16.08",
    "17.08",
    "18.08",
    "19.08",
    "20.08",
    "21.08",
    "22.08",
    "23.08",
  ];

  List<String> koc = [
    '21.03',
    '22.03',
    '23.03',
    '24.03',
    '25.03',
    '26.03',
    '27.03',
    '28.03',
    '29.03',
    '30.03',
    '31.03',
    '01.04',
    '02.04',
    '03.04',
    '04.04',
    '05.04',
    '06.04',
    '07.04',
    '08.04',
    '09.04',
    '10.04',
    '11.04',
    '12.04',
    '13.04',
    '14.04',
    '15.04',
    '16.04',
    '17.04',
    '18.04',
    '19.04',
    '20.04',
  ];
  List<String> boga = [
    '21.04',
    '22.04',
    '23.04',
    '24.04',
    '25.04',
    '26.04',
    '27.04',
    '28.04',
    '29.04',
    '30.04',
    '01.05',
    '02.05',
    '03.05',
    '04.05',
    '05.05',
    '06.05',
    '07.05',
    '08.05',
    '09.05',
    '10.05',
    '11.05',
    '12.05',
    '13.05',
    '14.05',
    '15.05',
    '16.05',
    '17.05',
    '18.05',
    '19.05',
    '20.05',
  ];
  List<String> ikizler = [
    '21.05',
    '22.05',
    '23.05',
    '24.05',
    '25.05',
    '26.05',
    '27.05',
    '28.05',
    '29.05',
    '30.05',
    '31.05',
    '01.06',
    '02.06',
    '03.06',
    '04.06',
    '05.06',
    '06.06',
    '07.06',
    '08.06',
    '09.06',
    '10.06',
    '11.06',
    '12.06',
    '13.06',
    '14.06',
    '15.06',
    '16.06',
    '17.06',
    '18.06',
    '19.06',
    '20.06',
    '21.06',
  ];
  List<String> yengec = [
    '22.06',
    '23.06',
    '24.06',
    '25.06',
    '26.06',
    '27.06',
    '28.06',
    '29.06',
    '30.06',
    '01.07',
    '02.07',
    '03.07',
    '04.07',
    '05.07',
    '06.07',
    '07.07',
    '08.07',
    '09.07',
    '10.07',
    '11.07',
    '12.07',
    '13.07',
    '14.07',
    '15.07',
    '16.07',
    '17.07',
    '18.07',
    '19.07',
    '20.07',
    '21.07',
    '22.07',
  ];
  List<String> basak = [
    '24.08',
    '25.08',
    '26.08',
    '27.08',
    '28.08',
    '29.08',
    '30.08',
    '31.08',
    '01.09',
    '02.09',
    '03.09',
    '04.09',
    '05.09',
    '06.09',
    '07.09',
    '08.09',
    '09.09',
    '10.09',
    '11.09',
    '12.09',
    '13.09',
    '14.09',
    '15.09',
    '16.09',
    '17.09',
    '18.09',
    '19.09',
    '20.09',
    '21.09',
    '22.09',
    '23.09',
  ];
  List<String> terazi = [
    '24.09',
    '25.09',
    '26.09',
    '27.09',
    '28.09',
    '29.09',
    '30.09',
    '01.10',
    '02.10',
    '03.10',
    '04.10',
    '05.10',
    '06.10',
    '07.10',
    '08.10',
    '09.10',
    '10.10',
    '11.10',
    '12.10',
    '13.10',
    '14.10',
    '15.10',
    '16.10',
    '17.10',
    '18.10',
    '19.10',
    '20.10',
    '21.10',
    '22.10',
    '23.10',
  ];
  List<String> akrep = [
    '24.10',
    '25.10',
    '26.10',
    '27.10',
    '28.10',
    '29.10',
    '30.10',
    '31.10',
    '01.11',
    '02.11',
    '03.11',
    '04.11',
    '05.11',
    '06.11',
    '07.11',
    '08.11',
    '09.11',
    '10.11',
    '11.11',
    '12.11',
    '13.11',
    '14.11',
    '15.11',
    '16.11',
    '17.11',
    '18.11',
    '19.11',
    '20.11',
    '21.11',
    '22.11',
  ];
  List<String> yay = [
    '23.11',
    '24.11',
    '25.11',
    '26.11',
    '27.11',
    '28.11',
    '29.11',
    '30.11',
    '01.12',
    '02.12',
    '03.12',
    '04.12',
    '05.12',
    '06.12',
    '07.12',
    '08.12',
    '09.12',
    '10.12',
    '11.12',
    '12.12',
    '13.12',
    '14.12',
    '15.12',
    '16.12',
    '17.12',
    '18.12',
    '19.12',
    '20.12',
    '21.12',
  ];
  List<String> oglak = [
    '22.12',
    '23.12',
    '24.12',
    '25.12',
    '26.12',
    '27.12',
    '28.12',
    '29.12',
    '30.12',
    '31.12',
    '01.01',
    '02.01',
    '03.01',
    '04.01',
    '05.01',
    '06.01',
    '07.01',
    '08.01',
    '09.01',
    '10.01',
    '11.01',
    '12.01',
    '13.01',
    '14.01',
    '15.01',
    '16.01',
    '17.01',
    '18.01',
    '19.01',
    '20.01',
  ];
  List<String> kova = [
    '21.01',
    '22.01',
    '23.01',
    '24.01',
    '25.01',
    '26.01',
    '27.01',
    '28.01',
    '29.01',
    '30.01',
    '31.01',
    '01.02',
    '02.02',
    '03.02',
    '04.02',
    '05.02',
    '06.02',
    '07.02',
    '08.02',
    '09.02',
    '10.02',
    '11.02',
    '12.02',
    '13.02',
    '14.02',
    '15.02',
    '16.02',
    '17.02',
    '18.02',
    '19.02',
  ];
  List<String> balik = [
    '20.02',
    '21.02',
    '22.02',
    '23.02',
    '24.02',
    '25.02',
    '26.02',
    '27.02',
    '28.02',
    '29.02',
    '01.03',
    '02.03',
    '03.03',
    '04.03',
    '05.03',
    '06.03',
    '07.03',
    '08.03',
    '09.03',
    '10.03',
    '11.03',
    '12.03',
    '13.03',
    '14.03',
    '15.03',
    '16.03',
    '17.03',
    '18.03',
    '19.03',
    '20.03',
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
                    DocumentSnapshot sign = snapshot.data!.docs[index];
                    String dtSign = '${sign['day']}.${sign['month']}';
                    String lastsign = aslan.contains(dtSign)
                        ? 'Aslan'
                        : koc.contains(dtSign)
                            ? 'Koç'
                            : boga.contains(dtSign)
                                ? 'Boğa'
                                : ikizler.contains(dtSign)
                                    ? 'İkizler'
                                    : yengec.contains(dtSign)
                                        ? 'Yengeç'
                                        : basak.contains(dtSign)
                                            ? 'Başak'
                                            : terazi.contains(dtSign)
                                                ? 'Terazi'
                                                : akrep.contains(dtSign)
                                                    ? 'Akrep'
                                                    : yay.contains(dtSign)
                                                        ? 'Yay'
                                                        : oglak.contains(dtSign)
                                                            ? 'Oğlak'
                                                            : kova.contains(
                                                                    dtSign)
                                                                ? 'Kova'
                                                                : 'Balık';

                    FirebaseFirestore.instance
                        .collection('Status')
                        .doc(sign.id)
                        .update({'sign': lastsign});

                    return Text(
                      lastsign,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  });
        });
  }
}
