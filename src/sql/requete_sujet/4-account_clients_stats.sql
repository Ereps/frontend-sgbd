SELECT c.id_client,c.nom,c.adresse,c.numero_tel,cp.id_compte,COUNT(cmd.id_commande) AS nb_commandes,
    COALESCE(SUM(p.prix), 0) AS montant_total
FROM client c
JOIN compte_restaurant_client crc ON crc.id_client = c.id_client      
JOIN compte cp ON cp.id_compte = crc.id_compte       
LEFT JOIN commande cmd ON cmd.id_client = c.id_client        
LEFT JOIN appartenir_a_commande ac ON ac.id_commande = cmd.id_commande
LEFT JOIN prix p ON p.id_commandable = ac.id_ligne_commande AND p.id_restaurant = cmd.id_restaurant
GROUP BY c.id_client, c.nom, c.adresse, c.numero_tel, cp.id_compte;