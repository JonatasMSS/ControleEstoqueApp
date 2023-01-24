// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

import '../objectbox.g.dart';

class EventsBox {
  ObjectBox boxDatabase;

  EventsBox({
    required this.boxDatabase,
  });

  void addClientToObjectBox(ClientModel cliente) {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    Future<int> idFuture = clientBox.putAsync(cliente).then((value) {
      print('O modelo com id $value foi adicionado com sucesso!');
      return value;
    });
  }

  void removeAllClients() {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    clientBox.removeAll();
  }

  List<ClientModel> listarClientes() {
    final store = boxDatabase.store;

    final clientBox = store.box<ClientModel>();
    final getAllUsers = clientBox.getAll();
    return getAllUsers;
  }
}
