# map of Goma,DRC samples

import os, sys
import folium
import pandas as pd
import json
from folium import GeoJson
from folium import IFrame
from geojsonio import display
import branca.colormap as cm



# geojson file made on geojson.io
drc = json.load(open('drc.geojson'))


attr = ('&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> '
        'contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>')
tiles = 'http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png'


m = folium.Map(location=[29.233, -1.669], zoom_start=5, tiles=tiles, attr=attr)
folium.GeoJson(drc, style_function=lambda x:
  {'color' : x['properties']['stroke'], 'weight' :
  x['properties']['stroke-width'], 'strokeOpacity': x['properties']['stroke-opacity'],
  'fillColor' : x['properties']['fill'], 'fillOpacity': x['properties']['fill-opacity']}
  ).add_to(m)

#Marker for Buhimba, DRC
folium.Marker([28.602928, -1.362445], popup='Buhimba', 
  icon=folium.Icon(color='red')).add_to(m)


# folium.Circle(radius=100, location=[29.2356, -1.6835], popup="Goma", 
# 	color='crimson', fill=False).add_to(m)

m.save('index.html')