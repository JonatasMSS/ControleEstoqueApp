import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';

void generateDataToDatabase(ObjectBox objectBox) {
  final EventsBox eventsBox = EventsBox(boxDatabase: objectBox);
  final List<String> snackList = [
    "BOKUS SAL 45G",
    "BOKUS DOCÊ 45G",
    "CHEETOS REQUEIJÃO 20G",
    "CHEETOS LUA 20G",
    "CEBOLITOS 20G",
    "FANDANGOS 20G",
    "BATON PRETO",
    "BATON BRANCO",
    "SONHO DE VALSA",
    "OURO BRANCO",
    "CHOCOLATE C/ LARANJA",
    "CHOCOLATE BEL",
    "CARAMELO MEIO A MEIO",
    "PIRULITO POP MIX",
    "PIRULITO POP CEREJA",
    "PIRULITO POP ENERGICO",
    "PIRULITO COLO MANIA",
    "PIRULITO PIROCREM",
    "PIRULITO DE CORAÇÃO",
    "COCADA MOLECÃO C/30",
    "COCADA MOLECÃO C/50",
    "COCADA CHOCREM 1KG",
    "COCADA CHOREM 1,300KG",
    "COCADA PE DE MOLEQUE",
    "PAÇOCA RIO",
    "PAÇOCA DAS MARIA",
    "COCADA DE LEITE",
    "ISQUEIRO BIC G",
    "ISQUEIRO BIC P",
    "PRESTOBARBA AZUL",
    "BIC AMARELO BARBEADOR",
    "LÂMINA WILKINSON",
    "RAYOVAC PILHA AA",
    "RAYOVAC PILHA AAA",
    "FUMO CAVALINHO",
    "FUMO BREJEIRO",
    "ROTHMANS AZUL",
    "ROTHMANS PRATA",
    "ROTHMANS VERMELHO",
    "ROTHMANS BRANCO",
    "BOLINHO BAUDUCCO DUP.CHOCOLARE",
    "COLORETE 11G",
    "COLORETE 18G",
    "DISQUETE 11G",
    "DISQUETE 18G",
    "CHUPETINHA",
    "TRELOSO 120G CHOCOLATE",
    "TRELOSO 120G MORANGO",
    "TRELOSO 120G BENCASADO",
    "TRELOSO 120G FLOCOS",
    "TRELOSO 120G BRIGADEIRO",
    "TRELOSO 120G CHOCORESCO",
    "ICEKISS MORANGO",
    "ICEKISS MORANGO C CHOC.",
    "ICEKISS MORANGO FAZENDINHA",
    "HALLS CEREJA",
    "HALLS PRETA",
    "HALLS VERDE",
    "HALLS MELANCIA",
    "HALLS PRATA",
    "MINTY HORTELÃ",
    "MINTY MORANGO",
    "MINTY MISTA",
    "AMENDOIM GRELHADITOS",
    "MENDORATO JAPONÊS",
    "FINI AZEDINHO MORANGO",
    "FINI AZEDINHO UVA",
    "FINI AZEDINHO TUBES",
    "FINI MORANGO S/AÇÚCAR",
    "DOCILE BEIJINHOS",
    "DOCILE AMORA",
    "DOCILE BANANINHA",
    "DOCILE DENTADURA",
    "LEITE ITAMBÉ",
    "LEITE CAMPONESA",
    "G.A.F BOLINHA",
    "G.A.F AZUL",
    "G.A L AZUL"
  ];
  final List<ProductModel> defaultProducts = snackList.map((name) {
    return ProductModel(name: name, price: 1.00, quantity: 5);
  }).toList();
  eventsBox
      .addManyProductsToDatabase(defaultProducts)
      .then((value) => print("Produtos adicionados com sucesso!"));
}

void generateClientsToDatabase(ObjectBox objectBox) {
  final EventsBox eventbox = EventsBox(boxDatabase: objectBox);
  final List<ClientModel> clientSegunda = List.generate(20, (index) {
    return ClientModel(name: 'ABCDEFGHIJK', number: index, date: 'segunda');
  });
  final List<ClientModel> clientTerca = List.generate(20, (index) {
    return ClientModel(name: 'ABCDEFGHIJK', number: index, date: 'terca');
  });
  final List<ClientModel> clientQuarta = List.generate(20, (index) {
    return ClientModel(name: 'ABCDEFGHIJK', number: index, date: 'quarta');
  });
  final List<ClientModel> clientQuinta = List.generate(20, (index) {
    return ClientModel(name: 'ABCDEFGHIJK', number: index, date: 'quinta');
  });
  final List<ClientModel> clientSexta = List.generate(20, (index) {
    return ClientModel(name: 'ABCDEFGHIJK', number: index, date: 'sexta');
  });

  final List<ClientModel> clientes = [
    ...clientSegunda,
    ...clientTerca,
    ...clientQuarta,
    ...clientQuinta,
    ...clientSexta,
  ];

  eventbox
      .addManyClientsToObjectBox(clientes)
      .then((value) => print("Clientes adicionados com sucesso!"));
}
