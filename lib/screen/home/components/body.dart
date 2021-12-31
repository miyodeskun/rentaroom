import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rentaroom/constants.dart';
import 'package:rentaroom/room.dart';
import 'package:rentaroom/screen/details/components/details_screen.dart';
import 'header_with_search.dart';
import 'title_with_underline.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late double screenHeight, screenWidth, resWidth;
  List roomlist = [];

  @override
  void initState() {
    super.initState();
    _loadRooms();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 600) {
      resWidth = screenWidth * 0.85;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: const [
                  TitleWithUnderline(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(roomlist.length, (index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AspectRatio(
                              child: Image.network(
                                  "https://slumberjer.com/rentaroom/images/" +
                                      roomlist[index]['roomid'] +
                                      "_1.jpg",
                                  fit: BoxFit.cover),
                              aspectRatio: 2 / 1,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Text(
                                roomlist[index]['title'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    "Price:",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 5, top: 5),
                                  child: Text(
                                    "Deposit:",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 5),
                                  child: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Text(
                                      "RM" + roomlist[index]['price'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 5, top: 5),
                                  child: Text(
                                    "RM" + roomlist[index]['deposit'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          _roomDetails(index);
                        },
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }

  _loadRooms() {
    http
        .get(
      Uri.parse("https://slumberjer.com/rentaroom/php/load_rooms.php"),
    )
        .then((response) {
      if (response.statusCode == 200 && response.body != "failed") {
        var extracdata = json.decode(response.body)['data'];
        setState(() {
          roomlist = extracdata['rooms'];
        });
      } else {}
    });
  }

  _roomDetails(int index) async {
    Room room = Room(
        roomid: roomlist[index]['roomid'],
        contact: roomlist[index]['contact'],
        title: roomlist[index]['title'],
        description: roomlist[index]['description'],
        price: roomlist[index]['price'],
        deposit: roomlist[index]['deposit'],
        state: roomlist[index]['state'],
        area: roomlist[index]['area'],
        datecreated: roomlist[index]['date_created'],
        latitude: roomlist[index]['latitude'],
        longitude: roomlist[index]['longitude']);
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => DetailsScreen(
                  room: room,
                )));
  }
}
