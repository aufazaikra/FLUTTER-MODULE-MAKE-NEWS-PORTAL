import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  Widget iconTag({required Icon icon, required String tag}) {
    return IconButton(
      icon: icon,
      onPressed: () {
        fToast?.showToast(
          toastDuration: Duration(milliseconds: 2000),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey,
            ),
            child: Text('Anda memilih kategori $tag'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kategori Page')),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            _buildKategori('General', [
              Icons.attach_money,
              Icons.card_travel,
              Icons.local_hospital
            ]),
            SizedBox(height: 15),
            _buildKategori('Entertainment', [
              Icons.fastfood,
              Icons.hotel,
              Icons.local_grocery_store,
              Icons.local_movies
            ]),
            SizedBox(height: 15),
            _buildKategori('Transportasi', [
              Icons.directions_bike,
              Icons.motorcycle,
              Icons.directions_car,
              Icons.local_shipping,
              Icons.directions_bus,
              Icons.directions_boat,
              Icons.train,
              Icons.airplanemode_active,
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildKategori(String title, List<IconData> icons) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(height: 1.5, color: Colors.grey),
          Wrap(
            spacing: 10,
            children: icons.map((icon) => iconTag(icon: Icon(icon), tag: title)).toList(),
          ),
        ],
      ),
    );
  }
}
