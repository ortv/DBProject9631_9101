--main 1

DECLARE
    v_DeviceId VARCHAR2(20) := 'DEV12345';
    v_TotalTests NUMBER;
BEGIN
    -- Call function to calculate total tests
    v_TotalTests := CalculateTotalTests(v_DeviceId);
    DBMS_OUTPUT.PUT_LINE('Total Tests for Device ' || v_DeviceId || ': ' || v_TotalTests);

    -- Call procedure to insert new device
    InsertNewDevice('DEV54321', 1, 123, 1, 'Test Manufacturer', SYSDATE, SYSDATE, 'Test Location');
END;
