CREATE OR REPLACE FUNCTION validateMaintenance (
  AllowedPeriod IN NUMBER
) RETURN VARCHAR2
IS
  CURSOR device_cursor IS
    SELECT DeviceId, LastMaintenanceDate
    FROM Device1;

  device_rec device_cursor%ROWTYPE;--for calculating dates
  e_OverdueMaintenance EXCEPTION;
  v_error_message VARCHAR2(200);
  overdue_days NUMBER;
  
BEGIN
  OPEN device_cursor;
  
  LOOP
    FETCH device_cursor INTO device_rec;
    EXIT WHEN device_cursor%NOTFOUND;

    overdue_days := TRUNC(SYSDATE) - TRUNC(device_rec.LastMaintenanceDate);

    -- Check if the device's last maintenance date exceeds the allowed period
    IF overdue_days > AllowedPeriod THEN
      v_error_message := 'Device ' || device_rec.DeviceId || ' is overdue for maintenance by ' || (overdue_days - AllowedPeriod) || ' days.';
      RAISE e_OverdueMaintenance;
    END IF;
  END LOOP;

  CLOSE device_cursor;

  RETURN 'All devices are within the allowed maintenance period';
  
EXCEPTION
  WHEN e_OverdueMaintenance THEN
    RETURN v_error_message;
  WHEN OTHERS THEN
    RETURN 'An unexpected error occurred: ' || SQLERRM;
END validateMaintenance;
/
