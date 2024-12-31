function Empate({ children, action, isEmpate }) {
  return (
    <>
      <section className={`win win-${isEmpate ? "on" : "off "}`}>
        <span>{children}</span>
        <button onClick={action}>Reiniciar Juego</button>
      </section>
    </>
  );
}

export default Empate;
