@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connecting Routes'
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
define view entity ZVKSC_ConnectingRoutes_R
  as select from ZVKSR_ConnectingRoutes
  //To Child
  association [1..*] to ZVKSC_FlightDetails_R as _FlightDetails      on  $projection.AirlineID    = _FlightDetails.AirlineID
                                                                     and $projection.ConnectionID = _FlightDetails.ConnectionID
  //To Parent
  association [1..1] to ZVKSC_Airline_R       as _Airline            on  $projection.AirlineID = _Airline.AirlineID
  //Addtional Details   
  association [1..1] to ZVKSC_Airport_R       as _DepartureAirport   on  $projection.AirportFromID = _DepartureAirport.AirportID
  association [1..1] to ZVKSC_Airport_R       as _DestinationAirport on  $projection.AirportToID = _DestinationAirport.AirportID

{
  key AirlineID,
  key ConnectionID,
      AirportFromID,
      AirportToID,
      DepartureTime,
      ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Distance,
      DistanceUnit,

      //Departure Airport
      _DepartureAirport.AirportID     as DepartureAirportID,
      _DepartureAirport.AirportName   as DepartureAirportName,
      _DepartureAirport.City          as DepartureCity,
      _DepartureAirport.CountryCode   as DepartureCountryCode,

      //Destination Airport
      _DestinationAirport.AirportID   as DestinationAirportID,
      _DestinationAirport.AirportName as DestinationAirportName,
      _DestinationAirport.City        as DestinationCity,
      _DestinationAirport.CountryCode as DestinationCountryCode,

      /* Associations */
      _FlightDetails,
      _Airline
}
