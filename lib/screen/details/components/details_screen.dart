import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rentaroom/constants.dart';
import 'package:rentaroom/room.dart';

class DetailsScreen extends StatelessWidget {
  final Room room;
  const DetailsScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            const SizedBox(height: 2),
            Text(
              room.roomid + ". " + room.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ImageSlideshow(
              width: double.infinity,
              height: 250,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.network(
                  "https://slumberjer.com/rentaroom/images/" +
                      room.roomid +
                      "_1.jpg",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://slumberjer.com/rentaroom/images/" +
                      room.roomid +
                      "_2.jpg",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://slumberjer.com/rentaroom/images/" +
                      room.roomid +
                      "_3.jpg",
                  fit: BoxFit.cover,
                ),
              ],
              autoPlayInterval: 3000,
              isLoop: true,
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  "Area:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "State:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Price:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  room.area,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Text(
                  room.state,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    "RM " + room.price,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Description:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              room.description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  "Contact:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Deposit:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  room.contact,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Text(
                  "RM " + room.deposit,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  "Latitude:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Longitude:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  room.latitude,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Text(
                  room.longitude,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            Text(
              "Date created: " + room.datecreated,
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
