CREATE OR REPLACE PROCEDURE MainProcedure
IS
  v_AllowedPeriod NUMBER := 180; -- Example allowed period in days for maintenance
  v_ValidationResult VARCHAR2(200);

  -- Parameters for UpdateDeviceLocation procedure
  v_DeviceId VARCHAR2(50) := 'D001';
  v_NewLocationD VARCHAR2(50) := 'NewLocation';

BEGIN
  -- Call the validateMaintenance function
  BEGIN
    v_ValidationResult := validateMaintenance(v_AllowedPeriod);
    DBMS_OUTPUT.PUT_LINE('Result of validateMaintenance: ' || v_ValidationResult);
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while calling validateMaintenance: ' || SQLERRM);
  END;

  -- Call the UpdateDeviceLocation procedure
  BEGIN
    UpdateDeviceLocation(
      p_DeviceId     => v_DeviceId, 
      p_NewLocationD => v_NewLocationD
    );
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while calling UpdateDeviceLocation: ' || SQLERRM);
  END;
END MainProcedure;
