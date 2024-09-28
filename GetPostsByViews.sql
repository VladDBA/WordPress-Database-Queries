SELECT
    -- p.post_name,
    p.post_title,
    p.post_date,
    -- pm.meta_key,
    pm.meta_value AS views,
    -- p.guid,
    /*might want to adjust based on how your post URLs are structured*/
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name, ')') AS MarkdownFormattedLink
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
WHERE
    pm.meta_key = 'penci_post_views_count'
ORDER BY
    CAST(pm.meta_value AS INTEGER) DESC
LIMIT 10;