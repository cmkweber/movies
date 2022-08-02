// System imports
import 'package:flutter/widgets.dart';

// Package imports
import 'movies.dart';
import '../screen.dart';

// Movies screen class
class MoviesScreen extends Screen<void>
{
	// Movies screen constructor
	const MoviesScreen() : super(key: const ValueKey<String>('Movies'), child: const Movies());
}