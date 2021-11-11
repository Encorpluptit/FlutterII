import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieDetailsView extends StatefulWidget {
  final Movie movie;
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  State createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.movie.poster,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.movie.title,
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          textAlign: TextAlign.center,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Released on ${widget.movie.releaseDate}',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(fontSize: 20.0),
                          ),
                          textAlign: TextAlign.center,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Synopsis:",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.movie.synopsis,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(fontSize: 20.0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Screenshots",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(fontSize: 25.0),
                          ),
                        )),
                    CarouselSlider.builder(
                      itemCount: widget.movie.images.length,
                      options: CarouselOptions(
                          viewportFraction: 0.75,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          height: 400,
                          reverse: false,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index)),
                      itemBuilder: (context, index, realIndex) {
                        return (buildImage(
                            context, index, widget.movie.images[index]));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: buildIndicator(),
                    )
                  ],
                ))));
  }

  Widget buildImage(BuildContext context, int index, String imageUrl) =>
      ClipRRect(
          borderRadius: BorderRadius.circular(35.0),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
                    margin: const EdgeInsets.only(top: 200, bottom: 150),
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress, color: Colors.blue)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex, count: widget.movie.images.length);
}
