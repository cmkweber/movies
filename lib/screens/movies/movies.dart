// System imports
import 'package:flutter/material.dart';

// Package imports
import 'movie.dart';
import '../../data/movies.dart';
import '../view.dart';

// Movies class
class Movies extends StatefulWidget
{
	// Movies constructor
	const Movies({super.key});

	// Function to create the movies state
	@override MoviesState createState() => MoviesState();
}

// Movies state class
class MoviesState extends State<Movies>
{
	// Movies state members
	late final Future<MoviesData> _movies;

	// Function to intialize the movies
	@override void initState()
	{
		// Call initialize on state
		super.initState();

		// Attempt to acquire the movies
		_movies = MoviesData.fromRemote();
	}

	// Function to build the movies
	@override Widget build(BuildContext context)
	{
		// Return success
		return View(
			title: 'Popular Movies',
			child: FutureBuilder(
				future: _movies,
				builder: ((BuildContext context, AsyncSnapshot<MoviesData> snapshot)
				{
					// If the future hasnt completed, return progress
					if(snapshot.connectionState != ConnectionState.done)
					{
						// Return progress
						return const Center(
							child: CircularProgressIndicator()
						);
					}
					// Else, return error or movies
					else
					{
						// If the future errored, return error
						if(snapshot.hasError || !snapshot.hasData)
						{
							// Return error
							return const Center(
								child: Text('Error downloading movies')
							);
						}
						// Else, return movies
						else
						{
							// Return movies
							return GridView.builder(
								gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
									childAspectRatio: 0.6,
									crossAxisSpacing: 30.0,
									mainAxisSpacing: 40.0,
									maxCrossAxisExtent: 400
								),
								itemCount: snapshot.data!.movies.length,
								itemBuilder: (BuildContext context, int index) => Movie(data: snapshot.data!.movies[index]),
								padding: const EdgeInsets.all(16.0)
							);
						}
					}
				})
			)
		);
	}
}