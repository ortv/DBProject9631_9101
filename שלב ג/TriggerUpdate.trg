create or replace trigger trg_UpdateDeviceLocation
  after update
  on device1 
  for each row
declare
  -- local variables here
begin
    IF :OLD.LocationD <> :NEW.LocationD THEN
        DBMS_OUTPUT.PUT_LINE('DeviceId: ' || :OLD.DeviceId || ' Location updated from ' || :OLD.LocationD || ' to ' || :NEW.LocationD);
    END IF;
end trg_UpdateDeviceLocation;
/
