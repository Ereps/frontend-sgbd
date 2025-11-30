import React, { useState, useEffect } from 'react';
import { Link } from "react-router-dom";
import { Routes, Route } from 'react-router-dom'
import Navbar from './components/Navbar/Navbar';
import Home from "./pages/Home/Home"
import Cart from "./pages/Cart/Cart"
import Restaurants from "./pages/Restaurants/Restaurants"
import PlaceOrder from "./pages/PlaceOrder/PlaceOrder"


function App() {
  return (
    <div className="app">
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/restaurants" element={<Restaurants />} />
        <Route path="/cart" element={<Cart />} />
        <Route path="/placeorder" element={<PlaceOrder />} />
      </Routes>
    </div>

  )
}

export default App;

