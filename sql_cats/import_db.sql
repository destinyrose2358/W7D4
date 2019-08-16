DROP TABLE cats, toys, cattoys;

CREATE TABLE cats (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    color TEXT NOT NULL,
    breed TEXT NOT NULL
);

CREATE TABLE toys (
    id INT PRIMARY KEY,
    price FLOAT NOT NULL,
    color TEXT NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE cattoys (
    id INT PRIMARY KEY,
    cat_id INT REFERENCES cats(id),
    toy_id INT REFERENCES toys(id)
);

INSERT INTO
    cats (name, color, breed)
VALUES
    ('Spot', 'black', 'Manx'),
    ('Clohie', 'white', 'Tabby'),
    ('Zoey', 'tuxedo', 'Scottish Fold'),
    ('Steve', 'brown', 'Manx'),
    ('Butter', 'cream', 'Tabby');

INSERT INTO
    toys (price, color, name)
VALUES
    (5.00, 'black', 'String'),
    (10.00, 'white', 'Ball On Stick'),
    (1.00, 'tuxedo', 'Feather Boa'),
    (13.00, 'brown', 'Fake Mice'),
    (29.95, 'cream', 'Scratch Post');

INSERT INTO
    cattoys (cat_id, toy_id)
VALUES 
    ((SELECT id FROM cats WHERE name = 'Spot'), (SELECT id FROM toys WHERE name = 'Ball On Stick')),
    ((SELECT id FROM cats WHERE name = 'Zoey'), (SELECT id FROM toys WHERE name = 'Feather Boa')),
    ((SELECT id FROM cats WHERE name = 'Zoey'), (SELECT id FROM toys WHERE name = 'Fake Mice')),
    ((SELECT id FROM cats WHERE name = 'Butter'), (SELECT id FROM toys WHERE name = 'String')),
    ((SELECT id FROM cats WHERE name = 'Steve'), (SELECT id FROM toys WHERE name = 'Ball On Stick'));

