# The Osmium Ecosystem

When editing the OpenStreetMap base map, changesets and objects end up in a database.
To easily and conveniently distribute and work with the base map there are database snapshots.
These snapshots come as XML and PBF files representing the database at a fixed point in time.


# Goals

- Get to know base map file formats, trade-offs, design decisions
- Be able to download and work with base map snapshots
- Be able to use `osmium-tool` to work with and transform the base map


# Tasks

- [ ] Download Berlin base map
- [ ] Get Kreuzberg polygon
- [ ] Cut out Kreuzberg from base map
- [ ] Filter roads by `highway=*` tags
- [ ] Save as pbf and xml


# File Formats

- https://wiki.openstreetmap.org/wiki/OSM_file_formats
- https://wiki.openstreetmap.org/wiki/OSM_XML
- https://wiki.openstreetmap.org/wiki/PBF_Format


# Data Sources

- https://wiki.openstreetmap.org/wiki/Planet.osm
- http://download.geofabrik.de


# Osmium

- https://osmcode.org/libosmium/
- https://osmcode.org/pyosmium/
- https://osmcode.org/osmium-tool/
