import React from 'react';

import { useState, useEffect } from "react";

import DataTable from "react-data-table-component";

import axios from "axios";



const App = () => {

  const [categories, setCategories] = useState([]);
  const [sousCategories, setSousCategories] = useState([]);
  const [produits, setProduits] = useState([]);
  const [produit, setProduit] = useState({ nom: '', image:'', description: ''});
  

  const handleClickCategorie = (id) => {
    console.log(id);
    axios
        .get("https://127.0.0.1:8000/api/categories/" + id)
        .then( (reponse) => {
          console.log(reponse.data)
          setSousCategories(reponse.data.sousCategories)
        } )
  };

  const handleClickSousCategorie = (id) => {
    console.log(id);
    axios
        .get("https://127.0.0.1:8000/api/sous_categories/" + id)
        .then( (reponse) => {
          console.log(reponse.data)
          setProduits(reponse.data.produits)
        } )
  };


  const handleClickProduit = (id) => {
    console.log(id);
    axios
        .get("https://127.0.0.1:8000/api/produits/" + id)
        .then( (reponse) => {
          console.log(reponse.data)
          setProduit(reponse.data)
        } )
  };
  

  useEffect( () => {
      console.log("chargement composant...")
      axios
        .get("https://127.0.0.1:8000/api/categories")
        .then( (reponse) => {
          console.log(reponse.data)
          setCategories(reponse.data)
        } )
        
  }, []);


  return (
    <div >
      <h1>Categories</h1>
      {
        categories.map( (cat, index) => (
          <button key={index} onClick={ () => { handleClickCategorie(cat.id) } }>
            {cat.nom}
          </button>
        ))
      }
      <h1>Sous Categories</h1>
      {
        sousCategories.map( (scat, index) => (
          <button key={index} onClick={ () => { handleClickSousCategorie(scat.id) } }>
            {scat.nom}
          </button>
        ))
      }
      <h1>Produits</h1>
      {
        produits.map( (pro, index) => (
          <button key={index} onClick={ () => { handleClickProduit(pro.id) } }>
            {pro.nom}
          </button>
        ))
      }

      <h1>Produit</h1>
      {produit.nom}
      <br />
      {produit.image}
      <br />
      {produit.description}
      <br />
    </div>
  );
}

export default App;
