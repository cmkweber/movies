// System imports
import 'dart:convert';
import 'package:http/http.dart';

// Package imports
import 'headers.dart';

// Movie data class
class MovieData
{
	// Movie data members
	final Uri backdrop;
	final String description;
	final int id;
	final Uri poster;
	final double rating;
	final DateTime released;
	final String title;

	// Movie data constructor
	MovieData({
		required this.backdrop,
		required this.description,
		required this.id,
		required this.poster,
		required this.rating,
		required this.released,
		required this.title}) : assert(rating >= 0.0 && rating <= 5.0);

	// Json constructor
	factory MovieData.fromJson(dynamic json)
	{
		// If the specified json is invalid, throw error
		if(json is! Map<String, dynamic>) {
			throw Exception('Invalid movie'); }

		// Attempt to acquire the movies data
		final dynamic backdrop = json['backdrop_path'];
		final dynamic description = json['overview'];
		final dynamic id = json['id'];
		final dynamic poster = json['poster_path'];
		final dynamic rating = json['vote_average'];
		final dynamic released = json['release_date'];
		final dynamic title = json['title'];

		// If the backdrop is invalid, throw error
		if(backdrop is! String) {
			throw Exception('Invalid backdrop'); }

		// If the description is invalid, throw error
		if(description is! String) {
			throw Exception('Invalid description'); }

		// If the id is invalid, throw error
		if(id is! int) {
			throw Exception('Invalid id'); }

		// If the poster is invalid, throw error
		if(poster is! String) {
			throw Exception('Invalid poster'); }

		// If the rating is invalid, throw error
		if(rating is! num) {
			throw Exception('Invalid rating'); }

		// If the released is invalid, throw error
		if(released is! String) {
			throw Exception('Invalid released'); }

		// If the title is invalid, throw error
		if(title is! String) {
			throw Exception('Invalid title'); }

		// Return success
		return MovieData(
			backdrop: Uri.parse('https://image.tmdb.org/t/p/original$backdrop'),
			description: description,
			id: id,
			poster: Uri.parse('https://image.tmdb.org/t/p/w780$poster'),
			rating: rating.toDouble() * 0.5,
			released: DateTime.parse(released),
			title: title
		);
	}

	// Remote constructor
	static Future<MovieData> fromRemote(int id) async
	{
		// Attempt to acquire the specified movie
		final Response response = await get(
			Uri.parse('https://api.themoviedb.org/3/movie/$id'),
			headers: headers
		);

		// If the response code is invalid, throw error
		if(response.statusCode != 200) {
			throw Exception('Invalid response'); }

		// Return success
		return MovieData.fromJson(json.decode(response.body));
	}
}