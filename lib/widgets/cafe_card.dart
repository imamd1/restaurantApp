// ignore_for_file: prefer_const_constructors_in_immutables

part of 'widgets.dart';

class CafeCard extends StatelessWidget {
  // const CafeCard({Key? key}) : super(key: key);
  final Restaurant restaurant;

  CafeCard(this.restaurant);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
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
                image: DecorationImage(image: NetworkImage(restaurant.pictureId))),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(8, 8, 0, 0), child: Text(restaurant.name)),
          Container(margin: EdgeInsets.fromLTRB(8, 3, 0, 8), child: Text(restaurant.city))
        ]),
      ),
    );
  }
}
