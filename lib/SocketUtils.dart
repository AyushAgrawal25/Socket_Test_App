import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketUtils {
  IO.Socket socketIO;
  static String urlForSocket = "http://3.21.53.195:3000";

  IO.Socket init() {
    Map<String, dynamic> config = {
      'transports': ['websocket']
    };

    socketIO = IO.io(urlForSocket, config);

    socketIO.connect();

    socketIO.on("connect", (data) {
      print("Socket Successfully Connected...");
    });

    socketIO.on("disconnect", (data) {
      print("Socket Got Disconnected...");
    });
    return socketIO;
  }
}
