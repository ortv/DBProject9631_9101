
SELECT
    DeviceId, 
    DeviceType, 
    Manufacturer, 
    LocationD, 
    LastMaintenanceDate 
FROM 
    Device1
WHERE 
    LocationD = '&location' 
    AND DeviceType IN (&<name="devType" list="select Distinct DeviceType from Device1 "  multiselect="yes">)
