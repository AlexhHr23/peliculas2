import 'package:flutter/material.dart';
import 'package:peliculas2/providers/movies_provider.dart';
import 'package:peliculas2/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';



class TopRatedScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas top'),
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
            CardSwiper( movies: moviesProvider.topRatedMovies ),

            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,// populares,
              title: 'Populares', // opcional
              onNextPage: () => moviesProvider.geTopRatedMovies(),
            ),
            
          ],
        ),
      )
    );
  }
}