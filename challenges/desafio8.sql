SELECT
    ar.artista_name AS artista,
    al.album_name AS album
FROM artistas AS ar
RIGHT JOIN albuns AS al ON ar.artista_id = al.artista_id
WHERE ar.artista_name = 'Elis Regina'
GROUP BY ar.artista_name, al.album_name
ORDER BY album;