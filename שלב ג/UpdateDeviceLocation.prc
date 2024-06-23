//DML Commands:


create or replace procedure UpdateDeviceLocation(p_DeviceId IN VARCHAR2, p_NewLocationD IN VARCHAR2
) is
begin
   UPDATE Device1
    SET LocationD = p_NewLocationD
    WHERE DeviceId = p_DeviceId;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No device found with the given DeviceId.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Device location updated successfully.');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
end UpdateDeviceLocation;
/
