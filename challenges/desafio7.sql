SELECT
    ar.artista_name AS artista,
    al.album_name AS album,
    COUNT(s.pessoa_usuaria_id) AS pessoas_seguidoras
FROM artistas AS ar
RIGHT JOIN albuns AS al ON ar.artista_id = al.artista_id
LEFT JOIN seguindo_artistas AS s ON ar.artista_id = s.artista_id
GROUP BY ar.artista_name, al.album_name
ORDER BY pessoas_seguidoras DESC, artista, album;