// System imports
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// Package imports
import '../../data/movie.dart';
import '../common/stars.dart';

// Details class
class Details extends LayoutBuilder
{
	// Details members
	static final DateFormat _format = DateFormat.MMMMd('en_US');

	// Details constructor
	Details({super.key, required MovieData movie}) : super(builder: (BuildContext context, BoxConstraints constraints)
	{
		// Return success
		return Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				SizedOverflowBox(
					size: Size(constraints.maxWidth, (constraints.maxWidth * 0.5625).floor() - 40.0),
					child: AspectRatio(
						aspectRatio: 16 / 9,
						child: Image.network(
							movie.backdrop.toString(),
							alignment: Alignment.center,
							filterQuality: FilterQuality.medium,
							fit: BoxFit.cover
						)
					)
				),
				Padding(
					padding: const EdgeInsets.symmetric(horizontal: 16.0),
					child: Container(
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(4.0),
							color: Color.lerp(Colors.grey.shade900, Colors.black, 0.5)
						),
						padding: const EdgeInsets.all(12.0),
						child: Row(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								SizedBox(
									width: 100,
									child: AspectRatio(
										aspectRatio: 2 / 3,
										child: ClipRRect(
											borderRadius: BorderRadius.circular(3.0),
											child: Image.network(
												movie.poster.toString(),
												alignment: Alignment.center,
												filterQuality: FilterQuality.medium,
												fit: BoxFit.cover
											)
										)
									)
								),
								const SizedBox(width: 10.0),
								Expanded(child:
									Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Row(
												children: [
													Expanded(
														child: Text(
															movie.title,
															overflow: TextOverflow.ellipsis,
															style: TextStyle(
																color: Colors.grey.shade400,
																fontSize: 18.0,
																fontWeight: FontWeight.bold
															)
														)
													),
													Stars(rating: movie.rating)
												]
											),
											Text(
												'Released: ${_format.format(movie.released)}',
												overflow: TextOverflow.ellipsis,
												style: TextStyle(
													color: Colors.grey.shade600,
													fontSize: 14.0
												)
											),
											const SizedBox(height: 10.0),
											Text(
												movie.description,
												style: TextStyle(
													color: Colors.grey.shade500,
													fontSize: 15.0
												)
											)
										]
									)
								)
							]
						)
					)
				)
			]
		);
	});
}