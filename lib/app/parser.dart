// System imports
import 'package:flutter/widgets.dart';

// Package imports
import 'config.dart';

// App parser class
class AppParser extends RouteInformationParser<AppConfig>
{
	// Function to acquire an app config using the specified information
	@override Future<AppConfig> parseRouteInformation(RouteInformation routeInformation) async
	{
		// Return success
		return AppConfig.fromUri(Uri.parse(routeInformation.location ?? '/'));
	}

	// Function to acquire information using the specified app config
	@override RouteInformation? restoreRouteInformation(AppConfig configuration)
	{
		// Return success
		return RouteInformation(location: configuration.toString());
	}
}