CREATE DATABASE partida;

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  game_date TIMESTAMP NOT NULL,
  jugador_1 BOOLEAN NOT NULL,
  jugador_2 BOOLEAN NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INTEGER,
    password_player VARCHAR(255)
);
