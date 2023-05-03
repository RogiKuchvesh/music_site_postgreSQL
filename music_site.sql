CREATE TABLE IF NOT EXISTS Ganres (
    ganre_id SERIAL PRIMARY KEY,
	name_ganre VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Performers (
    performer_id SERIAL PRIMARY KEY,
	name_performer VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS GenresPerformers (
	ganre_id INTEGER REFERENCES Ganres(ganre_id),
	performer_id INTEGER REFERENCES Performers(performer_id),
	CONSTRAINT GenPer PRIMARY KEY (ganre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS Albums (
    album_id SERIAL PRIMARY KEY,
	name_album VARCHAR(40) NOT NULL,
    year_release_album INTEGER
);

CREATE TABLE IF NOT EXISTS PerformersAlbums (
	performer_id INTEGER REFERENCES Performers(performer_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT PerAlb PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Songs (
    song_id SERIAL PRIMARY KEY,
	name_song VARCHAR(40) NOT NULL,
    duration_song INTEGER NOT NULL CHECK (duration_song <= 1600),
    album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL PRIMARY KEY,
	name_collection VARCHAR(40) NOT NULL UNIQUE,
    year_collection INTEGER NOT NULL CHECK (year_collection >= 1900)
);

CREATE TABLE IF NOT EXISTS CollectionsSongs (
	song_id INTEGER REFERENCES Songs(song_id),
	collection_id INTEGER REFERENCES Collections(collection_id),
	CONSTRAINT ColSon PRIMARY KEY (song_id, collection_id)
);