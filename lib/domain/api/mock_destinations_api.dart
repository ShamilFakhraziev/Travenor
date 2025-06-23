import 'dart:convert';

import 'package:travel_app/domain/entity/destination.dart';

//TODO: Major. Название класса должно совпадать с названием файла за супер редким исключением
class MockDestinationsApi {
  //TODO: Major. в апи уже происходит перевод json в модели поэтому возвращать строку некорректно
  Future<List<Destination>> getDestinations() async {
    //TODO: В  destinations возвращать строку и респонсить список моделей полученный из этой строки
    final destinationsString = '''
  [
    {
      "id": 1,
      "imageUrls": [
        "https://i.pinimg.com/originals/86/86/23/868623a0a3bb895ac185f3ea74ece989.jpg",
        "https://r1.nubex.ru/s11322-3fd/71437ab7f7_fit-in~1280x800~filters:no_upscale()__f17895_8e.jpg"
      ],
      "title": "The Golden Mountains of Altai",
      "country": "Russia",
      "district": "Altai",
      "rating": 5,
      "price": 500,
      "about": "The Golden Mountains of Altai are the heart of Siberia, a region captivating with its wild beauty. They are not just mountains, but an entire system of ranges where peaks touch the sky and glaciers feed crystal-clear rivers. Here, alpine meadows are overflowing with flowers, and dense coniferous forests hold the secrets of ancient shamans."
    },
    {
      "id": 2,
      "imageUrls": [
        "https://i.pinimg.com/originals/90/bc/55/90bc55ab859756da99c110753a9a30c1.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Das_Lachta_Zentr-_Лахта_Центр_2H1A1467WI.jpg/2560px-Das_Lachta_Zentr-_Лахта_Центр_2H1A1467WI.jpg"
      ],
      "title": "Лахта-центр",
      "country": "Россия",
      "district": "Санкт-Петербург",
      "rating": 5,
      "price": 20,
      "about": "«Лахта Центр» — самый высокий небоскрёб в Европе и самое северное высотное здание в мире, расположенное на берегу Финского залива в Приморском районе Санкт-Петербурга."
    },
    {
      "id": 3,
      "imageUrls": [
        "https://static.tildacdn.com/tild3734-6662-4432-a235-366636303131/1576968_original.jpg",
        "https://cs13.pikabu.ru/post_img/2019/08/21/3/og_og_156635534225067501.jpg"
      ],
      "title": "Байкал",
      "country": "Россия",
      "district": "Бурятия, Иркутская область",
      "rating": 5,
      "price": 400,
      "about": "Озеро тектонического происхождения в южной части Восточной Сибири площадью 31 722 км², самое глубокое озеро на планете, крупнейший природный резервуар пресной воды и самое большое по площади пресноводное озеро Евразии."
    }
  ]
  ''';

    final listData = jsonDecode(destinationsString) as List<dynamic>;
    final destinations =
        listData
            .map(
              (destination) =>
                  Destination.fromJson(destination as Map<String, dynamic>),
            )
            .toList();

    return destinations;
  }
}
