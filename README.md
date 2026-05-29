# 📊 Projet d’Entrepôt de Données et d’Analyse Financière

## 📌 Aperçu du Projet

Ce projet consiste à concevoir une architecture complète d’entrepôt de données dédiée à l’analyse financière et opérationnelle en utilisant un workflow moderne de Data Engineering.

L’objectif principal est de transformer des données CSV brutes en un modèle analytique structuré et exploitable grâce à une architecture multicouche :

**CSV Sources → Bronze → Silver → Gold → Power BI Dashboard**

Ce projet simule un environnement métier réel dans lequel des données financières provenant de plusieurs systèmes opérationnels doivent être centralisées, nettoyées, transformées et analysées afin de faciliter la prise de décision stratégique.

---

# 🎯 Objectifs du Projet

- Concevoir une architecture complète d’entrepôt de données
- Charger des fichiers CSV dans SQL Server
- Nettoyer et normaliser les données financières
- Construire un modèle analytique en schéma étoile
- Créer des tables optimisées pour le reporting
- Mettre en place des contrôles de qualité des données
- Développer un tableau de bord interactif avec Power BI

---

# 🏗️ Architecture du Projet

## 🥉 Couche Bronze — Ingestion des Données Brutes

### Objectif
Stocker les données telles qu’elles sont reçues depuis les fichiers CSV, sans modification.

### Tables Bronze
- `account`
- `store`
- `gltransaction`
- `storemaster`
- `account_mapping`

### Processus
- Création de la base de données `DataWarehouse`
- Création des schémas :
  - `bronze`
  - `silver`
  - `gold`
- Chargement des fichiers CSV avec `BULK INSERT`

### Caractéristiques
✔ Données brutes et non modifiées  
✔ Historisation des données  
✔ Réplication fidèle des systèmes sources

---

## 🥈 Couche Silver — Nettoyage et Normalisation

### Objectif
Transformer les données brutes en datasets propres, cohérents et exploitables.

### Transformations Réalisées

### ✔ Nettoyage Technique
- Suppression des espaces avec `TRIM()`
- Standardisation du texte avec `UPPER()`
- Conversion des types avec `CAST()`
- Gestion des valeurs NULL
- Suppression des doublons

### ✔ Normalisation
- Correction des valeurs incohérentes
- Harmonisation des conventions de nommage
- Standardisation des clés métiers

### Exemple
```sql
"P L" → "P&L"
```

---

## 🥇 Couche Gold — Modèle Analytique

### Objectif
Créer un modèle analytique optimisé pour le reporting et l’analyse.

# ⭐ Schéma en Étoile

## Tables de Dimensions
- `dimstore`
- `dimaccount`

## Table de Faits
- `fact_gl`

### Relations
- Transactions ↔ Comptes
- Transactions ↔ Magasins

### Avantages
✔ Meilleures performances analytiques  
✔ Reporting simplifié  
✔ Architecture scalable et maintenable

---

# 🧪 Contrôles de Qualité des Données

Des validations ont été réalisées à chaque couche afin d’assurer la fiabilité des données.

## Contrôles Effectués
- Détection des doublons
- Validation des clés primaires et étrangères
- Contrôle des valeurs NULL
- Comparaison du nombre d’enregistrements entre couches
- Vérification de l’intégrité des données

## Exemples de Vérifications

```sql
SELECT COUNT(*) FROM bronze.gltransaction;

SELECT COUNT(*) FROM silver.gltransaction;

SELECT account_number, COUNT(*)
FROM silver.account
GROUP BY account_number
HAVING COUNT(*) > 1;
```

---

# 🛠️ Technologies Utilisées

| Technologie | Utilisation |
|---|---|
| SQL Server | Entrepôt de données |
| T-SQL | Transformation des données |
| Power BI | Visualisation & Reporting |
| CSV Files | Sources de données |
| Star Schema | Modélisation analytique |

---

# 📊 Tableau de Bord Power BI

## Dashboard : Analyse de la Performance Financière (P&L)

Le tableau de bord Power BI fournit une vision globale des performances financières par magasin, pays et période.

## 📈 KPIs Principaux
- Revenu Total
- Profit Brut
- Marge Brute %
- Dépenses Marketing
- Coût des Marchandises Vendues (COGS)

## 📊 Visualisations
- Évolution du chiffre d’affaires par mois et année
- Analyse des revenus par pays
- Analyse par type de magasin
- Analyse Profit & Loss (P&L)
- Comparaison des performances des magasins

## 🎛️ Filtres Interactifs
- Date de transaction
- Magasin
- Pays

---

# 📂 Structure du Projet

```bash
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
```

---

# 🚀 Étapes de Réalisation

## 1️⃣ Création de la Base de Données

```sql
CREATE DATABASE DataWarehouse;
```

## 2️⃣ Création des Schémas

```sql
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
```

## 3️⃣ Chargement des Fichiers CSV

```sql
BULK INSERT bronze.account
FROM 'C:\Data\account.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
```

## 4️⃣ Exécution des Transformations Silver
- Nettoyage
- Normalisation
- Déduplication

## 5️⃣ Construction de la Couche Gold
- Création des dimensions
- Création de la table de faits
- Mise en place des relations

## 6️⃣ Connexion à Power BI
- Connexion à SQL Server
- Import des tables Gold
- Création des visualisations interactives

---

# 📌 Compétences Développées

- Data Warehouse Architecture
- ETL / ELT Pipelines
- SQL Data Cleaning
- Data Modeling
- Star Schema Design
- Data Quality Validation
- Business Intelligence
- Power BI Dashboarding

---

# 📈 Valeur Métier

Cette solution permet aux organisations de :

✔ Centraliser les données financières  
✔ Améliorer la qualité des reportings  
✔ Suivre les performances opérationnelles  
✔ Optimiser l’analyse financière  
✔ Faciliter la prise de décision stratégique

---

# 👨‍💻 Auteur

**Zoubair Baladi**  
🎓 Master en Systèmes et Télécommunications  
📊 Passionné par le Data Engineering, l’Analyse de Données et la Business Intelligence
