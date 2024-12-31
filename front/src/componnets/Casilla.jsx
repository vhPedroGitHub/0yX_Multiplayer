function Casilla({ children, numeroCasilla, isTurn, onAction }) {
  return (
    <>
      <div
        className={`cs-${numeroCasilla} cs cs-${isTurn ? "on" : "off"}`}
        onClick={() => onAction(numeroCasilla)}
      >
        {children}
      </div>
    </>
  );
}

export default Casilla;
