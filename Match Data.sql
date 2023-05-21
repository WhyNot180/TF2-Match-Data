CREATE TABLE usernames (
  id serial,
  username varchar,
  PRIMARY KEY (id)
);

CREATE UNIQUE INDEX username_index ON usernames (username);

INSERT INTO usernames (username) VALUES
  ('Whynot180'), ('Domlightning')
;

CREATE TABLE sessions (
  id serial,
  day date,
  username_id integer,
  CONSTRAINT fk_username_id FOREIGN KEY (username_id) REFERENCES usernames(id),
  PRIMARY KEY (id)
);

INSERT INTO sessions (day, username_id) VALUES 
  ('2023-05-14', 1), ('2023-05-14', 2),
  ('2023-05-15', 1), ('2023-05-15', 2),
  ('2023-05-16', 2)
;

CREATE TABLE weapons (
  weapon varchar
);

CREATE TABLE primary_weapons (id serial, PRIMARY KEY (id)) INHERITS (weapons);
CREATE TABLE secondary_weapons (id serial, PRIMARY KEY (id)) INHERITS (weapons);
CREATE TABLE melee_weapons (id serial, PRIMARY KEY (id)) INHERITS (weapons);

CREATE UNIQUE INDEX p_weapons_index ON primary_weapons (weapon);
CREATE UNIQUE INDEX s_weapons_index ON secondary_weapons (weapon);
CREATE UNIQUE INDEX m_weapons_index ON melee_weapons (weapon);

INSERT INTO primary_weapons (weapon) VALUES
  ('L''etranger'), ('Panic Attack'), ('The Bootlegger'),
  ('Stock Scattergun'), ('Tomislav'), ('Crusader''s Crossbow'), 
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
  ('The Disciplinary Action'), ('The Powerjack')
;

CREATE TABLE classes (
  id serial,
  class varchar,
  PRIMARY KEY (id)
);

CREATE UNIQUE INDEX class_index ON classes (class);

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

CREATE UNIQUE INDEX gamemode_index ON gamemodes (gamemode);

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

CREATE UNIQUE INDEX map_index ON maps (map);

INSERT INTO maps (map, gamemode_id) VALUES
  ('Harvest', 1), ('Thunder Mountain', 2), ('Bread Space', 2), 
  ('Borneo', 2), ('Highpass', 1)
;

CREATE TABLE statistics (
  id serial,
  kills integer,
  deaths integer,
  assists integer,
  backstabs integer DEFAULT 0,
  damage integer,
  healing integer,
  support integer,
  ubers integer DEFAULT 0,
  destruction integer,
  captures integer,
  defenses integer,
  dominations integer,
  revenges integer,
  bonus integer,
  points integer,
  PRIMARY KEY (id)
);

INSERT INTO statistics (kills, deaths, assists, backstabs, damage, healing, support, ubers, destruction, 
                        captures, defenses, dominations, revenges, bonus, points) VALUES
  (5, 11, 1, 3, 1002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9), (32, 17, 16, 0, 7249, 818, 0, 0, 0, 2, 2, 3, 0, 0, 48),
  (19, 15, 4, 0, 2479, 0, 0, 0, 2, 2, 1, 1, 1, 0, 32), (30, 18, 5, 0, 5767, 77, 0, 0, 1, 4, 4, 4, 1, 0, 54),
  (27, 40, 27, 0, 11397, 530, 2525, 0, 13, 13, 4, 3, 4, 9, 114), (6, 29, 27, 0, 1515, 35300, 0, 21, 0, 6, 3, 1, 2, 0, 117),
  (15, 9, 4, 0, 4596, 0, 0, 0, 0, 2, 0, 0, 0, 0, 28), (2, 1, 7, 0, 394, 5335, 0, 0, 0, 0, 0, 0, 0, 0, 15),
  (5, 16, 3, 0, 1933, 0, 1250, 0, 0, 0, 0, 0, 0, 5, 14), (0, 10, 12, 0, 428, 5500, 0, 6, 0, 0, 0, 0, 0, 0, 14),
  (11, 4, 10, 0, 3663, 40, 0, 0, 0, 0, 1, 2, 0, 0, 31), (10, 2, 8, 0, 2320, 50, 0, 0, 1, 0, 1, 0, 0, 0, 19),
  (21, 8, 24, 0, 5454, 540, 0, 0, 1, 1, 1, 2, 0, 0, 45)
;

CREATE TABLE match (
  id serial,
  match integer,
  wins integer,
  rounds integer,
  PRIMARY KEY (id)
);

INSERT INTO match (match, wins, rounds) VALUES
  (1, 2, 3), (2, 1, 3), (3, 1, 2),
  (1, 2, 2), (2, 0, 2), (2, 1, 1),
  (3, 2, 2)
;

CREATE TABLE match_statistics (
  id serial,
  match_id integer,
  statistics_id integer,
  CONSTRAINT fk_statistics_id FOREIGN KEY(statistics_id) REFERENCES statistics(id),
  CONSTRAINT fk_match_id FOREIGN KEY(match_id) REFERENCES match(id),
  PRIMARY KEY (id)
);

INSERT INTO match_statistics (match_id, statistics_id) VALUES
  (1, 1), (1, 2), (2, 3), 
  (2, 4), (3, 5), (3, 6), 
  (4, 7), (4, 8), (5, 9), 
  (5, 10), (4, 11), (6, 12),
  (7, 13)
;

CREATE TABLE session_data (
  session_id integer,
  map_id integer,
  loadout_id integer,
  match_statistics_id integer,
  CONSTRAINT fk_session_id FOREIGN KEY(session_id) REFERENCES sessions(id),
  CONSTRAINT fk_map_id FOREIGN KEY(map_id) REFERENCES maps(id),
  CONSTRAINT fk_loadout_id FOREIGN KEY(loadout_id) REFERENCES loadout(id),
  CONSTRAINT fk_match_statistics_id FOREIGN KEY(match_statistics_id) REFERENCES match_statistics(id)
);

INSERT INTO session_data (session_id, map_id, loadout_id, match_statistics_id) VALUES
  (1, 1, 1, 1), (2, 1, 2, 2), 
  (1, 1, 3, 3), (2, 1, 4, 4), 
  (1, 2, 5, 5), (2, 2, 6, 6), 
  (3, 3, 7, 7), (4, 3, 6, 8),
  (3, 4, 8, 9), (4, 4, 6, 10),
  (5, 5, 2, 11), (5, 1, 4, 12),
  (5, 1, 2, 13)
;

# To be used with weighted_avg aggregate function
CREATE FUNCTION weighted_avg_accum(
  "Previous" numeric[],
  "Thisdata" numeric,
  "Thisweight" numeric)
  RETURNS numeric[] 
  LANGUAGE plpgsql
  AS '
    BEGIN
      RETURN ARRAY["Previous"[1] + ("Thisdata" * "Thisweight"), "Previous"[2] + "Thisweight"];
    END;
  '
;

CREATE FUNCTION weighted_avg_final(
  "Weight_and_avg" numeric[])
  RETURNS numeric
  LANGUAGE plpgsql
  AS '
    BEGIN
      RETURN "Weight_and_avg"[1] / "Weight_and_avg"[2];
    END;
  '
;

CREATE AGGREGATE weighted_avg(data numeric, weight numeric) (
  INITCOND = '{0,0}',
  SFUNC = weighted_avg_accum,
  STYPE = numeric[],
  FINALFUNC = weighted_avg_final,
  FINALFUNC_MODIFY = READ_ONLY
);

# Very unlikely for someone to ever want ALL of this in one query
# Should only ever be used when filtering or aggregating many kinds of data
CREATE VIEW joined_session_data AS
  select usernames.username, sessions.day, maps.map, gamemodes.gamemode, classes.class, 
  primary_weapons.weapon as primary_weapon, secondary_weapons.weapon as secondary_weapon, melee_weapons.weapon as melee_weapon,
  match.match, match.rounds, match.wins, 
  statistics.kills, statistics.deaths, statistics.assists, statistics.backstabs, statistics.damage, 
  statistics.healing, statistics.support, statistics.ubers, statistics.destruction, statistics.captures, 
  statistics.defenses, statistics.dominations, statistics.revenges, statistics.bonus, statistics.points from session_data
  join sessions on sessions.id = session_data.session_id
    join usernames on sessions.username_id = usernames.id
  join maps on maps.id = session_data.map_id
    join gamemodes on maps.gamemode_id = gamemodes.id
  join loadout on loadout.id = session_data.loadout_id
    join classes on loadout.class_id = classes.id
    join primary_weapons on loadout.primary_weapon_id = primary_weapons.id
    join secondary_weapons on loadout.secondary_weapon_id = secondary_weapons.id
    join melee_weapons on loadout.melee_weapon_id = melee_weapons.id
  join match_statistics on match_statistics.id = session_data.match_statistics_id
    join match on match_statistics.match_id = match.id
    join statistics on match_statistics.statistics_id = statistics.id
;

# This is annoying, but I feel like making functions to make it slightly better would end up being even more annoying seeing as each table has different column names
CREATE FUNCTION maintain_integrity()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS
  '
    DECLARE
      id_username integer;
      id_session integer;
      id_gamemode integer;
      id_map integer;
      id_primary_weapon integer;
      id_secondary_weapon integer;
      id_melee_weapon integer;
      id_class integer;
      id_loadout integer;
      id_statistics integer;
      id_match integer;
      id_match_statistics integer;
    BEGIN 
      IF NOT EXISTS (SELECT FROM usernames WHERE username LIKE NEW.username) THEN
        INSERT INTO usernames (username) VALUES (NEW.username);
      END IF;
      
      SELECT id FROM usernames WHERE username LIKE NEW.username INTO id_username;
      
      IF NOT EXISTS (SELECT FROM sessions WHERE sessions.username_id = id_username AND sessions.day = NEW.day) THEN
        INSERT INTO sessions (day, username_id) VALUES (NEW.day, id_username);
      END IF;
      
      SELECT id FROM sessions WHERE username_id = id_username AND sessions.day = NEW.day INTO id_session;
      
      IF NOT EXISTS (SELECT FROM gamemodes WHERE gamemode LIKE NEW.gamemode) THEN
        INSERT INTO gamemodes (gamemode) VALUES (NEW.gamemode);
      END IF;
      
      SELECT id FROM gamemodes WHERE gamemode LIKE NEW.gamemode INTO id_gamemode;
      
      IF NOT EXISTS (SELECT FROM maps WHERE map LIKE NEW.map AND gamemode_id = id_gamemode) THEN
        INSERT INTO maps (map, gamemode_id) VALUES (NEW.map, id_gamemode);
      END IF;
      
      SELECT id FROM maps WHERE map LIKE NEW.map AND gamemode_id = id_gamemode INTO id_map;
      
      IF NOT EXISTS (SELECT FROM primary_weapons WHERE weapon LIKE NEW.primary_weapon) THEN
        INSERT INTO primary_weapons (weapon) VALUES (NEW.primary_weapon);
      END IF;
      
      SELECT id FROM primary_weapons WHERE weapon LIKE NEW.primary_weapon INTO id_primary_weapon;
      
      IF NOT EXISTS (SELECT FROM secondary_weapons WHERE weapon LIKE NEW.secondary_weapon) THEN
        INSERT INTO secondary_weapons (weapon) VALUES (NEW.secondary_weapon);
      END IF;
      
      SELECT id FROM secondary_weapons WHERE weapon LIKE NEW.secondary_weapon INTO id_secondary_weapon;
      
      IF NOT EXISTS (SELECT FROM melee_weapons WHERE weapon LIKE NEW.melee_weapon) THEN
        INSERT INTO melee_weapons (weapon) VALUES (NEW.melee_weapon);
      END IF;
      
      SELECT id FROM melee_weapons WHERE weapon LIKE NEW.melee_weapon INTO id_melee_weapon;
      
      SELECT id FROM classes WHERE class LIKE NEW.class INTO id_class;
      
      IF NOT EXISTS (SELECT FROM loadout WHERE class_id = id_class AND primary_weapon_id = id_primary_weapon AND secondary_weapon_id = id_secondary_weapon AND melee_weapon_id = id_melee_weapon) THEN
        INSERT INTO loadout (class_id, primary_weapon_id, secondary_weapon_id, melee_weapon_id) VALUES (id_class, id_primary_weapon, id_secondary_weapon, id_melee_weapon);
      END IF;
      
      SELECT id FROM loadout WHERE class_id = id_class AND primary_weapon_id = id_primary_weapon AND secondary_weapon_id = id_secondary_weapon AND melee_weapon_id = id_melee_weapon INTO id_loadout;
      
      INSERT INTO statistics (kills, deaths, assists, backstabs, damage, healing, support, ubers, destruction, 
                              captures, defenses, dominations, revenges, bonus, points) VALUES
        (NEW.kills, NEW.deaths, NEW.assists, NEW.backstabs, NEW.damage, NEW.healing, NEW.support, NEW.ubers, NEW.destruction, New.captures, NEW.defenses, NEW.dominations, NEW.revenges, NEW.bonus, NEW.points);
      
      SELECT id FROM statistics WHERE kills = NEW.kills AND deaths = NEW.deaths AND assists = NEW.assists AND backstabs = NEW.backstabs AND damage = NEW.damage AND healing = NEW.healing AND support = NEW.support AND ubers = NEW.ubers AND destruction = NEW.destruction AND captures = NEW.captures AND dominations = NEW.dominations AND revenges = NEW.revenges AND bonus = NEW.bonus AND points = NEW.points INTO id_statistics;
      
      IF NOT EXISTS (SELECT FROM match WHERE match = NEW.match AND wins = NEW.wins AND rounds = NEW.rounds) THEN
        INSERT INTO match (match, wins, rounds) VALUES (NEW.match, NEW.wins, NEW.rounds);
      END IF;
      
      SELECT id FROM match WHERE match = NEW.match AND wins = NEW.wins AND rounds = NEW.rounds INTO id_match;
      
      IF NOT EXISTS (SELECT FROM match_statistics WHERE match_id = id_match AND statistics_id = id_statistics) THEN
        INSERT INTO match_statistics (match_id, statistics_id) VALUES (id_match, id_statistics);
      END IF;
      
      SELECT id FROM match_statistics WHERE match_id = id_match AND statistics_id = id_statistics INTO id_match_statistics;
      
      IF NOT EXISTS (SELECT FROM session_data WHERE session_id = id_session AND map_id = id_map AND loadout_id = id_loadout AND match_statistics_id = id_match_statistics) THEN
        INSERT INTO session_data (session_id, map_id, loadout_id, match_statistics_id) VALUES (id_session, id_map, id_loadout, id_match_statistics);
      END IF;
      RETURN NEW;
    END;
  '
;

# This makes it *so* much easier to actually insert data; no need to deal with a million ids
CREATE TRIGGER insert_session_data
  INSTEAD OF INSERT
  ON joined_session_data
  FOR EACH ROW
  EXECUTE PROCEDURE maintain_integrity()
;

# This looks ugly, but its probably the easiest way to actually insert new data without dealing with ids
INSERT INTO joined_session_data (username, day, gamemode, map, class, primary_weapon, secondary_weapon, melee_weapon, match, wins, rounds, kills, deaths, assists, backstabs, damage, healing, support, ubers, destruction, captures, defenses, dominations, revenges, bonus, points) VALUES 
  ('XyrusgamerPlays', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Scout', 'Baby Face''s Blaster', 'Winger', 'Candy Cane', 1, 3, 3, 11, 6, 6, 0, 1945, 0, 0, 0, 1, 0, 1, 0, 0, 0, 19),
  ('XyrusgamerPlays', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Engineer', 'Stock Shotgun', 'The Wrangler', 'The Jag', 2, 0, 1, 10, 5, 0, 0, 2447, 325, 0, 0, 0, 0, 0, 0, 0, 0, 18),
  ('XyrusgamerPlays', '2023-05-20', 'Attack/Defend', 'Mossrock', 'Soldier', 'The Air Strike', 'The Gunboats', 'The Escape Plan', 3, 0, 2, 2, 9, 0, 0, 1270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9),
  ('XyrusgamerPlays', '2023-05-20', 'Payload', 'Gold Rush', 'Sniper', 'The Hitman''s Heatmaker', 'Stock SMG', 'Stock Kukri', 4, 0, 1, 11, 6, 1, 0, 1937, 0, 0, 0, 0, 0, 2, 0, 0, 0, 19),
  ('XyrusgamerPlays', '2023-05-20', 'Payload', 'Barnblitz', 'Scout', 'The Soda Popper', 'The Flying Guillotine', 'The Boston Basher', 5, 1, 2, 9, 36, 7, 0, 4257, 0, 0, 0, 1, 0, 4, 0, 1, 0, 25),
  ('XyrusgamerPlays', '2023-05-20', 'Payload', 'Borneo', 'Spy', 'L''etranger', 'Stock Watch', 'The Big Earner', 6, 2, 2, 12, 23, 0, 12, 2490, 0, 0, 0, 1, 0, 2, 0, 0, 0, 31),
  ('Domlightning', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Medic', 'Crusader''s Crossbow', 'The Quick Fix', 'The Ubersaw', 1, 3, 3, 6, 6, 8, 0, 517, 7340, 0, 5, 0, 1, 0, 0, 0, 0, 29),
  ('Domlightning', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Engineer', 'Panic Attack', 'Stock Pistol', 'Gunslinger', 2, 0, 1, 20, 11, 11, 0, 3910, 130, 0, 0, 1, 0, 1, 4, 0, 0, 32),
  ('Domlightning', '2023-05-20', 'Attack/Defend', 'Mossrock', 'Medic', 'Crusader''s Crossbow', 'The Quick Fix', 'The Ubersaw', 3, 0, 2, 7, 10, 3, 0, 1060, 7520, 0, 3, 0, 0, 0, 0, 0, 0, 24),
  ('Domlightning', '2023-05-20', 'Payload', 'Gold Rush', 'Engineer', 'Panic Attack', 'Stock Pistol', 'Gunslinger', 4, 0, 1, 11, 8, 9, 0, 2952, 0, 0, 0, 0, 0, 1, 1, 0, 0, 20),
  ('Domlightning', '2023-05-20', 'Payload', 'Barnblitz', 'Engineer', 'Panic Attack', 'Stock Pistol', 'Gunslinger', 5, 2, 2, 28, 19, 17, 0, 7689, 810, 0, 0, 1, 1, 0, 4, 0, 0, 62),
  ('Ryry4766', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Soldier', 'Beggar''s Bazooka', 'The Concheror', 'The Disciplinary Action', 1, 3, 3, 13, 6, 2, 0, 2057, 0, 277, 0, 1, 2, 2, 0, 0, 0, 24),
  ('Ryry4766', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Engineer', 'Frontier Justice', 'Stock Pistol', 'The Eureka Effect', 2, 0, 1, 9, 5, 0, 0, 2842, 244, 0, 0, 0, 0, 0, 0, 0, 0, 22),
  ('Ryry4766', '2023-05-20', 'Attack/Defend', 'Mossrock', 'Scout', 'Baby Face''s Blaster', 'The Flying Guillotine', 'The Wrap Assassin', 3, 0, 2, 10, 20, 0, 0, 1708, 0, 0, 0, 0, 0, 1, 0, 1, 0, 14),
  ('Ryry4766', '2023-05-20', 'Payload', 'Gold Rush', 'Heavy', 'Tomislav', 'The Sandvich', 'The Eviction Notice', 4, 0, 1, 12, 8, 6, 0, 3667, 940, 325, 0, 1, 0, 0, 0, 0, 1, 20),
  ('Ryry4766', '2023-05-20', 'Payload', 'Barnblitz', 'Medic', 'Crusader''s Crossbow', 'The Quick Fix', 'The Amputator', 5, 2, 2, 0, 17, 33, 0, 110, 32900, 0, 18, 0, 1, 1, 2, 0, 0, 91),
  ('Ryry4766', '2023-05-20', 'Payload', 'Borneo', 'Sniper', 'The Sydney Sleeper', 'The Cleaner''s Carbine', 'The Bushwacka', 6, 2, 2, 8, 19, 3, 0, 3023, 0, 0, 0, 1, 0, 1, 0, 0, 0, 16),
  ('Whynot180', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Pyro', 'The Degreaser', 'Panic Attack', 'The Powerjack', 1, 3, 3, 14, 9, 7, 0, 2097, 0, 0, 0, 1, 1, 0, 0, 0, 0, 21),
  ('Whynot180', '2023-05-20', 'Attack/Defend', 'Mercenary Park', 'Engineer', 'Panic Attack', 'The Wrangler', 'The Jag', 2, 0, 1, 9, 9, 4, 0, 1697, 80, 0, 0, 0, 0, 1, 0, 0, 0, 14),
  ('Whynot180', '2023-05-20', 'Attack/Defend', 'Mossrock', 'Sniper', 'The Huntsman', 'Darwin''s Danger Shield', 'The Shahansha', 3, 0, 2, 4, 14, 2, 0, 2132, 0, 250, 0, 1, 0, 1, 0, 0, 1, 12),
  ('Whynot180', '2023-05-20', 'Payload', 'Gold Rush', 'Scout', 'Stock Scattergun', 'Winger', 'Stock Bat', 4, 0, 1, 8, 16, 2, 0, 1587, 0, 0, 0, 0, 0, 2, 0, 0, 0, 13),
  ('Whynot180', '2023-05-20', 'Payload', 'Barnblitz', 'Heavy', 'Tomislav', 'The Second Banana', 'Stock Fists', 5, 2, 2, 27, 30, 10, 0, 8181, 440, 1976, 0, 3, 5, 3, 1, 1, 7, 69),
  ('Whynot180', '2023-05-20', 'Payload', 'Borneo', 'Demoman', 'The Iron Bomber', 'Stickybomb Launcher', 'Bottle', 6, 2, 2, 16, 23, 5, 0, 4873, 0, 0, 0, 1, 1, 0, 0, 0, 0, 29)
;

# Queries

# Shows the weighted average points of each player
/*
  Points show general performance of a player in a match and this can therefore be used to show the 
  overall performance of a player (although this is not perfect and some matches 
  may include different levels of skills in the enemy and ally team)
*/
select username, weighted_avg(points, (1/rounds::NUMERIC)) as w_avg_points from joined_session_data
group by username
order by w_avg_points desc;

# Shows the overall performance throughout a session
# Uses weighted avg to show overall performance per match.
# Uses manual standard deviation (to account for weighted avg) to show outliers.
/*
  This can be show how a person improves (or worsens) throughout a session.
  For example, this could be used to show that people might have a sort of "warm up" and improve, or they may become more frustrated and worsen.
*/
select match.match, weighted_avg(statistics.points, (1/match.rounds::NUMERIC)) as w_avg_points, 
sqrt(sum(power(statistics.points - (
  select weighted_avg(statistics.points, (1/match.rounds::NUMERIC)) from match_statistics
  join match on match_statistics.match_id = match.id
  join statistics on match_statistics.statistics_id = statistics.id), 2))/count(statistics.points)) as stddev from match_statistics
join match on match_statistics.match_id = match.id
join statistics on match_statistics.statistics_id = statistics.id
group by match
order by match asc;

# Shows the weighted average kills per primary weapon of the scout
/*
  This can be used to show how effective a weapon is. This doesn't apply to every 
  scenario, however. This is because some weapons have special abilities or buffs,
  but it can help decide which weapon to pick if a player chooses to go for pure damage, 
  like one might do in Mann vs. Machine mode where hoardes of enemies and "boss" 
  enemies with large hp pools are involved.
*/
select primary_weapon, weighted_avg(damage, (1/rounds::NUMERIC)) as w_avg_damage 
from joined_session_data
where class = 'Scout'
group by primary_weapon
order by w_avg_damage desc;

# Shows the most played class per player
/*
  This can be used to find which class a player plays the most. This can be used to
  make assumptions on other statistics, such as how playing medic the most would 
  result in a much higher healing stat than other players.
*/
select username, mode() within group (order by class) as most_played_class from joined_session_data
group by username;