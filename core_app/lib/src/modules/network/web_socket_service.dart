import 'package:core_app/src/modules/network/api_service.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService {
  IOWebSocketChannel channel;
  bool isDisconnect = true;

  connect() {
    if (isDisconnect) {
      channel = IOWebSocketChannel.connect(WS, headers: appHeaders);

      isDisconnect = false;

      channel.stream.listen((data) {
        print(data);
      }, onDone: () {
        isDisconnect = true;
        print("Close WS");
      }, onError: (error) {
        print(error);
      });
    }
  }
}
