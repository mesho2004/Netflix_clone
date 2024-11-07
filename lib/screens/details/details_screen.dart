import 'package:flutter/material.dart';
import 'package:netflix_app/core/api/api_service.dart';
import 'package:netflix_app/core/models/movie%20model/movie_details_model.dart';
import 'package:netflix_app/core/models/movie%20model/movie_model.dart';
import 'package:netflix_app/screens/details/widgets/details_image.dart';
import 'package:netflix_app/screens/details/widgets/details_info.dart';
import 'package:netflix_app/screens/details/widgets/details_recommended.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  const MovieDetail({super.key, required this.id});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<MovieDetailModel> details;
  late Future<List<Movie>> recomendation;

  @override
  void initState() {
    super.initState();
    details = Api().getDetails(widget.id);
    recomendation = Api().getRecommendation(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: details,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                // log(snapshot.data.toString());

                return const Text('No Details');
              }
              String genre =
                  snapshot.data!.genres.map((genre) => genre.name).join(',');
              return Column(
                children: [
                  DetailImage(
                    height: height,
                    posterPath: snapshot.data!.posterPath,
                  ),
                  DetailInfo(
                      genre: genre,
                      title: snapshot.data!.title,
                      date: snapshot.data!.releaseDate.year.toString(),
                      overview: snapshot.data!.overview),
                  const SizedBox(
                    height: 30,
                  ),
                  Recommended(recomendation: recomendation)
                ],
              );
            }),
      ),
    );
  }
}
