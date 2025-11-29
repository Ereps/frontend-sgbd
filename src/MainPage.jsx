import { useState, useEffect } from 'react';
import { Link } from "react-router-dom";


function MainPage() {
  return (
    <div>
      <h1>
        Page de base
      </h1>
      <Link to="/restaurants">
        <button> Les restaurants</button>
      </Link>
    </div>
  )
}

export default MainPage;

