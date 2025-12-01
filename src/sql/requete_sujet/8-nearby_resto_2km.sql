SELECT
    r.id_restaurant,
    r.nom,
    e.ville,
    e.adresse,
    (
        6371 * acos(
            cos(radians(44.8378)) 
            * cos(radians(r.latitude)) 
            * cos(radians(r.longitude) - radians(-0.5792))
            + sin(radians(44.8378)) 
            * sin(radians(r.latitude))
        )
    ) AS distance_km
FROM restaurant r
JOIN emplacement e 
    ON r.longitude = e.longitude
   AND r.latitude  = e.latitude
WHERE
    (
        6371 * acos(
            cos(radians(44.8378)) 
            * cos(radians(r.latitude)) 
            * cos(radians(r.longitude) - radians(-0.5792))
            + sin(radians(44.8378)) 
            * sin(radians(r.latitude))
        )
    ) <= 2
ORDER BY distance_km ASC;
