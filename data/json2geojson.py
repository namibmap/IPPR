import json
import geojson
from geojson import Polygon, Feature, FeatureCollection

'''
The only file with GIS data for this project at the moment is NA.json, which
can be found in http://data.pudo.org/flexicadastre/

NA.json is a JSON file containing a somewhat complex structure different to the
GeoJSON structure we'd spect to represente GIS data.

We need to convert this file structure to GeoJSON so that we can ingest it in
tools such as CartoDB and it's easier to manipulate.

The relevant data in the NA.json structure seems to be in

data["layers"][*]["data"]["features"]["attributes"]

and

data["layers"][*]["data"]["features"]["geometry"]["rings"]

The GeoJSON format proposed as an output is as in
http://geojson.org/geojson-spec.html#examples

The data needed for the GeoJSON is in NA.json, so we just need to transform it.

The rings element contains a list of coordinates equivalent to those needed in
a GeoJSON Polygon element.
The attributes element contains a custom dict with properties that apply to the
layer polygons, e.g. areas, perimeters, types of mines in the mining layers, or
types of licenses in the licensing layers, etc. These are similar to the GeoJSON
Properties elements.
See online GeoJSON documentation for reference.

NA.json contains several layers, our main focus is the Hydrocarbons Licences
layer.
This script will process the NA.json file and will produce one GeoJSON file per
layer.
'''

#Read file into a dict
json_data = open("NA.json").read()
data = json.loads(json_data)

#Save layers list to go through it and process each of them separately
layers = data["layers"]

#For each layer, dive into dict structure until we get a rings object
#which contains the coordinates of the polygon describing the areas in
#each layer.
for layer in layers:

    #Layer names contain spaces which are not suitable for filenames
    layer_name = layer["name"].replace (" ", "_")
    print "Creating " + layer_name

    #Dive into the features element which contains a geometry and some
    #attributes that can be used as GeoJSON properties
    layer_data = layer["data"]
    layer_features = layer_data["features"]

    #The data in the output GeoJSON is collected into a geometric
    #structured called FeatureCollection (refer to GeoJSON docu)
    feature_collection = []

    #Each feature has a dict of attributes (similar to GeoJSON
    #properties) and a geometry incorrectly (IMHO) categorised as a list
    #of rings when in fact is a single polygon.
    for feature in layer_features:
        attribs = feature["attributes"]

        #Since some layers don't have geometries, we need to try-catch it
        try:
            geom = feature["geometry"]
        except KeyError:
            pass

        #Since some layers don't have rings, we need to try-catch it
        try:
            rings = geom["rings"]
        except:
            pass

        #Save rings as a GeoJSON Polygon object.
        poly = Polygon(rings)

        #Wrap GeoJSON Polygon in GeoJSON Feature object so that we can
        #add the attributes to the output file and link them to the
        #corresponding Polygon
        feat = Feature(geometry=poly, properties=attribs)

        #Add GeoJSON Feature to FeatureCollection
        feature_collection.append(feat)

    #Create a GeoJSON FeatureCollection object with the array of features
    featcol = FeatureCollection(feature_collection)

    #Save to output file with the name of the layer
    dump = geojson.dumps(featcol, sort_keys=True)
    with open(layer_name+'.json', 'w') as outfile:
            geojson.dump(dump, outfile)

