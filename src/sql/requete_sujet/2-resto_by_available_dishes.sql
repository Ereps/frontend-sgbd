SELECT r.nom AS restaurant, STRING_AGG(tp.nom || ' (' || s.description || ')', ', ' ORDER BY tp.nom) AS disponibilite_par_categorie
FROM restaurant r
JOIN disponibilite d
    ON r.id_restaurant = d.id_restaurant
JOIN statut s
    ON s.id_statut = d.id_statut
JOIN commandable c
    ON c.id_commandable = d.id_commandable
JOIN produit p
    ON p.id_produit = c.id_produit
JOIN appartenance_type_produit atp
    ON atp.id_produit = p.id_produit
JOIN type_produit tp
    ON tp.id_type_produit = atp.id_type_produit
GROUP BY r.nom
ORDER BY r.nom;
