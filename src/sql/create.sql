CREATE TABLE ingredient (
  id_ingredient int PRIMARY KEY,
  nom varchar NOT NULL
);

CREATE TABLE horaire (
  id_horaire int PRIMARY KEY,
  horaire_debut time NOT NULL,
  horaire_fin time NOT NULL
);

CREATE TABLE compte (
  id_compte int PRIMARY KEY,
  email varchar UNIQUE NOT NULL,
  points int NOT NULL DEFAULT 0
);

CREATE TABLE client (
  id_client int PRIMARY KEY,
  adresse varchar NOT NULL,
  numero_tel varchar UNIQUE NOT NULL,
  nom varchar NOT NULL
);

CREATE TABLE commentaire (
  id_commentaire int PRIMARY KEY,
  id_compte int,
  message varchar NOT NULL,
  note int NOT NULL,
  date date NOT NULL
);

CREATE TABLE fidelite (
  id_fidelite int PRIMARY KEY,
  parametre varchar NOT NULL,
  descriptif varchar NOT NULL
);

CREATE TABLE restaurant (
  nom varchar NOT NULL,
  id_restaurant int PRIMARY KEY,
  longitude int NOT NULL,
  latitude int NOT NULL
);

CREATE TABLE emplacement (
  longitude int,
  latitude int,
  departement int NOT NULL,
  adresse varchar NOT NULL,
  ville varchar NOT NULL,
  PRIMARY KEY (longitude, latitude)
);

CREATE TABLE ligne_commande (
  id_ligne_commande int PRIMARY KEY,
  principale_commandable int NOT NULL,
  variante_commandable int,
  accompagement_commandable int,
  quantite int NOT NULL
);

CREATE TABLE commande (
  id_commande int PRIMARY KEY,
  id_client int NULL,
  id_restaurant int NOT NULL,
  date date NOT NULL
);

CREATE TABLE appartenir_a_commande (
  id_commande int,
  id_ligne_commande int,
  PRIMARY KEY (id_commande, id_ligne_commande)
);

CREATE TABLE commandable (
  id_commandable int PRIMARY KEY,
  id_formule int,
  id_produit int
);

CREATE TABLE formule (
  id_formule int PRIMARY KEY,
  nom varchar NOT NULL
);

CREATE TABLE condition_formule (
  id_condition_formule int PRIMARY KEY,
  description varchar NOT NULL
);

CREATE TABLE avoir_condition_formule (
  id_formule int,
  id_condition_formule int,
  date date NOT NULL,
  PRIMARY KEY (id_formule, id_condition_formule)
);

CREATE TABLE composition_formule (
  id_formule int,
  id_produit int,
  quantite int NOT NULL,
  PRIMARY KEY (id_formule, id_produit)
);

CREATE TABLE type_produit (
  id_type_produit int PRIMARY KEY,
  nom varchar NOT NULL
);

CREATE TABLE appartenance_type_produit (
  id_type_produit int,
  id_produit int,
  PRIMARY KEY (id_type_produit, id_produit)
);

CREATE TABLE variante (
  id_variante int PRIMARY KEY,
  descriptif varchar
);

CREATE TABLE produit (
  id_produit int PRIMARY KEY,
  nom varchar NOT NULL
);

CREATE TABLE complement (
  id_complement int PRIMARY KEY
);

CREATE TABLE plat (
  id_plat int PRIMARY KEY
);

CREATE TABLE categorie_plat (
  id_categorie_plat int PRIMARY KEY,
  nom varchar NOT NULL
);

CREATE TABLE categorie_restaurant (
  id_categorie_restaurant int PRIMARY KEY,
  nom varchar NOT NULL
);

CREATE TABLE recompense (
  id_recompense int PRIMARY KEY,
  descriptif varchar NOT NULL
);

CREATE TABLE appartenance_categorie_restaurant (
  id_restaurant int,
  id_categorie_restaurant int,
  PRIMARY KEY (id_restaurant, id_categorie_restaurant)
);

CREATE TABLE appartenance_categorie_plat (
  id_plat int,
  id_categorie_plat int,
  PRIMARY KEY (id_plat, id_categorie_plat)
);

CREATE TABLE existe_variante_plat (
  id_plat int,
  id_variante int,
  PRIMARY KEY (id_plat, id_variante)
);

CREATE TABLE existe_accompagnement_plat (
  id_plat int,
  id_produit int,
  PRIMARY KEY (id_plat, id_produit)
);

CREATE TABLE boisson (
  id_boisson int PRIMARY KEY
);

CREATE TABLE compte_restaurant_client (
  id_restaurant int,
  id_client int,
  id_compte int,
  PRIMARY KEY (id_restaurant, id_client)
);

CREATE TABLE definir_fidelite (
  id_fidelite int,
  id_restaurant int,
  PRIMARY KEY (id_fidelite, id_restaurant)
);

CREATE TABLE offrir (
  id_recompense int,
  id_compte int,
  date_fin_validite date,
  PRIMARY KEY (id_recompense, id_compte)
);

CREATE TABLE disponibilite (
  id_restaurant int,
  id_commandable int,
  id_statut int NOT NULL,
  PRIMARY KEY (id_restaurant, id_commandable)
);

CREATE TABLE statut (
  id_statut int PRIMARY KEY,
  description varchar NOT NULL
);

CREATE TABLE prix (
  id_restaurant int,
  id_commandable int,
  prix int NOT NULL,
  date date NOT NULL,
  PRIMARY KEY (id_restaurant, id_commandable)
);

CREATE TABLE stock (
  id_restaurant int,
  id_ingredient int,
  quantite int NOT NULL,
  PRIMARY KEY (id_restaurant, id_ingredient)
);

CREATE TABLE composition_produit (
  id_produit int,
  id_ingredient int,
  quantite int NOT NULL,
  PRIMARY KEY (id_produit, id_ingredient)
);

CREATE TABLE planning_ouverture (
  id_restaurant int,
  id_horaire_matin int,
  id_horaire_soir int,
  jour varchar NOT NULL,
  PRIMARY KEY (id_restaurant, id_horaire_matin, id_horaire_soir, jour) -- j ai mis jour dans la pk sinon un resto pouvait pas avoir les mm horaires 2 jours differents
);

ALTER TABLE commentaire ADD FOREIGN KEY (id_compte) REFERENCES compte (id_compte);

ALTER TABLE restaurant ADD FOREIGN KEY (longitude, latitude) REFERENCES emplacement (longitude, latitude);

ALTER TABLE ligne_commande ADD FOREIGN KEY (principale_commandable) REFERENCES commandable (id_commandable);

ALTER TABLE ligne_commande ADD FOREIGN KEY (variante_commandable) REFERENCES commandable (id_commandable);

ALTER TABLE ligne_commande ADD FOREIGN KEY (accompagement_commandable) REFERENCES commandable (id_commandable);

ALTER TABLE commande ADD FOREIGN KEY (id_client) REFERENCES client (id_client);

ALTER TABLE commande ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE appartenir_a_commande ADD FOREIGN KEY (id_commande) REFERENCES commande (id_commande);

ALTER TABLE appartenir_a_commande ADD FOREIGN KEY (id_ligne_commande) REFERENCES ligne_commande (id_ligne_commande);

ALTER TABLE commandable ADD FOREIGN KEY (id_formule) REFERENCES formule (id_formule);

ALTER TABLE commandable ADD FOREIGN KEY (id_produit) REFERENCES produit (id_produit);

ALTER TABLE avoir_condition_formule ADD FOREIGN KEY (id_formule) REFERENCES formule (id_formule);

ALTER TABLE avoir_condition_formule ADD FOREIGN KEY (id_condition_formule) REFERENCES condition_formule (id_condition_formule);

ALTER TABLE composition_formule ADD FOREIGN KEY (id_formule) REFERENCES formule (id_formule);

ALTER TABLE composition_formule ADD FOREIGN KEY (id_produit) REFERENCES produit (id_produit);

ALTER TABLE appartenance_type_produit ADD FOREIGN KEY (id_type_produit) REFERENCES type_produit (id_type_produit);

ALTER TABLE appartenance_type_produit ADD FOREIGN KEY (id_produit) REFERENCES produit (id_produit);

ALTER TABLE variante ADD FOREIGN KEY (id_variante) REFERENCES produit (id_produit);

ALTER TABLE complement ADD FOREIGN KEY (id_complement) REFERENCES produit (id_produit);

ALTER TABLE plat ADD FOREIGN KEY (id_plat) REFERENCES produit (id_produit);

ALTER TABLE appartenance_categorie_restaurant ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE appartenance_categorie_restaurant ADD FOREIGN KEY (id_categorie_restaurant) REFERENCES categorie_restaurant (id_categorie_restaurant);

ALTER TABLE appartenance_categorie_plat ADD FOREIGN KEY (id_plat) REFERENCES plat (id_plat);

ALTER TABLE appartenance_categorie_plat ADD FOREIGN KEY (id_categorie_plat) REFERENCES categorie_plat (id_categorie_plat);

ALTER TABLE existe_variante_plat ADD FOREIGN KEY (id_plat) REFERENCES plat (id_plat);

ALTER TABLE existe_variante_plat ADD FOREIGN KEY (id_variante) REFERENCES variante (id_variante);

ALTER TABLE existe_accompagnement_plat ADD FOREIGN KEY (id_plat) REFERENCES plat (id_plat);

ALTER TABLE existe_accompagnement_plat ADD FOREIGN KEY (id_produit) REFERENCES produit (id_produit);

ALTER TABLE boisson ADD FOREIGN KEY (id_boisson) REFERENCES produit (id_produit);

ALTER TABLE compte_restaurant_client ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE compte_restaurant_client ADD FOREIGN KEY (id_client) REFERENCES client (id_client);

ALTER TABLE compte_restaurant_client ADD FOREIGN KEY (id_compte) REFERENCES compte (id_compte);

ALTER TABLE definir_fidelite ADD FOREIGN KEY (id_fidelite) REFERENCES fidelite (id_fidelite);

ALTER TABLE definir_fidelite ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE offrir ADD FOREIGN KEY (id_recompense) REFERENCES recompense (id_recompense);

ALTER TABLE offrir ADD FOREIGN KEY (id_compte) REFERENCES compte (id_compte);

ALTER TABLE disponibilite ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE disponibilite ADD FOREIGN KEY (id_commandable) REFERENCES commandable (id_commandable);

ALTER TABLE disponibilite ADD FOREIGN KEY (id_statut) REFERENCES statut (id_statut);

ALTER TABLE prix ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE prix ADD FOREIGN KEY (id_commandable) REFERENCES commandable (id_commandable);

ALTER TABLE stock ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE stock ADD FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient);

ALTER TABLE composition_produit ADD FOREIGN KEY (id_produit) REFERENCES produit (id_produit);

ALTER TABLE composition_produit ADD FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient);

ALTER TABLE planning_ouverture ADD FOREIGN KEY (id_restaurant) REFERENCES restaurant (id_restaurant);

ALTER TABLE planning_ouverture ADD FOREIGN KEY (id_horaire_matin) REFERENCES horaire (id_horaire);

ALTER TABLE planning_ouverture ADD FOREIGN KEY (id_horaire_soir) REFERENCES horaire (id_horaire);

