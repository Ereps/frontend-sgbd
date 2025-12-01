SELECT *
FROM commande
WHERE id_client NOT IN 
(SELECT c.id_client 
FROM client c JOIN compte_restaurant_client crc on c.id_client = crc.id_client
JOIN compte cr on crc.id_compte = cr.id_compte 
);