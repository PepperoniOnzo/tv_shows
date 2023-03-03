# TV Shows App

App for searching and viewing details of TV shows.

State management is handled by `Provider` and `http` package is used for making http requests. For opening links in browser, `url_launcher` package is used.

Api used: [TV Maze](https://www.tvmaze.com/api) with endpoint `search/shows`.

## Project Structure

```text
assets/             # Default poster image
lib/
|- data/            # Film model and constants
|- screens/         # Two main screens
|- services/        # Http service
|- views/           # Business logic (View)
|- widgets/         # Widgets
|- main.dart        # Entry point
```