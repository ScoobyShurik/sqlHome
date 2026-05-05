CREATE TABLE public.jenre (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	name varchar NOT NULL,
	CONSTRAINT jenre_pk PRIMARY KEY (id)
);

CREATE TABLE public.singers (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	"name" varchar NOT NULL,
	jenre int NOT NULL,
	CONSTRAINT singer_pk PRIMARY KEY (id),
	CONSTRAINT singer_jenres_fk FOREIGN KEY (jenre) REFERENCES public.jenre(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.album (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	"name" varchar NOT NULL,
	singer int NOT NULL,
	"year" int NOT NULL,
	CONSTRAINT album_pk PRIMARY KEY (id),
	CONSTRAINT album_singers_fk FOREIGN KEY (singer) REFERENCES public.singers(id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE public.track (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	"name" varchar NOT NULL,
	duration time NULL,
	album int NOT NULL,
	CONSTRAINT track_pk PRIMARY KEY (id),
	CONSTRAINT track_album_fk FOREIGN KEY (album) REFERENCES public.album(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.collection (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	"year" int NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT collection_pk PRIMARY KEY (id)
);


CREATE TABLE public.track_collection (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	track int NOT NULL,
	collection int NOT NULL,
	CONSTRAINT track_collection_pk PRIMARY KEY (id),
	CONSTRAINT track_collection_track_fk FOREIGN KEY (track) REFERENCES public.track(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT track_collection_collection_fk FOREIGN KEY (collection) REFERENCES public.collection(id) ON DELETE CASCADE ON UPDATE CASCADE
);


ALTER TABLE public.album DROP CONSTRAINT album_singers_fk;
ALTER TABLE public.album DROP COLUMN singer;

CREATE TABLE public.album_singer (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	album int NOT NULL,
	singer int NOT NULL,
	CONSTRAINT album_singer_pk PRIMARY KEY (id),
	CONSTRAINT album_singer_album_fk FOREIGN KEY (album) REFERENCES public.album(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT album_singer_singers_fk FOREIGN KEY (singer) REFERENCES public.singers(id)
);

ALTER TABLE public.singers DROP CONSTRAINT singers_jenre_fk;
ALTER TABLE public.singers DROP COLUMN jenre;


CREATE TABLE public.jenres_singers (
	id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	singer int NULL,
	jenre int NULL,
	CONSTRAINT newtable_pk PRIMARY KEY (id),
	CONSTRAINT newtable_jenre_fk FOREIGN KEY (jenre) REFERENCES public.jenre(id),
	CONSTRAINT newtable_singers_fk FOREIGN KEY (singer) REFERENCES public.singers(id)
);

