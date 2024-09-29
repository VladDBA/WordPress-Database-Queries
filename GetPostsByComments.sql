SELECT 
    p.post_title,
    p.post_date,
    p.comment_count,
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name, ')') AS MarkdownFormattedLink
FROM 
    wpkx_posts p
WHERE 
    p.post_type = 'post'
    AND p.post_status = 'publish'
ORDER BY  
    p.comment_count DESC 
LIMIT 10;