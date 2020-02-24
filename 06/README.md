# The GeoJSON format

# Goals
- [ ] Learn how to use GeoJSON to store geographic data
- [ ] Learn how to use jq to parse GeoJSON on the fly

# Tasks
- [ ] Given the following four coordinates, convert them into:
    - a valid GeoJSON `FeatureCollection` of `Point`s
    - a valid GeoJSON `LineString`
    - a valid GeoJSON `Polygon`

```
 ( ( 13.38086485862732, 52.516344912695416 ),
 ( 13.3858323097229, 52.51666482631435 ),
 ( 13.385746479034424, 52.516952093701605 ),
 ( 13.380703926086426, 52.516645239833196 ) )
```

- [ ] Run this overpass turbo query in your neighbourhood, and use `jq` to get a list of the names of all the spätis in your neighborhood.
```
[out:json][timeout:25];
// gather results
(
  node["shop"="convenience"]({{bbox}});

);
// print results
out body;
>;
out skel qt;
```

- paste query into http://overpass-turbo.eu/
- pan to your neighborhood
- hit `Run`
- hit `Export` and `download/copy as GeoJSON`
- pipe the results into your `jq` command


# GeoJSON

https://tools.ietf.org/html/rfc7946

---

GeoJSON is a file format for representing geographic data in a JSON-conforming structure.

# jq

https://stedolan.github.io/jq/

---

jq is a lightweight and flexible command-line JSON processor. It's like sed for JSON data.

# Other tools
- TurfJS : https://turfjs.org/, a javascript library for manipulating data in GeoJSON
- Geojson: https://pypi.org/project/geojson/, a python library for manipulating data in GeoJSON
- Shapely: https://pypi.org/project/Shapely/, a python library for manipulating geographic data
