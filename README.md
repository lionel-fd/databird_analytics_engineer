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

Les statuts de commande, initialement stockés sous forme de codes numériques, 
sont traduits en libellés métier afin d’améliorer la lisibilité des analyses et des tableaux de bord


Ce projet est réalisé dans le cadre d'une formation