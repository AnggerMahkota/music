import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Item {
  final String imageUrl;
  final String name;
  final String description;

  Item(this.imageUrl, this.name, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Love This Song'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.collections),
              ),
              Tab(
                icon: Icon(Icons.audiotrack),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  //1
  Item(
    "https://i.ibb.co/7t78QLs/fortwenty.jpg",
    "Menghitung Hari 2",
    "19.00",
  ),
  //2
  Item(
    "https://i.ibb.co/7t78QLs/fortwenty.jpg",
    "Aku Tenang",
    "00.00",
  ),
  //3
  Item(
    "https://i.ibb.co/7t78QLs/fortwenty.jpg",
    "Kusut",
    "21.00",
  ),
  //4
  Item(
    "https://i.ibb.co/7t78QLs/fortwenty.jpg",
    "Zona Nyaman",
    "13.00",
  ),
  //5
  Item(
    "https://i.ibb.co/7t78QLs/fortwenty.jpg",
    "Hitam Putih",
    "04.21",
  ),
  //6
  Item(
    "https://i.ibb.co/P95KG3L/sheila-on-7.jpg",
    "Pemuja Rahasia",
    "06.21",
  ),
  //7
  Item(
    "https://i.ibb.co/P95KG3L/sheila-on-7.jpg",
    "Dan",
    "18.51",
  ),
  //8
  Item(
    "https://i.ibb.co/P95KG3L/sheila-on-7.jpg",
    "Lapang Dada",
    "23.02",
  ),
  //9
  Item(
    "https://i.ibb.co/P95KG3L/sheila-on-7.jpg",
    "Sahabat Sejati",
    "17.02",
  ),
  //10
  Item(
    "https://i.ibb.co/P95KG3L/sheila-on-7.jpg",
    "Melompat Lebih Tinggi",
    "11.52",
  ),
  //11
  Item(
    "https://i.ibb.co/bbrHyKP/noah.jpg",
    "Separuh Aku",
    "14.54",
  ),
  //12
  Item(
    "https://i.ibb.co/bbrHyKP/noah.jpg",
    "Tak Lagi Sama",
    "17.21",
  ),
  //13
  Item(
    "https://i.ibb.co/bbrHyKP/noah.jpg",
    "Seperti Kemarin",
    "23.20",
  ),
  //14
  Item(
    "https://i.ibb.co/bbrHyKP/noah.jpg",
    "Jalani Mimpi",
    "16.24",
  ),
  //15
  Item(
    "https://i.ibb.co/bbrHyKP/noah.jpg",
    "Wanitaku",
    "17.20",
  ),
  //16
  Item(
    "https://i.ibb.co/KVZ2Y5X/dewa-19.jpg",
    "Pupus",
    "10.11",
  ),
  //17
  Item(
    "https://i.ibb.co/KVZ2Y5X/dewa-19.jpg",
    "Risalah Hati",
    "11.11",
  ),
  //18
  Item(
    "https://i.ibb.co/KVZ2Y5X/dewa-19.jpg",
    "Munajat Cinta",
    "16.19",
  ),
  //19
  Item(
    "https://i.ibb.co/KVZ2Y5X/dewa-19.jpg",
    "Roman Picisan",
    "20.20",
  ),
  //20
  Item(
    "https://i.ibb.co/KVZ2Y5X/dewa-19.jpg",
    "Dewi",
    "12.12",
  ),
];
