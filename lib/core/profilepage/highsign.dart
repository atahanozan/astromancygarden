import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/auth.dart';

class HighSign extends StatefulWidget {
  const HighSign({Key? key}) : super(key: key);

  @override
  State<HighSign> createState() => _HighSignState();
}

class _HighSignState extends State<HighSign> {
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

  Duration signhours5 = const Duration(hours: 5, minutes: 0);
  Duration signhours7 = const Duration(hours: 7, minutes: 0);
  Duration signhours9 = const Duration(hours: 9, minutes: 0);
  Duration signhours11 = const Duration(hours: 11, minutes: 0);
  Duration signhours13 = const Duration(hours: 13, minutes: 0);
  Duration signhours15 = const Duration(hours: 15, minutes: 0);
  Duration signhours17 = const Duration(hours: 17, minutes: 0);
  Duration signhours19 = const Duration(hours: 19, minutes: 0);
  Duration signhours21 = const Duration(hours: 21, minutes: 0);
  Duration signhours23 = const Duration(hours: 23, minutes: 0);
  Duration signhours1 = const Duration(hours: 1, minutes: 0);
  Duration signhours3 = const Duration(hours: 3, minutes: 0);

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
                    Duration hour = Duration(
                        hours: int.parse(sign['hour']),
                        minutes: int.parse(sign['minute']));
                    String originalsign = sign['sign'];

                    String saarara = (hour < signhours7 && hour > signhours5)
                        ? 'A1'
                        : (hour < signhours9 && hour > signhours7)
                            ? 'A2'
                            : (hour < signhours11 && hour > signhours9)
                                ? 'A3'
                                : (hour < signhours13 && hour > signhours11)
                                    ? 'A4'
                                    : (hour < signhours15 && hour > signhours13)
                                        ? 'A5'
                                        : (hour < signhours17 &&
                                                hour > signhours15)
                                            ? 'A6'
                                            : (hour < signhours19 &&
                                                    hour > signhours17)
                                                ? 'A7'
                                                : (hour < signhours21 &&
                                                        hour > signhours19)
                                                    ? 'A8'
                                                    : (hour < signhours23 &&
                                                            hour > signhours21)
                                                        ? 'A9'
                                                        : (hour < signhours1 &&
                                                                hour >
                                                                    signhours23)
                                                            ? 'A10'
                                                            : (hour < signhours3 &&
                                                                    hour >
                                                                        signhours1)
                                                                ? 'A11'
                                                                : 'A12';
                    String highsignkoc = saarara == 'A1'
                        ? 'Koç'
                        : saarara == 'A2'
                            ? 'Boğa'
                            : saarara == 'A3'
                                ? 'İkizler'
                                : saarara == 'A4'
                                    ? 'Yengeç'
                                    : saarara == 'A5'
                                        ? 'Aslan'
                                        : saarara == 'A6'
                                            ? 'Başak'
                                            : saarara == 'A7'
                                                ? 'Terazi'
                                                : saarara == 'A8'
                                                    ? 'Akrep'
                                                    : saarara == 'A9'
                                                        ? 'Yay'
                                                        : saarara == 'A10'
                                                            ? 'Oğlak'
                                                            : saarara == 'A11'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignboga = saarara == 'A12'
                        ? 'Koç'
                        : saarara == 'A1'
                            ? 'Boğa'
                            : saarara == 'A2'
                                ? 'İkizler'
                                : saarara == 'A3'
                                    ? 'Yengeç'
                                    : saarara == 'A4'
                                        ? 'Aslan'
                                        : saarara == 'A5'
                                            ? 'Başak'
                                            : saarara == 'A6'
                                                ? 'Terazi'
                                                : saarara == 'A7'
                                                    ? 'Akrep'
                                                    : saarara == 'A8'
                                                        ? 'Yay'
                                                        : saarara == 'A9'
                                                            ? 'Oğlak'
                                                            : saarara == 'A10'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignikizler = saarara == 'A11'
                        ? 'Koç'
                        : saarara == 'A12'
                            ? 'Boğa'
                            : saarara == 'A1'
                                ? 'İkizler'
                                : saarara == 'A2'
                                    ? 'Yengeç'
                                    : saarara == 'A3'
                                        ? 'Aslan'
                                        : saarara == 'A4'
                                            ? 'Başak'
                                            : saarara == 'A5'
                                                ? 'Terazi'
                                                : saarara == 'A6'
                                                    ? 'Akrep'
                                                    : saarara == 'A7'
                                                        ? 'Yay'
                                                        : saarara == 'A8'
                                                            ? 'Oğlak'
                                                            : saarara == 'A9'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignyengec = saarara == 'A10'
                        ? 'Koç'
                        : saarara == 'A11'
                            ? 'Boğa'
                            : saarara == 'A12'
                                ? 'İkizler'
                                : saarara == 'A1'
                                    ? 'Yengeç'
                                    : saarara == 'A2'
                                        ? 'Aslan'
                                        : saarara == 'A3'
                                            ? 'Başak'
                                            : saarara == 'A4'
                                                ? 'Terazi'
                                                : saarara == 'A5'
                                                    ? 'Akrep'
                                                    : saarara == 'A6'
                                                        ? 'Yay'
                                                        : saarara == 'A7'
                                                            ? 'Oğlak'
                                                            : saarara == 'A8'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignaslan = saarara == 'A9'
                        ? 'Koç'
                        : saarara == 'A10'
                            ? 'Boğa'
                            : saarara == 'A11'
                                ? 'İkizler'
                                : saarara == 'A12'
                                    ? 'Yengeç'
                                    : saarara == 'A1'
                                        ? 'Aslan'
                                        : saarara == 'A2'
                                            ? 'Başak'
                                            : saarara == 'A3'
                                                ? 'Terazi'
                                                : saarara == 'A4'
                                                    ? 'Akrep'
                                                    : saarara == 'A5'
                                                        ? 'Yay'
                                                        : saarara == 'A6'
                                                            ? 'Oğlak'
                                                            : saarara == 'A7'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignbasak = saarara == 'A8'
                        ? 'Koç'
                        : saarara == 'A9'
                            ? 'Boğa'
                            : saarara == 'A10'
                                ? 'İkizler'
                                : saarara == 'A11'
                                    ? 'Yengeç'
                                    : saarara == 'A12'
                                        ? 'Aslan'
                                        : saarara == 'A1'
                                            ? 'Başak'
                                            : saarara == 'A2'
                                                ? 'Terazi'
                                                : saarara == 'A3'
                                                    ? 'Akrep'
                                                    : saarara == 'A4'
                                                        ? 'Yay'
                                                        : saarara == 'A5'
                                                            ? 'Oğlak'
                                                            : saarara == 'A6'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignterazi = saarara == 'A7'
                        ? 'Koç'
                        : saarara == 'A8'
                            ? 'Boğa'
                            : saarara == 'A9'
                                ? 'İkizler'
                                : saarara == 'A10'
                                    ? 'Yengeç'
                                    : saarara == 'A11'
                                        ? 'Aslan'
                                        : saarara == 'A12'
                                            ? 'Başak'
                                            : saarara == 'A1'
                                                ? 'Terazi'
                                                : saarara == 'A2'
                                                    ? 'Akrep'
                                                    : saarara == 'A3'
                                                        ? 'Yay'
                                                        : saarara == 'A4'
                                                            ? 'Oğlak'
                                                            : saarara == 'A5'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignakrep = saarara == 'A6'
                        ? 'Koç'
                        : saarara == 'A7'
                            ? 'Boğa'
                            : saarara == 'A8'
                                ? 'İkizler'
                                : saarara == 'A9'
                                    ? 'Yengeç'
                                    : saarara == 'A10'
                                        ? 'Aslan'
                                        : saarara == 'A11'
                                            ? 'Başak'
                                            : saarara == 'A12'
                                                ? 'Terazi'
                                                : saarara == 'A1'
                                                    ? 'Akrep'
                                                    : saarara == 'A2'
                                                        ? 'Yay'
                                                        : saarara == 'A3'
                                                            ? 'Oğlak'
                                                            : saarara == 'A4'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignyay = saarara == 'A5'
                        ? 'Koç'
                        : saarara == 'A6'
                            ? 'Boğa'
                            : saarara == 'A7'
                                ? 'İkizler'
                                : saarara == 'A8'
                                    ? 'Yengeç'
                                    : saarara == 'A9'
                                        ? 'Aslan'
                                        : saarara == 'A10'
                                            ? 'Başak'
                                            : saarara == 'A11'
                                                ? 'Terazi'
                                                : saarara == 'A12'
                                                    ? 'Akrep'
                                                    : saarara == 'A1'
                                                        ? 'Yay'
                                                        : saarara == 'A2'
                                                            ? 'Oğlak'
                                                            : saarara == 'A3'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignoglak = saarara == 'A4'
                        ? 'Koç'
                        : saarara == 'A5'
                            ? 'Boğa'
                            : saarara == 'A6'
                                ? 'İkizler'
                                : saarara == 'A7'
                                    ? 'Yengeç'
                                    : saarara == 'A8'
                                        ? 'Aslan'
                                        : saarara == 'A9'
                                            ? 'Başak'
                                            : saarara == 'A10'
                                                ? 'Terazi'
                                                : saarara == 'A11'
                                                    ? 'Akrep'
                                                    : saarara == 'A12'
                                                        ? 'Yay'
                                                        : saarara == 'A1'
                                                            ? 'Oğlak'
                                                            : saarara == 'A2'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignkova = saarara == 'A3'
                        ? 'Koç'
                        : saarara == 'A4'
                            ? 'Boğa'
                            : saarara == 'A5'
                                ? 'İkizler'
                                : saarara == 'A6'
                                    ? 'Yengeç'
                                    : saarara == 'A7'
                                        ? 'Aslan'
                                        : saarara == 'A8'
                                            ? 'Başak'
                                            : saarara == 'A9'
                                                ? 'Terazi'
                                                : saarara == 'A10'
                                                    ? 'Akrep'
                                                    : saarara == 'A11'
                                                        ? 'Yay'
                                                        : saarara == 'A12'
                                                            ? 'Oğlak'
                                                            : saarara == 'A1'
                                                                ? 'Kova'
                                                                : 'Balık';
                    String highsignbalik = saarara == 'A2'
                        ? 'Koç'
                        : saarara == 'A3'
                            ? 'Boğa'
                            : saarara == 'A4'
                                ? 'İkizler'
                                : saarara == 'A5'
                                    ? 'Yengeç'
                                    : saarara == 'A6'
                                        ? 'Aslan'
                                        : saarara == 'A7'
                                            ? 'Başak'
                                            : saarara == 'A8'
                                                ? 'Terazi'
                                                : saarara == 'A9'
                                                    ? 'Akrep'
                                                    : saarara == 'A10'
                                                        ? 'Yay'
                                                        : saarara == 'A11'
                                                            ? 'Oğlak'
                                                            : saarara == 'A12'
                                                                ? 'Kova'
                                                                : 'Balık';

                    String lastsign = originalsign == 'Koç'
                        ? highsignkoc
                        : originalsign == 'Boğa'
                            ? highsignboga
                            : originalsign == 'İkizler'
                                ? highsignikizler
                                : originalsign == 'Yengeç'
                                    ? highsignyengec
                                    : originalsign == 'Aslan'
                                        ? highsignaslan
                                        : originalsign == 'Başak'
                                            ? highsignbasak
                                            : originalsign == 'Terazi'
                                                ? highsignterazi
                                                : originalsign == 'Akrep'
                                                    ? highsignakrep
                                                    : originalsign == 'Yay'
                                                        ? highsignyay
                                                        : originalsign ==
                                                                'Oğlak'
                                                            ? highsignoglak
                                                            : originalsign ==
                                                                    'Kova'
                                                                ? highsignkova
                                                                : highsignbalik;

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
