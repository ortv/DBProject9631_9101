--inplicit cursor
create or replace function GetLatestTestResult(p_DeviceId IN VARCHAR2) return varchar2 
IS
    v_TestResult VARCHAR2(100);
BEGIN
    SELECT t.ResultT INTO v_TestResult
    FROM Test_1 t
    JOIN Test_Device1 td ON t.TestID = td.TestID
    WHERE td.DeviceId = p_DeviceId
    ORDER BY t.TestDate DESC
    FETCH FIRST 1 ROWS ONLY;

    RETURN v_TestResult;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No test results found';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN 'Error';
END GetLatestTestResult;
/
