    /*Top 10 posts by dates*/

    /*By post date - latest posted*/
SELECT 
    p.post_title,
    p.post_date,
    p.post_modified,
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name, ')') AS MarkdownFormattedLink
FROM 
    wpkx_posts p
WHERE 
    p.post_type = 'post'
    AND p.post_status = 'publish'
ORDER BY  
    p.post_date DESC 
LIMIT 10;


    /*By post date - oldest posted*/
SELECT 
    p.post_title,
    p.post_date,
    p.post_modified,
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name, ')') AS MarkdownFormattedLink
FROM 
    wpkx_posts p
WHERE 
    p.post_type = 'post'
    AND p.post_status = 'publish'
ORDER BY  
    p.post_date ASC 
LIMIT 10;


    /*Recently updated*/
SELECT 
    p.post_title,
    p.post_date,
    p.post_modified,
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name) AS URL,
    CONCAT('- [', p.post_title, ']', '(', SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(post_date as date) AS VARCHAR(20)),'-','/'), '/', post_name, ')') AS MarkdownFormattedLink
FROM 
    wpkx_posts p
WHERE 
    p.post_type = 'post'
    AND p.post_status = 'publish'
    AND p.post_date <> p.post_modified
ORDER BY  
    p.post_modified DESC 
LIMIT 10;