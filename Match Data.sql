CREATE TABLE game_session (
  id serial,
  day date,
  username varchar
);
INSERT INTO game_session (day, username) VALUES 
('2023-05-14', 'Whynot180')
;

CREATE TABLE loadout (
  id serial,
  class_id integer,
  primary_weapon_id integer,
  secondary_weapon_id integer,
  melee_id integer
);

CREATE TABLE classes (
  id serial,
  class varchar
);

INSERT INTO classes (class) VALUES 
	('Scout'), ('Soldier'), ('Pyro'),
	('Demoman'), ('Heavy'), ('Engineer'),
    ('Medic'), ('Sniper'), ('Spy')
;