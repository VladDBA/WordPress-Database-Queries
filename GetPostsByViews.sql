SELECT
    p.post_name,
    p.post_title,
    p.post_date,
    pm.meta_key,
    pm.meta_value
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
WHERE
    pm.meta_key = 'penci_post_views_count'
ORDER BY
    CAST(pm.meta_value AS INTEGER) DESC; 