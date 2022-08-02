// System imports
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// Package imports
import '../../app/app.dart';
import '../../data/movie.dart';
import '../common/stars.dart';

// Movie class
class Movie extends StatefulWidget
{
	// Movie members
	final MovieData data;

	// Movie constructor
	const Movie({super.key, required this.data});

	// Function to create the movie state
	@override MovieState createState() => MovieState();
}

// Movie state class
class MovieState extends State<Movie>
{
	// Movie state members
	static final DateFormat _format = DateFormat.MMMMd('en_US');

	// Called when the movie has been tapped
	void _onTap() { App.of(context).movie = widget.data.id; }

	// Function to build the movie
	@override Widget build(BuildContext context)
	{
		// Return success
		return GestureDetector(
			onTap: _onTap,
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					Expanded(
						child: SizedBox.expand(
							child: ClipRRect(
								borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
								child: Image.network(
									widget.data.poster.toString(),
									alignment: Alignment.center,
									filterQuality: FilterQuality.medium,
									fit: BoxFit.cover
								)
							)
						)
					),
					Container(
						decoration: BoxDecoration(
							borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18.0)),
							color: Color.lerp(Colors.grey.shade900, Colors.black, 0.5)
						),
						padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Row(
									children: [
										Expanded(
											child: Text(
												widget.data.title,
												overflow: TextOverflow.ellipsis,
												style: TextStyle(
													color: Colors.grey.shade400,
													fontSize: 16.0,
													fontWeight: FontWeight.bold
												)
											)
										),
										Stars(rating: widget.data.rating)
									]
								),
								Text(
									'Released: ${_format.format(widget.data.released)}',
									overflow: TextOverflow.ellipsis,
									style: TextStyle(
										color: Colors.grey.shade600,
										fontSize: 14.0
									)
								)
							]
						)
					)
				]
			)
		);
	}
}