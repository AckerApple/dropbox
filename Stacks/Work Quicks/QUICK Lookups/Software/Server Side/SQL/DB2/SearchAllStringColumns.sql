
--select every string based table-column with dyanmic search
--take results and concat together (remove first union all)
WITH VALS as (
        select 'search-string-here' as t from Sysibm.sysindexes fetch first 1 rows only
)
SELECT  c.coltype,
        (
            (case
                when MOD(ROW_NUMBER() OVER(ORDER BY 1 DESC), 200) = 0
                then ';'
                when MOD(ROW_NUMBER() OVER(ORDER BY 1 DESC), 200) > 1
                then 'union all '
                else ''
            end) ||
                'select distinct ' || c.name || ' as value,
                '''||c.name||''' as column_name, '''||tbname||''' as table_name
                from ' || c.TBCREATOR  || '.' || c.tbname ||
                ' where ' || c.name || (CASE WHEN c.coltype in ('CHAR','CHARACTER') THEN ' = ''' || v.t || '''' ELSE ' like ''%' || v.t || '%''' END)
        ) as dy
FROM    Sysibm.syscolumns c
JOIN    VALS v on 1=1
where   (
            c.coltype in ('VARCHAR', 'GRAPHIC', 'VARGRAPHIC', 'DBCLOB', 'BINARY', 'VARBINARY', 'BLOB')
        OR  c.coltype in ('CHAR','CHARACTER') AND c.length = LENGTH(v.t)
        )
AND     c.TBCREATOR IN ('SRWC04','XRWO4','ARWM4')
AND     c.CCSID > 0
--SKIPS
AND     c.tbname NOT IN ('LOYALTY_BATCH_WORKING')




