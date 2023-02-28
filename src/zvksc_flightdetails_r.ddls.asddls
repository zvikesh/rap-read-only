@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Details'
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
define view entity ZVKSC_FlightDetails_R
  as select from ZVKSR_FlightDetails
  //To Parent
  association [1] to ZVKSC_ConnectingRoutes_R as _Connection on  $projection.ConnectionID = _Connection.ConnectionID
                                                             and $projection.AirlineID    = _Connection.AirlineID
  //Addtional Details
  association [1] to ZVKSC_Airline_R          as _Airline    on  $projection.AirlineID = _Airline.AirlineID
{
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Carrier_StdVH', element: 'AirlineID'}}]
  key AirlineID,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Connection_STDVH', element: 'ConnectionID'} }]
  key ConnectionID,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      SeatPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency'  } }]
      CurrencyCode,
      PlaneTypeID,
      SeatsMax,
      SeatsOccupied,

      /* Associations */
      _Connection,
      _Airline
}
