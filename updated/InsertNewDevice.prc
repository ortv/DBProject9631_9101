create or replace procedure InsertNewDevice(p_DeviceId  in VARCHAR2, p_DeviceType  in number, p_SeriesNum IN NUMBER,
    p_VersionD IN NUMBER,
    p_Manufacturer IN VARCHAR2,
    p_PurchaseDate IN DATE,
    p_LastMaintenanceDate IN DATE,
    p_LocationD IN VARCHAR2) is
begin
  INSERT INTO Device1 (DeviceId, DeviceType, SeriesNum, VersionD, Manufacturer, PurchaseDate, LastMaintenanceDate, LocationD)
    VALUES (p_DeviceId, p_DeviceType, p_SeriesNum, p_VersionD, p_Manufacturer, p_PurchaseDate, p_LastMaintenanceDate, p_LocationD);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
end InsertNewDevice;
/
