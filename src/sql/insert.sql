--================================================
-- TABLES SANS DEPENDANCES FK
--===============================================
-- Ingrédients
INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Boeuf'),
(2, 'Laitue'),
(3, 'Oeuf'),
(4, 'Cheddar'),
(5, 'Sucre'),
(6, 'Pommes de terre'),
(7, 'Tomates'),
(8, 'Sel'),
(9, 'Blanc de poulet'),
(10, 'Eau');

-- Horaires
INSERT INTO horaire (id_horaire, horaire_debut, horaire_fin) VALUES
(1, '11:00:00', '15:00:00'),
(2, '12:00:00', '14:00:00'),
(3, '18:00:00', '22:00:00'),
(4, '19:00:00', '23:00:00');

-- Comptes
INSERT INTO compte (id_compte, email, points) VALUES
(1, 'pl_shresta@email.com', 120),
(2, 'pierre_sa@email.com', 0),
(3, 'louis_lie@email.com', 250);

-- Clients
INSERT INTO client (id_client, adresse, numero_tel, nom) VALUES
(1, '15 Avenue du Crous, Talence', '0102030405', 'pl Shresta'),
(2, '25 Avenue des cailloux, Brest', '0607080910', 'Pierre Sa'),
(3, '12 Place Dumarché, Versailles', '0611223344', 'Louis Lie'),
(10, 'Bordeaux', '0000000000', 'Client Sans Compte');

-- Fidélité
INSERT INTO fidelite (id_fidelite, parametre, descriptif) VALUES
(1, 'points', '1 euro dépensé = 1 point'),
(2, 'points', '1 euro dépensé = 2 points (premium)');

-- Types de produits
INSERT INTO type_produit (id_type_produit, nom) VALUES
(1, 'A partager'),
(2, 'Entrée'),
(3, 'Plat principal'),
(4, 'Boisson'),
(5, 'Dessert'),
(6, 'Fait maison');

-- Catégories de plats
INSERT INTO categorie_plat (id_categorie_plat, nom) VALUES
(1, 'Vegan'),
(2, 'Sans gluten'),
(3, 'Végétarien');

-- Catégories de restaurants
INSERT INTO categorie_restaurant (id_categorie_restaurant, nom) VALUES
(1, 'Pizzeria'),
(2, 'Tacos'),
(3, 'Burger'),
(4, 'Fast-food');

-- Statuts
INSERT INTO statut (id_statut, description) VALUES
(1, 'Disponible'),
(2, 'Rupture de stock'),
(3, 'Indisponible temporairement');

-- Conditions de formule
INSERT INTO condition_formule (id_condition_formule, description) VALUES
(1, 'Valable uniquement le midi'),
(2, 'Valable de lundi à vendredi'),
(3, 'Menu enfant -12 ans');

-- Récompenses
INSERT INTO recompense (id_recompense, descriptif) VALUES
(1, 'Boisson gratuite pour 50 points'),
(2, 'Dessert offert pour 100 points'),
(3, 'Menu gratuit pour 200 points');

-- Emplacements 
INSERT INTO emplacement (longitude, latitude, departement, adresse, ville) VALUES
(1001, 2001, 75, '10 Rue de Messi', 'Paris'),
(1040, 2042, 69, '20 Avenue de Lyon', 'Lyon'),
(1015, 2025, 12, '5 Boulevard Saint-Germain', 'Brest'),
(-0.58, 45, 33, 'Rue Sainte-Catherine', 'Bordeaux'),
(1050, 2050, 66, '15 Rue du Paradis', 'Chicago');

-- Formules 
INSERT INTO formule (id_formule, nom) VALUES
(1, 'Menu Midi'),
(2, 'Menu Enfant'),
(3, 'Menu Semaine'),
(4, 'Menu XXL');

-- Produits 
INSERT INTO produit (id_produit, nom) VALUES
(1, 'Burger Classique'),
(2, 'Frites'),
(3, 'Salade César'),
(4, 'Coca cola'),
(5, 'Burger Vegan'),
(6, 'Burger Double Fromage'),
(7, 'Eau gazeuse'),
(8, 'Glace vanille'),
(9, 'Petite salade');

-- ============================================
-- TABLES AVEC 1 DÉPENDANCE FK
-- ============================================

-- Commentaires (FK → compte)
INSERT INTO commentaire (id_commentaire, id_compte, message, note, date) VALUES
(1, 1, 'Excellent service et plats délicieux !', 5, '2025-11-10'),
(2, 2, 'Bonne ambiance mais service un peu lent', 3, '2025-11-11'),
(3, 3, 'Rapport qualité-prix imbattable', 4, '2025-11-12'),
(4,1, 'Horrible', 1, '2025-11-19');

-- Restaurants ( (longitude,latitude) est la clé primaire d'emplacement )
INSERT INTO restaurant (nom, id_restaurant, longitude, latitude) VALUES
('Mcdo' ,1, 1001, 2001),
('Hippopotamus' ,2, 1040, 2042),
('Dominos', 3, 1015, 2025),
('Sushishop' ,4, 1050, 2050),
('Burger king Bordeaux', 5, -0.58, 45);

-- Variantes (id_variante est une FK de produit)
INSERT INTO variante (id_variante, descriptif) VALUES
(5, 'Version végétale du burger classique'),
(6, 'Burger avec double portion de fromage');

-- Compléments (id_complement est une FK de produit)
INSERT INTO complement (id_complement) VALUES
(2), -- Frites
(9); -- Petite salade

-- Plats (id_plat est une FK de produit)
INSERT INTO plat (id_plat) VALUES
(1), -- Burger Classique
(3), -- Salade César
(5), -- Burger Vegan
(6); -- Burger Double Fromage

-- Boissons (id_boisson est une FK de produit)
INSERT INTO boisson (id_boisson) VALUES
(4), -- Soda Cola
(7); -- Eau gazeuse

-- ============================================
-- TABLES AVEC PLUSIEURS DÉPENDANCES FK
-- ============================================

-- Composition des produits 
INSERT INTO composition_produit (id_produit, id_ingredient, quantite) VALUES
(1, 1, 100), -- Burger Classique: boeuf
(1, 3, 50),  -- Burger Classique: oeuf
(1, 4, 30),  -- Burger Classique: cheddar
(1, 8, 2),   -- Burger Classique: sel
(2, 6, 150), -- Frites: pommes de terre
(2, 8, 3),   -- Frites: sel
(3, 2, 80),  -- Salade César: laitue
(3, 7, 40),  -- Salade César: tomates
(3, 3, 50),  -- Salade César: oeuf
(3, 8, 1),   -- Salade César: sel
(3, 9, 60),  -- Salade César: blancs de poulet
(4, 5, 35),  -- Coca cola: sucre
(4, 10, 330),-- Coca cola: eau
(5, 2, 100), -- Burger Vegan: laitue
(5, 7, 50),  -- Burger Vegan: tomates
(5, 8, 2),   -- Burger Vegan: sel
(6, 1, 120), -- Burger Double Fromage: boeuf
(6, 4, 60),  -- Burger Double Fromage: cheddar (double)
(6, 3, 50),  -- Burger Double Fromage: oeuf
(6, 8, 2),   -- Burger Double Fromage: sel
(7, 10, 330),-- Eau gazeuse: eau
(8, 5, 25),  -- Glace vanille: sucre
(8, 10, 100);-- Glace vanille: eau

-- Appartenance types de produits
INSERT INTO appartenance_type_produit (id_type_produit, id_produit) VALUES
(1, 2), -- Frites: à partager
(2, 9), -- Petite salade: entrée
(3, 1), -- Burger Classique: plat principal
(3, 3), -- Salade César: plat principal
(3, 5), -- Burger Vegan: plat principal
(3, 6), -- Burger Double Fromage: plat principal
(4, 4), -- Soda: boisson
(4, 7), -- Eau: boisson
(5, 8), -- Glace: dessert
(6, 1), -- Burger classique: Fait maison
(6, 6); -- Burger double: Fait maison

-- Appartenance catégories de plats 
INSERT INTO appartenance_categorie_plat (id_plat, id_categorie_plat) VALUES
(1, 2), -- Burger Classique: sans gluten
(3, 3), -- Salade César: végétarien
(5, 1), -- Burger Vegan: vegan
(5, 3), -- Burger Vegan: végétarien
(6, 2); -- Burger Double Fromage: sans gluten

-- Appartenance catégories de restaurants 
INSERT INTO appartenance_categorie_restaurant (id_restaurant, id_categorie_restaurant) VALUES
(1, 3), -- Restaurant 1: Burger
(1, 4), -- Restaurant 1: Fast-food
(2, 2), -- Restaurant 2: Tacos
(2, 4), -- Restaurant 2: Fast-food
(3, 1), -- Restaurant 3: Pizza
(4, 3), -- Restaurant 4: Burger
(5, 3); -- Restaurant 5: Burger

-- Existence variantes pour plats 
INSERT INTO existe_variante_plat (id_plat, id_variante) VALUES
(1, 5), -- Burger Classique a comme variante: Burger Vegan
(1, 6); -- Burger Classique a comme variante: Burger Double Fromage

-- Existence accompagnements pour plats
INSERT INTO existe_accompagnement_plat (id_plat, id_produit) VALUES
(1, 2), -- Burger Classique avec Frites
(5, 2), -- Burger Vegan avec Frites
(6, 2), -- Burger Double Fromage avec Frites
(1, 9), -- Burger Classique avec Petite salade
(5, 9), -- Burger Vegan avec Petite salade
(6, 9); -- Burger Double Fromage avec Petite salade


-- Planning d'ouverture 
INSERT INTO planning_ouverture (id_restaurant, id_horaire_matin, id_horaire_soir, jour) VALUES
(1, 1, 3, 'Lundi'),
(1, 1, 3, 'Mardi'),
(1, 1, 3, 'Mercredi'),
(1, 1, 3, 'Jeudi'),
(1, 1, 3, 'Vendredi'),
(2, 2, 4, 'Lundi'),
(2, 2, 4, 'Mardi'),
(2, 2, 4, 'Vendredi'),
(3, 1, 3, 'Lundi'),
(3, 1, 3, 'Mardi'),
(3, 1, 3, 'Mercredi');

-- Commandables 
INSERT INTO commandable (id_commandable, id_formule, id_produit) VALUES
(1, NULL, 1),  -- Burger Classique seul
(2, NULL, 2),  -- Frites seules
(3, NULL, 3),  -- Salade César
(4, NULL, 4),  -- Coca cola seul
(5, NULL, 5),  -- Burger Vegan seul
(6, NULL, 6),  -- Burger Double Fromage seul
(7, NULL, 7),  -- Eau seule
(8, NULL, 8),  -- Glace seule
(9, NULL, 9),  -- Petite salade seule
(10, 1, NULL),  -- Menu Midi (formule)
(11, 2, NULL), -- Menu Enfant (formule)
(12, 3, NULL), -- Menu Semaine (formule)
(13, 4, NULL); -- Menu XXL (formule)

-- Composition des formules 
INSERT INTO composition_formule (id_formule, id_produit, quantite) VALUES
(1, 1, 1), -- Menu Midi: 1 Burger Classique
(1, 2, 1), -- Menu Midi: 1 Frites
(1, 4, 1), -- Menu Midi: 1 Coca
(2, 1, 1), -- Menu Enfant: 1 Burger
(2, 2, 1), -- Menu Enfant: 1 Frites
(2, 7, 1), -- Menu Enfant: 1 Eau
(3, 6, 1), -- Menu Semaine: 1 Burger Double Fromage
(4, 1, 4), -- Menu Semaine: 4 Burger Classique
(4, 2, 4), -- Menu Semaine: 4 Frites
(4, 4, 4); -- Menu Semaine: 4 Coca

-- Conditions sur formules 
INSERT INTO avoir_condition_formule (id_formule, id_condition_formule, date) VALUES
(1, 1, '2025-01-01'), -- Menu Midi: uniquement le midi
(2, 3, '2025-01-01'), -- Menu Enfant: -12 ans
(3, 2, '2025-01-01'); -- Menu Semaine: de lundi à vendredi

-- Stocks par restaurant 
INSERT INTO stock (id_restaurant, id_ingredient, quantite) VALUES
(1, 1, 500),  -- Restaurant 1: boeuf
(1, 2, 300),  -- Restaurant 1: laitue
(1, 3, 400),  -- Restaurant 1: oeuf
(1, 4, 200),  -- Restaurant 1: cheddar
(1, 6, 500),  -- Restaurant 1: pommes de terre
(2, 1, 300),  -- Restaurant 2: boeuf
(2, 2, 150),  -- Restaurant 2: laitue
(2, 6, 400),  -- Restaurant 2: pommes de terre
(3, 1, 400),  -- Restaurant 3: boeuf
(3, 3, 300),  -- Restaurant 3: oeuf
(4, 1, 350),  -- Restaurant 4: boeuf
(4, 4, 250);  -- Restaurant 4: cheddar

-- Disponibilités 
INSERT INTO disponibilite (id_restaurant, id_commandable, id_statut) VALUES
(1, 1, 1),  -- Restaurant 1: Burger Classique disponible
(1, 2, 1),  -- Restaurant 1: Frites disponibles
(1, 4, 1),  -- Restaurant 1: Coca cola disponible
(1, 10, 1),  -- Restaurant 1: Menu Midi disponible
(2, 1, 2),  -- Restaurant 2: Burger Classique en rupture
(2, 5, 1),  -- Restaurant 2: Burger Vegan disponible
(3, 1, 1),  -- Restaurant 3: Burger Classique disponible
(4, 6, 1);  -- Restaurant 4: Burger Double Fromage disponible

-- Prix par restaurant et commandable (FK → restaurant, commandable)
INSERT INTO prix (id_restaurant, id_commandable, prix, date) VALUES
(1, 1, 8, '2025-01-01'),   -- Restaurant 1: Burger Classique 8€
(1, 2, 3, '2025-01-01'),   -- Restaurant 1: Frites 3€
(1, 4, 2, '2025-01-01'),   -- Restaurant 1: Soda 2€
(1, 9, 12, '2025-01-01'),  -- Restaurant 1: Menu Midi 12€
(2, 1, 9, '2025-01-01'),   -- Restaurant 2: Burger Classique 9€
(2, 5, 10, '2025-01-01'),  -- Restaurant 2: Burger Vegan 10€
(3, 1, 7, '2025-01-01'),   -- Restaurant 3: Burger Classique 7€
(4, 6, 11, '2025-01-01');  -- Restaurant 4: Burger Double Fromage 11€

-- Lignes de commande 
INSERT INTO ligne_commande (id_ligne_commande, principale_commandable, variante_commandable, accompagement_commandable, quantite) VALUES
(1, 1, 5, 2, 1),  -- Burger Classique (variante Vegan) avec Frites, quantité 1
(2, 1, 6, 3, 2),  -- Burger Classique (variante Double Fromage) avec Salade, quantité 2
(3, 9, NULL, NULL, 1), -- Menu Midi, quantité 1
(4, 1, NULL, 2, 1);    -- Burger Classique avec Frites, quantité 1

-- Commandes 
INSERT INTO commande (id_commande, id_client, id_restaurant, date) VALUES
(1, 1, 1, '2025-01-10'),
(2, 2, 2, '2025-01-11'),
(3, 3, 5, '2025-11-12'),
(50, 10, 1, CURRENT_DATE);

-- Appartenance à commande 
INSERT INTO appartenir_a_commande (id_commande, id_ligne_commande) VALUES
(1, 1), -- Commande 1 contient ligne 1
(2, 2), -- Commande 2 contient ligne 2
(3, 3), -- Commande 3 contient ligne 3
(3, 4); -- Commande 3 contient aussi ligne 4

-- Comptes restaurant-client 
INSERT INTO compte_restaurant_client (id_restaurant, id_client, id_compte) VALUES
(1, 1, 1), -- pl a un compte au restaurant 1
(2, 2, 2), -- Pierre a un compte au restaurant 2
(1, 3, 3); -- Louis a un compte au restaurant 1

-- Définition fidélité par restaurant 
INSERT INTO definir_fidelite (id_fidelite, id_restaurant) VALUES
(1, 1), -- Restaurant 1: programme fidélité standard
(1, 2), -- Restaurant 2: programme fidélité standard
(2, 3); -- Restaurant 3: programme fidélité premium

-- Offrir récompenses 
INSERT INTO offrir (id_recompense, id_compte, date_fin_validite) VALUES
(1, 1, '2026-12-31'), -- pl: boisson gratuite
(2, 3, '2026-06-30'); -- Louis: dessert offert


