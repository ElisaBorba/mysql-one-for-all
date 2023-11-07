SELECT
  TRIM('"' FROM c.cancao_name) AS cancao,
  COUNT(h.cancao_id) AS reproducoes
FROM historico_de_reproducoes AS h
INNER JOIN cancoes AS c
ON h.cancao_id = c.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
