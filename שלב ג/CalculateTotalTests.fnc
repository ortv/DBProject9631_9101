-- explicit cursor
create or replace function CalculateTotalTests(p_DeviceId IN VARCHAR2) return number 
IS
    v_TotalTests NUMBER := 0;
    CURSOR c_Tests IS
        SELECT COUNT(*) AS total_tests
        FROM Test_Device1
        WHERE DeviceId = p_DeviceId;
BEGIN
    OPEN c_Tests;
    FETCH c_Tests INTO v_TotalTests;
    CLOSE c_Tests;
    RETURN v_TotalTests;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN 0;
END CalculateTotalTests;
/
