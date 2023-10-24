@AbapCatalog.sqlViewName: 'ZCDS_EGITIM_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'cds eğitim'
define view zcds_egitim 
   as select from ekko 
        inner join ekpo on ekko.ebeln = ekpo.ebeln
        inner join lfa1 on lfa1.lifnr = ekko.lifnr
        inner join mara on mara.matnr = ekpo.matnr
        left outer join makt on makt.matnr = mara.matnr and
                                makt.spras = $session.system_language
         {
   key ekpo.ebeln,
   key ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins, 
    lfa1.lifnr,
    lfa1.name1 as ad1,
   concat_with_space( lfa1.stras , lfa1.mcod3 , 1 ) as Satici_adresi
}
