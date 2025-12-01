SELECT r.id_restaurant, r.nom AS restaurant, p.id_produit, p.nom AS produit, EXTRACT(YEAR FROM c.date) AS annee, EXTRACT(MONTH FROM c.date) AS mois, SUM(lc.quantite) AS total_commandes
FROM restaurant r
JOIN commande c
    ON c.id_restaurant = r.id_restaurant
JOIN appartenir_a_commande ac
    ON ac.id_commande = c.id_commande
JOIN ligne_commande lc
    ON lc.id_ligne_commande = ac.id_ligne_commande
JOIN commandable com
    ON com.id_commandable = lc.principale_commandable
JOIN produit p
    ON p.id_produit = com.id_produit
WHERE 
    c.date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
    r.id_restaurant,
    r.nom,
    p.id_produit,
    p.nom,
    annee,
    mois
ORDER BY 
    r.id_restaurant,
    annee,
    mois,
    p.nom;
