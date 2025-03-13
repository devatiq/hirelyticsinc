/*
import 'dart:isolate';
import 'dart:ui';

const String backgroundLocationIsolateName = "BackgroundLocationIsolate";

ReceivePort locationIsolatePort = ReceivePort();

void registerLocationIsolate() {
  IsolateNameServer.registerPortWithName(
      locationIsolatePort.sendPort, backgroundLocationIsolateName);
  locationIsolatePort.listen((data) {});
}

@pragma('vm:entry-point')
void locationIsolateCallback(dynamic data) {
  final sendPort =
      IsolateNameServer.lookupPortByName(backgroundLocationIsolateName);
  sendPort?.send(data);
}
*/
