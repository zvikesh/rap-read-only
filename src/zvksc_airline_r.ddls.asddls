@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline Carrier'
-- Metadata
@Metadata:{
 allowExtensions: true,
 ignorePropagatedAnnotations: true
}
-- Data Model
-- @VDM.viewType: #CONSUMPTION
-- Performance
@ObjectModel.usageType:{
    serviceQuality: #C,
    dataClass: #ORGANIZATIONAL,
    sizeCategory: #M
}
define view entity ZVKSC_Airline_R
  as select from ZVKSR_Airline
  //To Child
  association [1..*] to ZVKSC_ConnectingRoutes_R as _ConnectingRoutes on $projection.AirlineID = _ConnectingRoutes.AirlineID
{
  key AirlineID,
      AirlineName,
      CurrencyCode,
      @Semantics.user.createdBy:true
      LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,

      _ConnectingRoutes
}
