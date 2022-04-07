import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer audioPlayer;
  num dropdownValue = 1;

  String durasi = "00:00:00";

  _MyAppState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((Duration) {
      setState(() {
        durasi = Duration.toString();
      });
    });
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Image(
              image: NetworkImage(
                  "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/08/22/1747449169.jpg"),
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "   Pada jaman dahulu kala ada seorang Puteri dari Kerajaan Prambanan yang bernama Roro Jongrang. Roro Jongrang merupakan seorang puteri yang sangat cantik dan sangat baik budinya. Ketika Bandung Bondowoso dari kerajaan Panggih menyerang Kerajaan Prambanan, ayah dari Roro Jongrang pun terbunuh dalam pertempuran.",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "   Saat Bandung Bondowoso meminta Roro Jongrang sebagai istrinya, Roro Jongrang tidak bisa menolak, hanya ada satu cara yang bisa diberikan oleh Roro Jongrang, yaitu meminta Bandung Bondowoso untuk membangun 1000 candi dalam satu malam. Melalui bantuan jin dan siluman sebagai prajuritnya, Bandung Bondowoso pun menyetujuinya.",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "   Namun jin dan siluman pun tiba-tiba pergi karena mencium bau pagi yang tiba-tiba datang. Namun ternyata, bau pagi tersebut diciptakan oleh Roro Jongrang dan warga agar Bondowoso tidak berhasil membangun candi terakhir. Akhirnya, mengetahui hal tersebut, Bondowoso menjadi marah, dan mengutuk Roro Jongrang menjadi candi terakhir.",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await audioPlayer.play(
                                "https://drive.google.com/u/0/uc?id=1k6i4diq7eFeLawEimqCvRxlS0WWvMJPB&export=download");
                          },
                          child: const Text("Play"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await audioPlayer.pause();
                          },
                          child: const Text("Pause"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await audioPlayer.stop();
                          },
                          child: const Text("Stop"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await audioPlayer.resume();
                          },
                          child: const Text("Resume"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Or Play At",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: 60,
                          color: Colors.white,
                          child: (DropdownButton(
                              value: dropdownValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("0.5 x"),
                                  value: 0.5,
                                ),
                                DropdownMenuItem(
                                  child: Text("1 x"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("2 x"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("3 x"),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text("4 x"),
                                  value: 4,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value as num;
                                  audioPlayer.setPlaybackRate(dropdownValue.toDouble());
                                }
                                );
                              }
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                  Text(
                    durasi,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
