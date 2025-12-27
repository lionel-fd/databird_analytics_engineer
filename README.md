Local Bike
Projet Analytics Engineering

Contexte :

Local Bike est une entreprise américaine spécialisée dans la vente de vélos et la promotion des mobilités douces, implantée dans trois villes stratégiques :
- Santa Cruz (CA)
- Baldwin (NY)
- Rowlett (TX)

Local Bike souhaite développer son premier tableau de bord et se lancer dans l’exploitation de données.
Les analyses développées visent à répondre aux problématiques suivantes :

Performance commerciale
- Chiffre d’affaires total
- Évolution temporelle du CA
- Panier moyen
- Nombre de ventes

Analyse par boutique
- Comparaison des performances entre Santa Cruz, Baldwin et Rowlett
- Contribution de chaque boutique au CA global

Produits
- Top / Flop produits
- Répartition du CA par catégorie de vélos
- Contribution des produits au revenu global

Clients
- Nouveaux vs clients récurrents
- Valeur moyenne par client

Outils utilisés :
BigQuery pour la source
dbt pour les transformations et l'enrichissement (modèle en médaillon)
GitHub pour le versionning
PowerBI pour la visualisation

Les statuts de commande apparaissent sous forme de codes numériques.
Il est observé que le 4 correspond aux commandes expédiées.
Nous manquons d'informations pour définir les codes 1, 2 et 3
Dans l'analyse nous conserverons uniquement les commandes expédiées pour plus de clarté.


Ce projet est réalisé dans le cadre d'une formation