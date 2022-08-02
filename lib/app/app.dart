// System imports
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

// Package imports
import 'delegate.dart';
import 'parser.dart';
import 'state.dart';

// App class
class App extends MaterialApp
{
	// App members
	final AppState state;

	// App constructor
	App({required this.state}) : super.router(
		key: const ValueKey<String>('router'),
		color: Colors.grey,
		routeInformationParser: AppParser(),
		routerDelegate: AppDelegate(state: state),
		theme: ThemeData.from(
			colorScheme: ColorScheme.fromSwatch(
				backgroundColor: Colors.grey.shade900,
				brightness: Brightness.dark,
				primarySwatch: Colors.grey
			),
			textTheme: GoogleFonts.georamaTextTheme(ThemeData.dark().textTheme),
			useMaterial3: true
		)
	);

	// Function to acquire the apps state
	static AppState of(BuildContext context)
	{
		// Attempt to acquire the app
		final App? app = context.findAncestorWidgetOfExactType<App>();

		// If the app wasnt acquired, throw error
		if(app == null) {
			throw Exception('Invalid app'); }

		// Return success
		return app.state;
	}
}