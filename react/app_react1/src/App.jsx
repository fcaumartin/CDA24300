import { useState } from "react";

const App = () => {

  const [nom, setNom] = useState("au début")

  function handleChange(event) {
    setNom(event.target.value)
  }

  return (
    <div>
      <h1 className="rouge">Titre2</h1>
      Coucou
      <hr />
      {nom}
      <hr />
      <input type="text" value={nom} onChange={handleChange}/>
    </div>
  );
}

export default App;
