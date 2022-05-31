# Fusion des fichiers OSM sans polynesie et TAAF, du fichier OSM TAAF et Polynésie LO
ogrmerge.py -f GeoJSON \
            -overwrite_ds \
            -single \
            -lco WRITE_NAME=NO \
            -o com_all.geojson osm_communes_com_no_polynesie.shp taaf.geojson loc_commune_all.shp

# Vérification
ogr2ogr -f CSV com_all.csv \
        -dialect SQLite \
        -sql "SELECT distinct insee FROM com_all ORDER BY insee" \
        com_all.geojson

sed -i '1d' com_all.csv
sed -i 's#"##g' com_all.csv

curl -L https://github.com/etalab/decoupage-administratif/raw/master/sources/collectivites-outremer.csv | \
    xsv select code_commune | \
    sed '1d' | \
    sort >| all_coms.txt

# Si sortie non vide alors problème
diff com_all.csv all_coms.txt

ogr2ogr ../dist/osm-communes-com.shp com_all.geojson -lco ENCODING=UTF-8

cd ../dist/
zip communes-com-20220101-shp.zip osm_communes-com.*
cd ../intermediate
