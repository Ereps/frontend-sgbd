SELECT r.id_restaurant, r.nom, COUNT(c.id_commande) AS nb_commande_30j
FROM restaurant r
JOIN emplacement e
    ON r.longitude = e.longitude
   AND r.latitude  = e.latitude
   AND e.ville = 'Bordeaux'  
LEFT JOIN commande c
    ON c.id_restaurant = r.id_restaurant
   AND c.date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY r.id_restaurant, r.nom
ORDER BY nb_commande_30j DESC