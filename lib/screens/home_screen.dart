import 'package:flutter/material.dart';
import 'package:peliculas2/providers/movies_provider.dart';
import 'package:peliculas2/search/search_delegate.dart';
import 'package:peliculas2/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';



class HomeScreen extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),

            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,// populares,
              title: 'Populares', // opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            
          ],
        ),
      )
    );
  }
}