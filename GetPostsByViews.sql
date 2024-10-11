/*Top 10 most viewed posts*/
SELECT
    p.post_title,
    p.post_date,
    pm.meta_value AS views,
    -- p.guid,
    /*might want to adjust based on how your post URLs are structured*/
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name, ')') AS MarkdownFormattedLink
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
WHERE
    pm.meta_key = 'penci_post_views_count'
    AND p.post_status = 'publish'
    AND p.post_type = 'post'
ORDER BY
    CAST(pm.meta_value AS INTEGER) DESC
LIMIT 10;


/*Top 10 least viewed posts*/
SELECT
    p.post_title,
    p.post_date,
    pm.meta_value AS views,
    -- p.guid,
    /*might want to adjust based on how your post URLs are structured*/
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name, ')') AS MarkdownFormattedLink
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
WHERE
    pm.meta_key = 'penci_post_views_count'
    AND p.post_status = 'publish'
    AND p.post_type = 'post'
ORDER BY
    CAST(pm.meta_value AS INTEGER) ASC
LIMIT 10;