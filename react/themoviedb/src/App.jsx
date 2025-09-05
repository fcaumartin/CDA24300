import React from 'react';

import { useState, useEffect } from "react";

import DataTable from "react-data-table-component";

import axios from "axios";



const App = () => {

  const columns = [
  {
    name: <b>Titre</b>,
    selector: (row) => row.title,
    sortable: true,
    with: '30%'
  },
  {
    name: <b>Overview</b>,
    selector: (row) => row.overview,
    sortable: true,
  },
  {
    name: <b>image</b>,
    selector: (row) => row.poster_path,
    sortable: true,
  }
];

  const [films, setFilms] = useState([]);
  const [term, setTerm] = useState("");

  const handleChange = (evt) => {
    // console.log(evt);
    setTerm(evt.target.value)

  };

  const handleClick = (evt) => {
    // console.log(evt);
    axios
        .get("http://api.themoviedb.org/3/search/movie?api_key=f33cd318f5135dba306176c13104506a&query=" + term)
        .then( (reponse) => {
          console.log(reponse.data)
          setFilms(reponse.data.results)
        } )
        .catch()
  };
  
  

  useEffect( () => {
      console.log("chargement composant...")
      
  }, []);

  return (
    <div style={{width: "100%"}}>
      <input type="text" value={term} onChange={handleChange}/>
      <button onClick={handleClick}>Valider</button>
      <DataTable
          style={{width: "100%"}}
          columns={columns}
          data={films}
          defaultSortFieldId={1}
      />
      {
        films.map( (film, index) => (
          <div key={index}>
            {film.original_title}
            <img src={"http://image.tmdb.org/t/p/w185" + film.poster_path} alt="" />
          </div>
        ))
      }
    </div>
  );
}

export default App;
