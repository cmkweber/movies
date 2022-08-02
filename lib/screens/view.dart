// System imports
import 'package:flutter/material.dart';

// View class
class View extends Scaffold
{
	// View constructor
	View({super.key, required Widget child, String? title, bool extend = false}) :
		super(
			appBar: AppBar(
				backgroundColor: Colors.grey.shade900.withOpacity(0.0),
				elevation: 0,
				title: title != null ? Text(title) : null
			),
			body: child,
			extendBodyBehindAppBar: extend
		);
}