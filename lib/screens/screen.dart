// System imports
import 'package:flutter/material.dart';

// Screen class
class Screen<T> extends MaterialPage<T>
{
	// Screen constructor
	const Screen({required ValueKey<String> super.key, required super.child});
}