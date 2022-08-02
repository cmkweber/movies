// System imports
import 'package:flutter/widgets.dart';

// App state class
class AppState extends ChangeNotifier
{
	// App state members
	int? _movie;

	// App state getters
	int? get movie => _movie;

	// App state setters
	set movie(int? movie)
	{
		// If the specified movie is already active, return early
		if(movie == _movie) {
			return; }

		// Store the specified movie
		_movie = movie;

		// Notify listeners
		notifyListeners();
	}
}