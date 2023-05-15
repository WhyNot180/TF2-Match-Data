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
  ('L''etranger'), ('Stock Watch'), ('Stock Knife'), 
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
  weapon_id integer,
  CONSTRAINT fk_weapon_id FOREIGN KEY(weapon_id) REFERENCES weapons(id).
  PRIMARY KEY (id)
);

INSERT INTO loadout (class_id, primary_weapon_id, secondary_weapon_id, melee_id) VALUES
  (9, 1), (9, 2), (9, 3), 
  (6, 4), (6, 5), (6, 6), 
  (4, 7), (4, 8), (4, 9), 
  (1, 10), (1, 11), (1, 12), 
  (5, 13), (5, 14), (5, 15), 
  (7, 16), (7, 17), (7, 18)
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

CREATE TABLE statistics (
  id serial,
  kills integer,
  deaths integer,
  assists integer,
  backstabs integer,
  damage integer,
  healing integer,
  support integer,
  ubers integer,
  destruction integer,
  captures integer,
  defenses integer,
  dominations integer,
  revenges integer,
  bonus integer,
  points integer,
  wins integer,
  rounds integer,
  PRIMARY KEY (id)
);

INSERT 