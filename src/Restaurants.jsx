import { useState, useEffect } from 'react'
import { supabase } from '../utils/supabase'

function Restaurants() {
  const [restos, SetRestos] = useState([])

  useEffect(() => {
    async function getRestos() {
      const { data: restos } = await supabase.from('restaurant').select()

      if (restos.length > 1) {
        console.log('tqtq')
        SetRestos(restos)
      }
      else {
        console.log('toto')
      }
    }
    getRestos()

  }, [])

  return (
    <div>
      <h1>Les restaurants :</h1>
      {restos.map((resto) => (
        <li key={resto.id_restaurant}>{resto.nom} - {resto.longitude}, {resto.latitude}</li>
      ))}
    </div>
  )
}
export default Restaurants

