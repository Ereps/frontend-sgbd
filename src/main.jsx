import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import MainPage from './MainPage.jsx'
import Restaurants from './Restaurants.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <Router>
      <Routes>
        <Route path="/restaurants" element={<Restaurants />} />
        <Route path="/" element={<MainPage />} />
      </Routes>
    </Router>
  </StrictMode>,
)

