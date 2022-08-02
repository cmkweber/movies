// System imports
import 'dart:convert';
import 'package:http/http.dart';

// Package imports
import 'headers.dart';
import 'movie.dart';

// Movies data class
class MoviesData
{
	// Movies data members
	final List<MovieData> movies;

	// Movies data constructor
	MoviesData({required this.movies});

	// Json constructor
	factory MoviesData.fromJson(dynamic json)
	{
		// If the specified json is invalid, throw error
		if(json is! Map<String, dynamic>) {
			throw Exception('Invalid movies'); }

		// Attempt to acquire the results
		final dynamic results = json['results'];

		// If the results are invalid, throw error
		if(results is! List) {
			throw Exception('Invalid results'); }

		// Create a container to store movies
		final List<MovieData> movies = [];

		// Loop through results and collect movies
		for(final dynamic result in results) {
			movies.add(MovieData.fromJson(result)); }

		// Return success
		return MoviesData(movies: movies);
	}

	// Remote constructor
	static Future<MoviesData> fromRemote() async
	{
		// Attempt to acquire popular movies
		final Response response = await get(
			Uri.parse('https://api.themoviedb.org/4/discover/movie?sort_by=popularity.desc'),
			headers: headers
		);

		// If the response code is invalid, throw error
		if(response.statusCode != 200) {
			throw Exception('Invalid response'); }

		// Return success
		return MoviesData.fromJson(json.decode(response.body));
	}
}