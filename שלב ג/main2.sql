DECLARE
    v_DeviceId VARCHAR2(50) := 'mGq097xGi939hWE558nYq336rQK762eYR713xIp127wVG867pL';
    v_LatestTestResult VARCHAR2(100);
BEGIN
    -- Call function to get the latest test result
    v_LatestTestResult := GetLatestTestResult(v_DeviceId);
    DBMS_OUTPUT.PUT_LINE('Latest Test Result for Device ' || v_DeviceId || ': ' || v_LatestTestResult);

    -- Call procedure to update device location
    UpdateDeviceLocation(v_DeviceId, 'New Test Location');
END;

