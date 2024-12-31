import Casilla from "./Casilla";
import { TURNS } from "../variables";

function Win({ children, turnoActual, action, isWin }) {
  return (
    <>
      <section className={`win win-${isWin ? "on" : "off "}`}>
        <span>{children}</span>
        <Casilla>{turnoActual === TURNS.O ? TURNS.X : TURNS.O}</Casilla>
        <button onClick={action}>Reiniciar Juego</button>
      </section>
    </>
  );
}

export default Win;
