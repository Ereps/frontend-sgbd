SELECT r.id_restaurant, r.nom AS restaurant, AVG(pz.prix) AS cout_moyen_plats_principaux
FROM restaurant r
JOIN prix pz
    ON pz.id_restaurant = r.id_restaurant
JOIN commandable c
    ON c.id_commandable = pz.id_commandable
JOIN produit pr
    ON pr.id_produit = c.id_produit
JOIN appartenance_type_produit atp
    ON atp.id_produit = pr.id_produit
JOIN type_produit tp
    ON tp.id_type_produit = atp.id_type_produit
WHERE tp.nom = 'Plat principal'
GROUP BY r.id_restaurant, r.nom
ORDER BY cout_moyen_plats_principaux DESC;
