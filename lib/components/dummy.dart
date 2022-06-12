            // ListTile(
            //   title: Text(
            //     "Trending",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount:
            //           filterMoviesByCategory(movieController.movies, "Trending")
            //               .length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: filterMoviesByCategory(
            //                         movieController.movies, "Trending")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(
            //                             movieController.movies,
            //                             "Trending")[index].coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "New Release",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(
            //               movieController.movies, "New Release")
            //           .length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                       movie: filterMoviesByCategory(
            //                           movieController.movies,
            //                           "Trending")[index],
            //                     ),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 1.2,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(
            //                             movieController.movies,
            //                             "New Release")[index].coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Action",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount:
            //           filterMoviesByCategory(movieController.movies, "Action")
            //               .length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                       movie: filterMoviesByCategory(
            //                           movieController.movies, "Action")[index],
            //                     ),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(
            //                             movieController.movies,
            //                             "Action")[index].coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Comedy",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(movieController.movies, "Comedy").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie:filterMoviesByCategory(movieController.movies, "Comedy")[index],
            //                 ),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Comedy")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Drama",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount:filterMoviesByCategory(movieController.movies, "Drama").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: filterMoviesByCategory(movieController.movies, "Drama")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Drama")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Fantasy",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(movieController.movies, "Fantasy").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: filterMoviesByCategory(movieController.movies, "Fantasy")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Fantasy")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Horror",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(movieController.movies, "Horror").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: movieController.movies[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                        filterMoviesByCategory(movieController.movies, "Horror")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Mystery",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount:filterMoviesByCategory(movieController.movies, "Mystery").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: filterMoviesByCategory(movieController.movies, "Mystery")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Mystery")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Romance",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(movieController.movies, "Romance").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: filterMoviesByCategory(movieController.movies, "Romance")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Romance")[index]
            //                            .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Thriller",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(movieController.movies, "Thriller").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie:filterMoviesByCategory(movieController.movies, "Thriller")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Thriller")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
            // const Padding(padding: EdgeInsets.only(top: 10.0)),
            // ListTile(
            //   title: Text(
            //     "Western",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText1
            //         ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
            //   ),
            //   trailing: TextButton(
            //     onPressed: () {},
            //     child: const Text("See All"),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width / 2,
            //   child: ListView.builder(
            //       itemCount: filterMoviesByCategory(movieController.movies, "Western").length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(
            //                 () => movieDescription(
            //                     movie: filterMoviesByCategory(movieController.movies, "Western")[index]),
            //                 transition: Transition.size);
            //           },
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 3,
            //             margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 image: DecorationImage(
            //                     image: NetworkImage(Routes.appBaseUrl +
            //                         filterMoviesByCategory(movieController.movies, "Western")[index]
            //                             .coverImage),
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),