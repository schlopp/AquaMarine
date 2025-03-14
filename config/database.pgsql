CREATE TABLE IF NOT EXISTS guild_settings(
    guild_id BIGINT PRIMARY KEY,
    prefix TEXT
);


CREATE TABLE IF NOT EXISTS user_settings(
    user_id BIGINT PRIMARY KEY
);


CREATE TABLE IF NOT EXISTS role_list(
    guild_id BIGINT,
    role_id BIGINT,
    key TEXT,
    value TEXT,
    PRIMARY KEY (guild_id, role_id, key)
);


CREATE TABLE IF NOT EXISTS channel_list(
    guild_id BIGINT,
    channel_id BIGINT,
    key TEXT,
    value TEXT,
    PRIMARY KEY (guild_id, channel_id, key)
);

CREATE TABLE IF NOT EXISTS user_balance (
    user_id BIGINT,
    balance INTEGER NOT NULL DEFAULT 0,
    doubloon INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS user_fish_inventory (
    user_id BIGINT,
    fish TEXT,
    fish_name TEXT,
    tank_fish TEXT NOT NULL DEFAULT '',
    fish_level INT NOT NULL DEFAULT 1,
    fish_xp INT NOT NULL DEFAULT 0,
    fish_xp_max INT NOT NULL DEFAULT 25,
    fish_size TEXT,
    fish_remove_time TIMESTAMP,
    fish_entertain_time TIMESTAMP,
    fish_feed_time TIMESTAMP,
    fish_alive BOOLEAN DEFAULT TRUE,
    death_time TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_item_inventory (
    user_id BIGINT,
    cfb INT NOT NULL DEFAULT 0,
    ufb INT NOT NULL DEFAULT 0,
    rfb INT NOT NULL DEFAULT 0,
    efb INT NOT NULL DEFAULT 0,
    lfb INT NOT NULL DEFAULT 0,
    flakes INT NOT NULL DEFAULT 0,
    revival INT NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
);



CREATE TABLE IF NOT EXISTS user_tank_inventory (
    user_id BIGINT,
    tank BOOLEAN[] NOT NULL DEFAULT '{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE}',
    tank_type TEXT[] NOT NULL DEFAULT '{"", "", "", "", "", "", "", "", "", ""}',
    tank_name TEXT[] NOT NULL DEFAULT '{"", "", "", "", "", "", "", "", "", ""}',
    fish_room INT[] NOT NULL DEFAULT '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}',
    xl_fish_room INT[] NOT NULL DEFAULT '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}',
    tiny_fish_room INT[] NOT NULL DEFAULT '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}',
    tank_theme TEXT[] NOT NULL DEFAULT '{"", "", "", "", "", "", "", "", "", ""}',
    tank_clean_time TIMESTAMP[] NOT NULL DEFAULT '{NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL}',
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS user_upgrades (
    user_id BIGINT,
    rod_upgrade INT NOT NULL DEFAULT 1,
    bait_upgrade INT NOT NULL DEFAULT 1,
    weight_upgrade INT NOT NULL DEFAULT 1,
    line_upgrade INT NOT NULL DEFAULT 1,
    lure_upgrade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS user_achievements_milestones (
    user_id BIGINT,
    times_entertained_milestone INT NOT NULL DEFAULT 5,
    times_fed_milestone INT NOT NULL DEFAULT 5,
    times_cleaned_milestone INT NOT NULL DEFAULT 5,
    times_caught_milestone INT NOT NULL DEFAULT 5,
    times_gambled_milestone INT NOT NULL DEFAULT 5,
    money_gained_milestone INT NOT NULL DEFAULT 100,
    tanks_owned_milestone INT NOT NULL DEFAULT 1,
    times_entertained_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    times_fed_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    times_cleaned_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    times_caught_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    times_gambled_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    money_gained_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    tanks_owned_milestone_done BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS user_achievements (
    user_id BIGINT,
    times_entertained INT NOT NULL DEFAULT 0,
    times_fed INT NOT NULL DEFAULT 0,
    times_cleaned INT NOT NULL DEFAULT 0,
    times_caught INT NOT NULL DEFAULT 0,
    times_gambled INT NOT NULL DEFAULT 0,
    money_gained INT NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS command_counter(
    command_name TEXT PRIMARY KEY,
    count INTEGER DEFAULT 0
);