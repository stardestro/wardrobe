import folium
from folium.plugins import HeatMap
import pandas as pd
import requests

tt_df = pd.read_excel('TexasTemp.xlsx')
cityName = tt_df['Place'].tolist()
highF = tt_df['High °F'].tolist()
lowF = tt_df['Low °F'].tolist()
averageF = []

count = 0
tempSize = len(lowF)
while (count < tempSize):
    averageF.append((highF[count]+lowF[count])/200)
    count += 1


m = folium.Map(location=[31.000000, -100.000000], zoom_start=6)


def get_coordinates(location):
    res = requests.get(
        f"https://api.mapbox.com/geocoding/v5/mapbox.places/{location}.json?limit=2&access_token={MAPBOX_APIKEY}")
    data = res.json()
    coordinates = data['features'][0]['geometry']['coordinates']
    return coordinates


# Adds coordinates
coords = []
for city in cityName:
    coord = get_coordinates(city)
    coords.append(coord[::-1])

# Adds temperatures to coordinates
count = 0
for temp in averageF:
    coords[count].append(temp)
    count += 1


HeatMap(coords).add_to(m)
m.save('index.html')
