SELECT all_reserved_local.local_id, all_reserved_local.date_id, AVG(all_reserved_local.payed_amount) AS avg_payed
FROM
        (SELECT *
        FROM (SELECT l.local_id as local_id, l.payed_amount, r.date_id
              FROM local_dimension l
                  INNER JOIN reservation_fact r
                  ON l.local_id = r.local_id
        )
        AS reserved_local NATURAL JOIN reservation_fact
    )
    AS all_reserved_local
GROUP BY all_reserved_local.local_id, all_reserved_local.date_id WITH ROLLUP;
