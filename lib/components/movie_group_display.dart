import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/movie_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/movieDescription.dart';

class MovieGroupDisplay extends StatelessWidget {
  final List<MovieModel> data;
  const MovieGroupDisplay({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => movieDescription(movie: data[index]),
                    transition: Transition.size);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            Routes.appBaseUrl + data[index].coverImage),
                        fit: BoxFit.cover)),
              ),
            );
          }),
    );
  }
}
