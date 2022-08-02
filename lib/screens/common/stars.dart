// System imports
import 'package:flutter/material.dart';

// Stars class
class Stars extends StatelessWidget
{
	// Stars members
	final double rating;

	// Stars constructor
	const Stars({super.key, required this.rating}) : assert(rating >= 0.0 && rating <= 5.0);

	// Function to build the stars
	@override Widget build(BuildContext context)
	{
		// Create a container to store stars
		final List<Widget> stars = [];

		// Loop through and create stars
		for(int s = 0; s < 5; s++)
		{
			// Add star to stars
			stars.add(Icon(
				rating < s + 0.33 ? Icons.star_outline : (rating < s + 0.66 ? Icons.star_half_outlined : Icons.star),
				color: Colors.amber.shade800,
				size: 17.0
			));

			// If this isnt the last star, add spacing to stars
			if(s < 4) {
				stars.add(const SizedBox(width: 4.0)); }
		}

		// Return success
		return Row(children: stars);
	}
}