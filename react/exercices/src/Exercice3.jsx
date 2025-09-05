import { useState } from "react";

const Exercice2 = () => {

  const [element, setElement] = useState("");
  const [tableau, setTableau] = useState(["aa", "bb", "cc"]);

  const handleChange = (evt) => {
      setElement(evt.target.value)
  };

  const handleClick = (evt) => {
    // console.log(evt);
    console.log(element)
    setTableau([ ...tableau, element ])
  };
  
  

  return (
    <div>
      <h1 className="rouge">Exercice 3</h1>
      <hr />
      <input type="text"  value={element} onChange={handleChange}/>
      <button onClick={handleClick}>Ajouter</button>
      <hr />
      {
        tableau.map( (elt, index) => (
          <div key={index}>
            {elt}
          </div>
        ))
      }
    </div>
  );
}

export default Exercice2;
