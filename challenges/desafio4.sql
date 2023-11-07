SELECT DISTINCT p.nome_pessoa_usuaria AS pessoa_usuaria,
  IF(YEAR(MAX(h.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM
 historico_de_reproducoes AS h
INNER JOIN
pessoas_usuarias AS p
ON
p.pessoa_usuaria_id = h.pessoa_usuaria_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;