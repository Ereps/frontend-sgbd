import { useState, useEffect } from 'react';

function App() {
  const [restaurants, setRestaurants] = useState([]);
  const [name, setName] = useState('');

  // // Récupérer les restaurants au chargement
  // useEffect(() => {
  //   fetch('http://localhost:3001/restaurants')
  //     .then(res => res.json())
  //     .then(data => setRestaurants(data))
  //     .catch(err => console.error(err));
  // }, []);

  // Ajouter un restaurant
  const addRestaurant = async () => {
    const res = await fetch('http://localhost:3001/api/restaurants', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nom: name })
    });
    const data = await res.json();
    setRestaurants([...restaurants, data]);
    setName('');
  };

  return (
    <div>
      <h1>Restaurants</h1>
      <ul>
        {restaurants.map(r => (
          <li key={r.id}>{r.nom}</li>
        ))}
      </ul>

      <input
        value={name}
        onChange={e => setName(e.target.value)}
        placeholder="Nom du restaurant"
      />
      <button onClick={addRestaurant}>Ajouter</button>
    </div>
  );
}

export default App;
