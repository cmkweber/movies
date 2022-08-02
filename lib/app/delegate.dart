// System imports
import 'package:flutter/widgets.dart';

// Package imports
import 'config.dart';
import '../screens/movie/screen.dart';
import '../screens/movies/screen.dart';
import '../screens/screen.dart';
import 'state.dart';

// App delegate class
class AppDelegate extends RouterDelegate<AppConfig> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfig>
{
	// App delegate members
	@override AppConfig? get currentConfiguration => AppConfig(movie: state.movie);
	@override final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
	final AppState state;

	// App delegate constructor
	AppDelegate({required this.state}) { state.addListener(notifyListeners); }

	// App delegate destructor
	@override void dispose()
	{
	  // Stop listening to state events
		state.removeListener(notifyListeners);

		// Call destroy on router delegate
		super.dispose();
	}

	// Function to set the app delegates path
	@override Future<void> setNewRoutePath(AppConfig configuration) async { state.movie = configuration.movie; }

	// Function to pop the specified route
	bool _onPopPage(Route<dynamic> route, dynamic result)
	{
		// If the specified route is invalid, throw error
		if(route.settings is! Screen) {
			throw Exception('Invalid route'); }

		// Acquire the specified screen
		final Screen screen = route.settings as Screen;

		// If the specified screen is movies screen, return failure
		if(screen.key == const ValueKey<String>('Movies')) {
			return false; }

		// Attempt to pop the route, on error, return failure
		if(!route.didPop(result)) {
			return false; }

		// Reset the movie
		state.movie = null;

		// Return success
		return true;
	}

	// Function to build the app delegate
	@override Widget build(BuildContext context)
	{
		// Return success
		return Navigator(
			key: navigatorKey,
			onPopPage: _onPopPage,
			pages: [
				const MoviesScreen(),
				if(state.movie != null)
					MovieScreen(id: state.movie!)
			]
		);
	}
}