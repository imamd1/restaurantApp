// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

part of 'pages.dart';

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);
  static const routeName = '/main-page';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: bgColor,
      ),
      SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(defMargin, 56, defMargin, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image(image: AssetImage("assets/dkaffe.png")),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(defMargin, 32, defMargin, 32),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  autofocus: true,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Cari kafe sesukamu...",
                      hintStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      )),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(
                defMargin,
                0,
                defMargin,
                0,
              ),
              child: Text(
                "Yang Jadi Favorit",
                style: subtitle1,
              ),
            ),
            Container(
                height: double.maxFinite,
                child: FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/restaurant.json'),
                  builder: (context, snapshot) {
                    final List<Restaurant> restaurants =
                        parseRestaurants(snapshot.data);
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurants.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _buildRestaurantTest(
                            context, restaurants[index]);
                      },
                    );
                  },
                )),
          ],
        ),
      )),
    ]));
  }
}

Widget _buildRestaurantTest(BuildContext context, Restaurant restaurant) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsetsDirectional.only(bottom: defMargin),
      height: 157,
      width: 228,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Container(
          height: 106,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image:
                  DecorationImage(image: NetworkImage(restaurant.pictureId))),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Text(restaurant.name)),
        Container(
            margin: EdgeInsets.fromLTRB(8, 3, 0, 8),
            child: Text(restaurant.city))
      ]),
    ),
  );
}
