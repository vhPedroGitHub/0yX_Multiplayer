import { COMBINACIONES } from "./variables";

export const detectWinner = (casillasJugadas, turnoActual) => {
  for (const combinacion of COMBINACIONES) {
    const [a, b, c] = combinacion;

    if (
      casillasJugadas[a] === casillasJugadas[b] &&
      casillasJugadas[a] === casillasJugadas[c] &&
      casillasJugadas[a] === turnoActual
    )
      return true;
  }
  return false;
};

export const detectEmpate = (casillasJugadas) => {
  return casillasJugadas.every((casilla) => casilla != null) ? true : false;
};
