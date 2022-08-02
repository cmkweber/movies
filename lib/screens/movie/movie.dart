// System imports
import 'package:flutter/material.dart';

// Package imports
import 'details.dart';
import '../../data/movie.dart';
import '../view.dart';

// Movie class
class Movie extends StatefulWidget
{
	// Movie members
	final int id;

	// Movie constructor
	const Movie({super.key, required this.id});

	// Function to create the movie state
	@override MovieState createState() => MovieState();
}

// Movie state class
class MovieState extends State<Movie>
{
	// Movie state members
	late final Future<MovieData> _movie;

	// Function to intialize the movie state
	@override void initState()
	{
		// Call initialize on state
		super.initState();

		// Attempt to acquire the movie
		_movie = MovieData.fromRemote(widget.id);
	}

	// Function to build the movie
	@override Widget build(BuildContext context)
	{
		// Return success
		return View(
			extend: true,
			child: FutureBuilder(
				future: _movie,
				builder: ((BuildContext context, AsyncSnapshot<MovieData> snapshot)
				{
					// If the future hasnt completed, return progress
					if(snapshot.connectionState != ConnectionState.done)
					{
						// Return progress
						return const Center(
							child: CircularProgressIndicator()
						);
					}
					// Else, return error or movie
					else
					{
						// If the future errored, return error
						if(snapshot.hasError || !snapshot.hasData)
						{
							// Return error
							return const Center(
								child: Text('Error downloading movie')
							);
						}
						// Else, return movie
						else
						{
							// Return movie
							return SingleChildScrollView(
								child: Details(movie: snapshot.data!)
							);
						}
					}
				})
			)
		);
	}
}