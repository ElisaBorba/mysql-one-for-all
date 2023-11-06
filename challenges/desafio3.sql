SELECT
  p.nome_pessoa_usuaria AS pessoa_usuaria,
  COUNT(h.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(c.duracao_segundos) / 60.0, 2) AS total_minutos
FROM historico_de_reproducoes AS h
INNER JOIN pessoas_usuarias AS p
ON p.pessoa_usuaria_id = h.pessoa_usuaria_id
INNER JOIN cancoes AS c
ON h.cancao_id = c.cancao_id
GROUP BY p.nome_pessoa_usuaria
ORDER BY p.nome_pessoa_usuaria;