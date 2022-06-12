import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/services/controllers/movies_controller.dart';

class videoGames extends StatelessWidget {
  final List<String> _dummyAlbum = [
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  ];

  final String _dummyTitle = "This is the Title";
  final String _dummyDescription = "This is the Description";
  final String _dummyNewPrice = "96.7";
  final String _dummyOldPrice = "110.5";

  @override
  Widget build(BuildContext context) {
    MoviesController(moviesRepository: Get.find()).getMovies();
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          margin: const EdgeInsets.only(top: 5.0),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
            ),
            items: _dummyAlbum.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(children: [
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 2.3,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFF81DDAA), Color(0xFF406752)]),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.elliptical(200.0, 100.0),
                              topRight: Radius.elliptical(1000.0, 200.0),
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                            color: Theme.of(context).primaryColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Center(
                                    child: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                )),
                                radius: 16.0,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                            SizedBox(
                              height: 25.0,
                              width: 70.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Watch Now",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                            Text(
                              _dummyTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                            ),
                            Text(
                              _dummyDescription,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: FractionalOffset.topRight,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.only(right: 15.0),
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: NetworkImage(i),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ))
                  ]);
                },
              );
            }).toList(),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "Free Demo",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 3,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _dummyTitle,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "Hottest Deals",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.width / 5,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _dummyTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              _dummyDescription,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "\$" + _dummyOldPrice,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "\$" + _dummyNewPrice,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "Trending",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 3,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(_dummyAlbum[index]),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(children: [
                          Align(
                            alignment: FractionalOffset.centerLeft,
                            child: Text(
                              _dummyTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: Row(
                              children: [
                                Text(
                                  "\$" + _dummyNewPrice,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14.0),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 10.0)),
                                Text("\$" + _dummyOldPrice,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 10.0)),
                              ],
                            ),
                          )
                        ]),
                      )),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "Most Watched",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                  ),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "Browse By Collection",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 3,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: FractionalOffset.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _dummyTitle,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "What We're Watching",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.width / 5,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _dummyTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              _dummyDescription,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "\$" + _dummyOldPrice,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "\$" + _dummyNewPrice,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(
          title: Text(
            "Coming Soon",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 3,
          child: ListView.builder(
              itemCount: _dummyAlbum.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _dummyTitle,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 30.0))
      ],
    );
  }
}
