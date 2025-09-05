import { useState } from "react";

const Exercice2 = () => {

  const [compteur, setCompteur] = useState(0);

  const handleClick = (evt) => {
    let tmp = compteur + 1;
    console.log(compteur)
    setCompteur(tmp)
    console.log(compteur)
  };
  

  return (
    <div>
      <h1 className="rouge">Exercice 2</h1>
      <hr />
      <button onClick={handleClick} >Clique moi !!! ({compteur})</button>
    </div>
  );
}

export default Exercice2;
