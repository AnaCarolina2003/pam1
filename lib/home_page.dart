import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( // componente com template básico para uma tela
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding( // margem interna (contrário da margem), espaço para dentro
        padding: const EdgeInsets.all(12),
        child: Center( // centralizar o que estar dentro
          child: Column( // margin, padding e color em um único componente -> container (que só consegue ter uma child dentro)
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: "Tempo (minutos)"
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Alarm.init();

                      final moment = DateTime.now().add(Duration(minutes: int.parse(controller.text)));

                      final alarmSettings = AlarmSettings(
                      id: 42,
                      dateTime: moment,
                      assetAudioPath: 'lib/assets/not_blank.mp3',
                      loopAudio: true,
                      vibrate: true,
                      volumeMax: true,
                      fadeDuration: 3.0,
                      notificationTitle: 'Acorda!!!',
                      notificationBody: ':3',
                      enableNotificationOnKill: true,
                      );

                      await Alarm.set(alarmSettings: alarmSettings);
                    },
                    child: const Text("Alarm!"),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}