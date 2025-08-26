import { useState } from "react";

const Exercice1 = () => {

  const [nom, setNom] = useState("")
  const [prenom, setPrenom] = useState("")

  function handleChangeNom(event) {
    setNom(event.target.value)
  }

  function handleChangePrenom(event) {
    setPrenom(event.target.value)
  }

  return (
    <div>
      <h1 className="rouge">Exercice 1</h1>
      <hr />
      <input type="text" value={nom} onChange={handleChangeNom}/>
      <input type="text" value={prenom} onChange={handleChangePrenom}/>
      <br />
      Bonjour {prenom} {nom}
    </div>
  );
}

export default Exercice1;
