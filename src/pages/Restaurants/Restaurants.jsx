import { useState, useEffect } from 'react'

function Restaurants() {
  const [restos, SetRestos] = useState([])

  useEffect(() => {
    fetch('https://enseirbsgbd.azurewebsites.net/restaurant')
      .then((response) => {
        if (!response.ok) throw new Error('Erreur réseau');
        return response.json();
      })
      .then((data) => {
        SetRestos(data)
      }).catch((err) => {
        console.log(err);
      })

  }, [])


  return (
    <div>
      <h1>Les restaurants :</h1>
      <ul>
        {restos.map((resto, index) => (
          <li key={index}>
            {resto.categorie} — {resto.restaurants}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Restaurants

