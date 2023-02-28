@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport'
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
define view entity ZVKSC_Airport_R
  as select from ZVKSR_Airport
{
  key AirportID,
      AirportName,
      City,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Country', element: 'Country'  } }]
      CountryCode
}
