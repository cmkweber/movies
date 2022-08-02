// System imports
import 'package:flutter/widgets.dart';

// Package imports
import 'app/app.dart';
import 'app/state.dart';

// Entry point
void main()
{
	// Intialize binding and run app
	WidgetsFlutterBinding.ensureInitialized();
	runApp(App(state: AppState()));
}