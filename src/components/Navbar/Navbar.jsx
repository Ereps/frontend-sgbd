import React, { useState } from 'react';
import './Navbar.css'
import { Link } from 'react-router-dom'


const Navbar = () => {
  const [menu, setMenu] = useState("home")
  return (
    <div className='navbar'>
      <ul className='navbar-menu'>
        <li onClick={() => setMenu("home")} className={menu === "home" ? "active" : ""}>
          <Link to="/">Home</Link>
        </li>
        <li onClick={() => setMenu("restos")} className={menu === "restos" ? "active" : ""}>
          <Link to="/restaurants">Restaurants
          </Link>

        </li>
        <li onClick={() => setMenu("sign-in")} className={menu === "sign-in" ? "active" : ""}>
          <Link to="/sign-in">
            Création d'un compte
          </Link>
        </li>
      </ul>


    </div>
  )

}

export default Navbar;
