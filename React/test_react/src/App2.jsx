import { useState } from 'react'

function App2() {

  const [nom, setNom] = useState("test");

  const handleChange = (evt) => {
    setNom(evt.target.value)
  };

  return (
    <>
      <input type="text" value={nom} onChange={handleChange}/>
    </>
  )
}

export default App2
