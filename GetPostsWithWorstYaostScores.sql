    /*Top 10 published posts where specific Yoast scores are equal to or less than 70*/


    /*Top 10 worst Yoast SEO Index score*/
SELECT
    p.post_title,
    p.post_date,
    pm.meta_value AS yoast_seo_index,
    pmfocuskw.meta_value AS yoast_seo_keyphrase, 
    pmkwsyn.meta_value AS yoast_seo_keyphrase_synonyms,
    pmfkws.meta_value AS yoast_seo_related_keyphrase,
    /*might want to adjust based on how your post URLs are structured*/
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name) AS URL
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
LEFT JOIN wpkx_postmeta pmfkws ON
    pm.post_id = pmfkws.post_id AND pmfkws.meta_key = '_yoast_wpseo_focuskeywords'
LEFT JOIN wpkx_postmeta pmfocuskw ON
    pm.post_id = pmfocuskw.post_id AND pmfocuskw.meta_key = '_yoast_wpseo_focuskw'
LEFT JOIN wpkx_postmeta pmkwsyn ON
    pm.post_id = pmkwsyn.post_id AND pmkwsyn.meta_key = '_yoast_wpseo_keywordsynonyms'
WHERE
    pm.meta_key = '_yoast_wpseo_linkdex'
    AND p.post_status = 'publish'
    AND p.post_type = 'post'
    AND CAST(pm.meta_value AS INTEGER) <=70
ORDER BY
    CAST(pm.meta_value AS INTEGER) ASC
LIMIT 10;


    /*Top 10 worst Yoast Content score*/
SELECT
    p.post_title,
    p.post_date,
    pm.meta_value AS yoast_content_score,
    /*might want to adjust based on how your post URLs are structured*/
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name) AS URL
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
WHERE
    pm.meta_key = '_yoast_wpseo_content_score'
    AND p.post_status = 'publish'
    AND p.post_type = 'post'
    AND CAST(pm.meta_value AS INTEGER) <=70
ORDER BY
    CAST(pm.meta_value AS INTEGER) ASC
LIMIT 10;


    /*Top 10 worst Yoast Inclusive Language score*/
SELECT
    p.post_title,
    p.post_date,
    pm.meta_value AS yoast_inclusive_language_score,
    /*might want to adjust based on how your post URLs are structured*/
    CONCAT(SUBSTRING_INDEX(p.guid,'?',1),REPLACE(CAST(CAST(p.post_date as date) AS VARCHAR(20)),'-','/'), '/', p.post_name) AS URL
FROM
    wpkx_postmeta pm
INNER JOIN wpkx_posts p ON
    pm.post_id = p.ID
WHERE
    pm.meta_key = '_yoast_wpseo_inclusive_language_score'
    AND p.post_status = 'publish'
    AND p.post_type = 'post'
    AND CAST(pm.meta_value AS INTEGER) <=70
ORDER BY
    CAST(pm.meta_value AS INTEGER) ASC
LIMIT 10;