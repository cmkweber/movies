// System imports
import 'package:flutter/widgets.dart';

// Package imports
import 'movie.dart';
import '../screen.dart';

// Movie screen class
class MovieScreen extends Screen<void>
{
	// Movie screen constructor
	MovieScreen({required int id}) : super(key: const ValueKey<String>('Movie'), child: Movie(id: id));
}