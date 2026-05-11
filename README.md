Projet d'entrepôt de données et d'analyse financière
📌 Aperçu du projet

Ce projet vise à construire une architecture d'entrepôt de données complète pour l'analyse financière et opérationnelle en utilisant un flux de travail d'ingénierie des données moderne .

L'objectif est de transformer des données CSV brutes en un modèle analytique structuré grâce à une architecture multicouche :

CSV Sources → Bronze → Silver → Gold → Power BI Dashboard

Ce projet simule un environnement commercial réel où les données financières provenant de multiples systèmes opérationnels doivent être centralisées, nettoyées, transformées et analysées en vue de la prise de décision.

🎯 Objectifs
Concevoir une architecture d'entrepôt de données complète
Charger des fichiers CSV bruts dans SQL Server
Nettoyer et normaliser les données financières
Concevoir un schéma en étoile
Créer des tableaux analytiques pour la production de rapports
Mettre en place des contrôles de qualité des données
Créez des tableaux de bord interactifs avec Power BI
🏗️ Architecture
🥉 Couche de bronze — Ingestion des données brutes
Objectif

Stockez les données brutes telles que reçues des fichiers CSV sources, sans modification.

Tâches
Créer la base de donnéesDataWarehouse
Créer des schémas :
bronze
silver
gold
Créer des tables en bronze :
account
store
gltransaction
storemaster
account_mapping
Charger les fichiers CSV à l'aide deBULK INSERT
Caractéristiques

✔ Données brutes et non modifiées
✔ Traçabilité historique
✔ Réplication du système source

🥈 Couche Argent — Nettoyage et normalisation des données
Objectif

Transformer les données brutes en ensembles de données propres et cohérents.

Transformations effectuées
✔ Nettoyage technique
TRIM()pour supprimer les espaces
UPPER()pour la normalisation du texte
CAST()pour les types de données corrects
Gestion des valeurs NULL
Suppression des doublons
✔ Normalisation
Corriger les valeurs incohérentes
Exemple:
"P L" → "P&L"
Harmoniser les conventions d'appellation
Normaliser les clés métier
✔ Structuration des données
Conception de schéma cohérente
Des relations claires entre les entités
🥇 Couche d'or — Modèle analytique
Objectif

Créez un modèle analytique prêt à l'emploi en utilisant un schéma en étoile .

⭐ Conception de schéma en étoile
Tableaux de dimensions
dimstore
dimaccount
Tableau de faits
fact_gl
Relations
Transactions liées aux comptes
Transactions liées aux magasins
Avantages

✔ Performances de reporting optimisées
✔ Analyse métier simplifiée
✔ Meilleure évolutivité

🧪 Contrôles de qualité des données

Une validation des données a été effectuée à chaque niveau afin d'en garantir la fiabilité.

Exemples de validation
Détection des doublons
Validation des clés primaires/étrangères
Comparaison du nombre d'enregistrements entre les couches
Détection de valeurs critiques manquantes
Contrôles d'intégrité entre les niveaux Bronze, Argent et Or
Exemples de vérifications
SELECT COUNT(*) FROM bronze.gltransaction;
SELECT COUNT(*) FROM silver.gltransaction;
SELECT account_number, COUNT(*)
FROM silver.account
GROUP BY account_number
HAVING COUNT(*) > 1;
🛠️ Technologies utilisées
Technologie	But
Serveur SQL	Entrepôt de données
T-SQL	Transformation des données
Power BI	Visualisation des données
Fichiers CSV	Sources de données
Schéma en étoile	Modélisation analytique
📊 Tableau de bord Power BI
Tableau de bord des performances financières (compte de résultat)

Le tableau de bord Power BI offre une vue d'ensemble complète des performances financières par magasin, pays et période.

Fonctionnalités du tableau de bord
📈 Indicateurs clés de performance (KPI)
Revenu total
Bénéfice brut
Marge brute %
Marketing total
Coût total des marchandises vendues
📊 Visualisations
Évolution du chiffre d'affaires par mois et par année
Analyse des revenus par pays
Revenus par type de magasin
Analyse des profits et pertes
Comparaison des performances des magasins
🎛️ Filtres interactifs
Date de transaction
Sélection en magasin
Analyse de pays
🖼️ Aperçu du tableau de bord

📂 Structure du projet
DataWarehouse_Project/
│
├── data/
│   ├── account.csv
│   ├── gltransaction.csv
│   ├── store.csv
│   ├── storemaster.csv
│   └── account_mapping.csv
│
├── sql/
│   ├── bronze/
│   ├── silver/
│   ├── gold/
│   └── quality_checks/
│
├── powerbi/
│   └── Financial_Analytics.pbix
│
├── assets/
│   └── dashboard.png
│
└── README.md
🚀 Comment mener le projet
1️⃣ Créer une base de données
CREATE DATABASE DataWarehouse;
2️⃣ Créer des schémas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
3️⃣ Charger les fichiers CSV

Utiliser BULK INSERTpour charger des données brutes dans les tables Bronze.

Exemple:

BULK INSERT bronze.account
FROM 'C:\Data\account.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
4️⃣ Exécuter les transformations argentées

Exécutez les scripts de nettoyage et de normalisation.

5️⃣ Construire une couche d'or

Créer des tables de dimensions et de faits.

6️⃣ Connectez-vous à Power BI
Ouvrez Power BI Desktop
Se connecter à SQL Server
Importer des tables en or
Créer des visualisations
📌 Principaux enseignements

Ce projet a permis de développer les compétences suivantes :

Architecture d'entrepôt de données
Développement de pipelines ETL
Nettoyage des données SQL
Modélisation en étoile
Validation de la qualité des données
Rapports de veille stratégique
Conception du tableau de bord Power BI
📈 Valeur commerciale

Cette solution permet aux organisations de :

✔ Centraliser les données financières
✔ Améliorer la précision des rapports
✔ Suivre les performances financières
✔ Analyser l'efficacité opérationnelle
✔ Soutenir la prise de décision stratégique

👨‍💻 Auteur
Zoubair Baladi,
Master en Systèmes et Télécommunications,
Passionné d'Ingénierie des Données et d'Analyse des Données"# Analyse-de-la-Performance-Financi-re-PL-" 
"# Analyse-de-la-Performance-Financi-re-PL-" 
