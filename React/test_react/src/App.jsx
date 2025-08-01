import { useState } from 'react'

function App() {

  const [compteur, setCompteur] = useState(0);

  const handleClick = () => {
    console.log("click")
    setCompteur(compteur+1)
  }

  return (
    <>
          <button onClick={handleClick} >
            count is {compteur}
          </button>
      
    </>
  )
}

export default App
