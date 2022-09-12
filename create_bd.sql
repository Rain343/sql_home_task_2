CREATE TABLE IF NOT EXISTS Genres (
		genre_id SERIAL PRIMARY KEY,
		genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers (
		performer_id SERIAL PRIMARY KEY,
		performer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
		album_id SERIAL PRIMARY KEY,
		album_name VARCHAR(60) NOT NULL,
		release_date date
);

CREATE TABLE IF NOT EXISTS Tracks (
		track_id SERIAL PRIMARY KEY,
		track_name VARCHAR(60) NOT NULL,
		length_time INTEGER,
		album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
		collection_id SERIAL PRIMARY KEY,
		collection_name VARCHAR(60) NOT NULL,
		release_date date
);

CREATE TABLE IF NOT EXISTS AlbumsPerformers (
		performer_id INTEGER NOT NULL REFERENCES Performers(performer_id),
		album_id INTEGER NOT NULL REFERENCES Albums(album_id),
		CONSTRAINT pk PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS GenresPerformers (
		performer_id INTEGER NOT NULL REFERENCES Performers(performer_id),
		genre_id INTEGER NOT NULL REFERENCES Genres(genre_id),
		CONSTRAINT pk PRIMARY KEY (performer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
		collection_id INTEGER NOT NULL REFERENCES Collection(collection_id),
		track_id INTEGER NOT NULL REFERENCES Tracks(track_id),
		CONSTRAINT pk PRIMARY KEY (collection_id, track_id)
);