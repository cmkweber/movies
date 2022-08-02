// App config class
class AppConfig
{
	// App config members
	final int? movie;

	// App config constructor
	const AppConfig({this.movie});

	// Uri constructor
	factory AppConfig.fromUri(Uri uri)
	{
		// Attempt to acquire the first and second segments
		final String? first = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
		final String? second = uri.pathSegments.length >= 2 ? uri.pathSegments[1] : null;

		// If the first segment is invalid, or its not movie, return default config
		if(first == null || first != 'movie' || second == null) {
			return const AppConfig(); }
		// Else, return movie config
		else {
			return AppConfig(movie: int.parse(second)); }
	}

	// Function to convert the app config to a string
	@override String toString() { return movie != null ? '/movie/$movie' : '/'; }
}