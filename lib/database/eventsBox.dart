// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

import '../objectbox.g.dart';

class EventsBox {
  ObjectBox boxDatabase;

  EventsBox({
    required this.boxDatabase,
  });

  Future<void> addClientToObjectBox(ClientModel cliente) async {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    await clientBox.putAsync(cliente);
    print("Model adicionado com sucesso!");
  }

  void removeAllClients() {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    clientBox.removeAll();
  }

  void removeClientById(int clientID) {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    clientBox.remove(clientID);
  }

  List<ClientModel> listarClientes() {
    final store = boxDatabase.store;

    final clientBox = store.box<ClientModel>();
    final getAllUsers = clientBox.getAll();
    return getAllUsers;
  }
}
