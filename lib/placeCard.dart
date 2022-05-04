import 'package:codinglab/pages/menu.dart';
import 'package:flutter/material.dart';

Widget placeCard(BuildContext context, String imgUrl, String hotelName, String location, int rating) {

  return Card(
    margin: EdgeInsets.only(right: 22.0),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      side: BorderSide(
        color: Color.fromRGBO(0, 62, 41, 1),
        width: 1.0,
      ),

    ),
    elevation: 0.0,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu()));
      },
      child: Container(

        decoration: BoxDecoration(

            image: DecorationImage(
              image: AssetImage(imgUrl),
              fit: BoxFit.cover,
              scale: 2.0,
            )),
        width: 200.0,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  for (var i = 0; i < rating; i++)
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 24,
                    ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelName,
                      style: const TextStyle(
                        shadows:[
                          Shadow(
                            offset: Offset(1.2, 1.2),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 19.0,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        shadows:[
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}