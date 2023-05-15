CREATE TABLE game_session (
  id serial,
  day date,
  username varchar,
  PRIMARY KEY (id)
);

INSERT INTO game_session (day, username) VALUES 
('2023-05-14', 'Whynot180'), ('2023-05-14', 'Domlightning')
;

CREATE TABLE weapons (
  id serial,
  weapon varchar,
  PRIMARY KEY (id)
);

INSERT INTO weapons (weapon) VALUES
  ('L''etranger'), ('Stock Knife'), ('Stock Watch'),
  ('Panic Attack'), ('Stock Pistol'), ('Gunslinger'),
  ('The Bootlegger'), ('Chargin'' targe'), ('The Half-Zatoichi'),
  ('Stock Scatter Gun'), ('Pretty Boy''s Pocket Pistol'), ('Wrap Assassin'),
  ('Tomislav'), ('The Second Banana'), ('Stock Fists'),
  ('Crusader''s Crossbow'), ('The Quick Fix'), ('The Ubersaw')
;

CREATE TABLE classes (
  id serial,
  class varchar,
  PRIMARY KEY (id)
);

INSERT INTO classes (class) VALUES 
  ('Scout'), ('Soldier'), ('Pyro'),
  ('Demoman'), ('Heavy'), ('Engineer'),
  ('Medic'), ('Sniper'), ('Spy')
;

CREATE TABLE loadout (
  id serial,
  class_id integer,
  primary_weapon_id integer,
  secondary_weapon_id integer,
  melee_id integer,
  CONSTRAINT fk_primary_weapon_id FOREIGN KEY(primary_weapon_id) REFERENCES weapons(id),
  CONSTRAINT fk_secondary_weapon_id FOREIGN KEY(secondary_weapon_id) REFERENCES weapons(id),
  CONSTRAINT fk_melee_weapon_id FOREIGN KEY(melee_id) REFERENCES weapons(id),
  PRIMARY KEY (id)
);

INSERT INTO loadout (class_id, primary_weapon_id, secondary_weapon_id, melee_id) VALUES
  (9, 1, 3, 2), (6, 4, 5, 6), (4, 7, 8, 9), 
  (1, 10, 11, 12), (5, 13, 14, 15), (7, 16, 17, 18)
  
;

CREATE TABLE gamemodes (
  id serial,
  gamemode varchar,
  PRIMARY KEY (id)
);

INSERT INTO gamemodes (gamemode) VALUES
  ('King of the Hill'), ('Payload')
;

CREATE TABLE maps (
  id serial,
  map varchar,
  gamemode_id integer,
  CONSTRAINT fk_gamemode_id FOREIGN KEY(gamemode_id) REFERENCES gamemodes(id),
  PRIMARY KEY (id)
);

INSERT INTO maps (map, gamemode_id) VALUES
('Harvest', 1), ('Thunder Mountain', 2)
;