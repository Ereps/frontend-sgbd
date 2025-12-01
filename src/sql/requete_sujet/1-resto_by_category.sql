SELECT cr.nom AS categorie, STRING_AGG(r.nom, ', ') AS restaurants
FROM categorie_restaurant cr
JOIN appartenance_categorie_restaurant acr
    ON cr.id_categorie_restaurant = acr.id_categorie_restaurant
JOIN restaurant r
    ON r.id_restaurant = acr.id_restaurant
GROUP BY cr.nom
ORDER BY cr.nom;
