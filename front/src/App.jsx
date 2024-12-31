import React, { useState, useEffect } from 'react';
import axios from 'axios';
// importaciones
import "./App.css";
import Casilla from "./componnets/Casilla";
import Empate from "./componnets/Empate";
import Win from "./componnets/Win";
import { TURNS } from "./variables";
import { detectEmpate, detectWinner } from "./logic";

const App = () => {
  const [turnoActual, setturnoActual] = useState(TURNS.O);
  const [listCasillas, setlistCasillas] = useState(Array(9).fill(null));
  const [win, setWin] = useState(false);
  const [empate, setEmpate] = useState(false);
  const [stats, setStats] = useState({ jugador_1_wins: 0, jugador_2_wins: 0 });

  useEffect(() => {
    try {
      const game = JSON.parse(window.localStorage.getItem("partida"));
      setlistCasillas(game.jugadas);
      setturnoActual(game.turno);
      setWin(game.winner);
      console.log(game.winner);
    } catch {
      console.log();
    }

    // Fetch game stats
    const fetchStats = async () => {
      try {
        const response = await axios.get('http://localhost:5000/get_game_stats');
        setStats(response.data);
      } catch (err) {
        console.error('Error fetching game stats', err);
      }
    };

    fetchStats();
  }, []);

  let modal;

  const handleClick = async (index) => {
    if (listCasillas[index] != null || win) return;

    const turno = turnoActual === TURNS.O ? TURNS.X : TURNS.O;
    setturnoActual(turno);

    const newListaCasillas = [...listCasillas];
    newListaCasillas[index] = turnoActual;
    setlistCasillas(newListaCasillas);

    const iswin = detectWinner(newListaCasillas, turnoActual);

    setWin(iswin);
    setEmpate(detectEmpate(newListaCasillas));

    // guardamos la informacion de la partida actual en el localStorage
    const partida = {
      jugadas: newListaCasillas,
      turno: turno,
      winner: iswin,
    };

    window.localStorage.setItem("partida", JSON.stringify(partida));

    if (iswin || detectEmpate(newListaCasillas)) {
      const jugador1 = turnoActual === TURNS.O;
      const jugador2 = turnoActual === TURNS.X;

      try {
        await axios.post('http://localhost:5000/add_game', {
          jugador_1: jugador1,
          jugador_2: jugador2
        });

        // Fetch updated stats
        const response = await axios.get('http://localhost:5000/get_game_stats');
        setStats(response.data);
      } catch (err) {
        console.error('Error saving game to database', err);
      }
    }
  };

  const resetGame = () => {
    setlistCasillas(Array(9).fill(null));
    setturnoActual(TURNS.O);
    setWin(false);
    setEmpate(false);
    window.localStorage.removeItem("partida");
  };

  if (win) {
    modal = (
      <Win action={resetGame} isWin={win} turnoActual={turnoActual}>
        Ha ganado
      </Win>
    );
  } else {
    modal = (
      <Empate action={resetGame} isEmpate={empate}>
        {" "}
        Ha sido un empate{" "}
      </Empate>
    );
  }

  return (
    <>
      {modal}
      <div className="container">
        <h1>Tic Tac Toe</h1>
        <div className="juego">
          {listCasillas.map((casilla, index) => {
            return (
              <Casilla key={index} numeroCasilla={index} onAction={handleClick}>
                {casilla}
              </Casilla>
            );
          })}
        </div>
        <footer className="turnos">
          <Casilla isTurn={turnoActual == TURNS.X}>X</Casilla>
          <Casilla isTurn={turnoActual == TURNS.O}>O</Casilla>
        </footer>
        <div className="stats">
          <h3>Estadísticas de Partidas</h3>
          <p>Jugador 1 (O) - Partidas Ganadas: {stats.jugador_1_wins}</p>
          <p>Jugador 2 (X) - Partidas Ganadas: {stats.jugador_2_wins}</p>
        </div>
      </div>
    </>
  );
};

export default App;
