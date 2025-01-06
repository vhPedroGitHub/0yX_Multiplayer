import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Casilla from "./Casilla";
import Empate from "./Empate";
import Win from "./Win";
import { TURNS } from "../variables";
import { ip_server_flask } from '../variables';
import { detectEmpate, detectWinner } from "../logic";
import useSearchPlayer from './customHooks/useSearchPlayer';
import { io } from 'socket.io-client';

const Multiplayer_Game = ({socket, onlinePlayer}) => {
  const [turno, setTurno] = useState("");
  const {isReady, setIsReady, player_1, player_2} = useSearchPlayer(socket, onlinePlayer, setTurno);
  return (
    <>
      {isReady && <Game player_1={player_1} player_2={player_2} turno={turno} socket={socket}/>}
      {!isReady && <h1>Esperando a que se una otro jugador...</h1>}
    </>
  );
};

const Game = ({player_1, player_2, turno, socket}) => {
  const [turnoActual, setturnoActual] = useState(TURNS.O);
  const [listCasillas, setlistCasillas] = useState(Array(9).fill(null));
  const [win, setWin] = useState(false);
  const [empate, setEmpate] = useState(false);
  
  let modal;

  useEffect(() => {
    // escuchamos el evento de que el otro jugador ha jugado
    socket.on('listen_player_played', (data) => {
      console.log(data);
      setturnoActual(data.turno);
      setlistCasillas(data.listCasillas);
      if (data.isWin) {
        setWin(true);
      } else if (data.isEmpate) {
        setEmpate(true);
      }
    });

    // Limpieza al desmontar el componente
    return () => {
        socket.off('listen_player_played'); // Desactiva el listener
    };
  }, []); // El array vacío asegura que esto se ejecute solo una vez al montar

  const handleClick = async (index) => {
    if (listCasillas[index] != null || win || turno != turnoActual) return;

    const turnoAJugar = turnoActual === TURNS.O ? TURNS.X : TURNS.O 
    const newListaCasillas = [...listCasillas];
    newListaCasillas[index] = turno;
    const isWin = detectWinner(newListaCasillas, turnoActual);
    const isEmpate = detectEmpate(newListaCasillas);

    // emitimos el evento de que hemos jugado
    socket.emit('player_played', { room: player_1, listCasillas: newListaCasillas, 
                                  turno: turnoAJugar, isWin: isWin, isEmpate: isEmpate });
  };

  const resetGame = () => {
    setlistCasillas(Array(9).fill(null));
    setturnoActual(TURNS.O);
    setWin(false);
    setEmpate(false);
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
          <p>{player_1} (O)</p>
          <p>{player_2} (X)</p>
        </div>
      </div>
    </>
  );
}

export default Multiplayer_Game;