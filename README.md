# contours-administratifs

Script permettant de générer les principaux contours administratifs selon différents niveaux de généralisation.

## Présentation

### Types de contours

- Communes (ADMIN EXPRESS)
- Arrondissements municipaux (ADMIN EXPRESS)
- EPCI (calculés à partir de ADMIN EXPRESS)
- Départements (calculés à partir de ADMIN EXPRESS)
- Régions (calculés à partir de ADMIN EXPRESS)
- Communes des collectivités d'outre-mer (OSM)

### Niveaux de généralisation

- 1000m
- 100m
- 50m
- 5m

## Utilisation

### Pré-requis

- Node.js 12 et supérieur
- 7zip
- tippecanoe (pour générer les tuiles vectorielles)

### Installation des dépendances Node.js

```bash
yarn
```

### Préparation des sources

La préparation des sources inclut la récupération des données auprès des serveurs OpenStreetMap et OpenDatArchives et la décompression des fichiers utiles dans le dossier `sources`.

```bash
yarn prepare-sources
```

### Génération des données + généralisation

```
yarn build
```
