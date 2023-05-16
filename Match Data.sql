CREATE TABLE game_session (
  id serial,
  day date,
  username varchar,
  PRIMARY KEY (id)
);

INSERT INTO game_session (day, username) VALUES 
  ('2023-05-14', 'Whynot180'), ('2023-05-14', 'Domlightning'),
  ('2023-05-15', 'Whynot180'), ('2023-05-15', 'Domlightning')
;

CREATE TABLE weapons (
  weapon varchar
);

CREATE TABLE primary_weapons (id serial, PRIMARY KEY (id)) INHERITS (weapons);
CREATE TABLE secondary_weapons (id serial, PRIMARY KEY (id)) INHERITS (weapons);
CREATE TABLE melee_weapons (id serial, PRIMARY KEY (id)) INHERITS (weapons);

INSERT INTO primary_weapons (weapon) VALUES
  ('L''etranger'), ('Panic Attack'), ('The Bootlegger'),
  ('Stock Scatter Gun'), ('Tomislav'), ('Crusader''s Crossbow'), 
  ('Stock Rocket Launcher'), ('The Degreaser')
;
INSERT INTO secondary_weapons (weapon) VALUES
  ('Stock Watch'), ('Stock Pistol'), ('Chargin'' targe'), 
  ('Pretty Boy''s Pocket Pistol'), ('The Second Banana'), ('The Quick Fix'), 
  ('The Detonator'), ('Panic Attack')
;
INSERT INTO melee_weapons (weapon) VALUES
  ('Stock Knife'), ('Gunslinger'), ('The Half-Zatoichi'), 
  ('Wrap Assassin'), ('Stock Fists'), ('The Ubersaw'),
  ('Disciplinary Action'), ('The Powerjack')
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
  melee_weapon_id integer,
  CONSTRAINT fk_primary_weapon_id FOREIGN KEY(primary_weapon_id) REFERENCES primary_weapons(id),
  CONSTRAINT fk_secondary_weapon_id FOREIGN KEY(secondary_weapon_id) REFERENCES secondary_weapons(id),
  CONSTRAINT fk_melee_weapon_id FOREIGN KEY(melee_weapon_id) REFERENCES melee_weapons(id),
  PRIMARY KEY (id)
);

INSERT INTO loadout (class_id, primary_weapon_id, secondary_weapon_id, melee_weapon_id) VALUES
  (9, 1, 1, 1), (6, 2, 2, 2), (4, 3, 3, 3), 
  (1, 4, 4, 4), (5, 5, 5, 5), (7, 6, 6, 6), 
  (2, 7, 8, 7), (3, 8, 7, 8)
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
  ('Harvest', 1), ('Thunder Mountain', 2), ('Bread Space', 2), 
  ('Borneo', 2)
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