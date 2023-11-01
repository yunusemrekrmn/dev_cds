@AbapCatalog.sqlViewName: 'ZCDS_EGITIM_C2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'deneme cds 2'
define view zcds_egitim_3 as select from zcds_egitim_c as cds
{
    key cds.vbeln,
    sum ( cds.conversion_netwr ) as top_net_deger,
       cds.kunnrad ,
       count( * ) as fatura_adet,
       division( cast( sum (cds.conversion_netwr) as  abap.curr( 24 , 2 ) ) , cast( count( * ) as abap.int2 ) , 3 ) as ort_miktar,
       left ( cds.fkdat , 4 ) as Yil,
       substring( cds.fkdat , 5 , 2 ) as Ay,
       substring( cds.fkdat , 7 , 2 ) as Gun,
       substring( cds.inco2_l , 1 , 3 ) as incoterm
} 
group by cds.vbeln,
         cds.kunnrad,
         cds.fkdat,
         cds.inco2_l
