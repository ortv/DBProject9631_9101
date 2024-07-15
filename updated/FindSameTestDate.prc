CREATE OR REPLACE PROCEDURE FindSameTestDate (
  p_DeviceId1 IN VARCHAR2,
  p_DeviceId2 IN VARCHAR2
) IS
  -- Variables to store test counts
  v_Device1_TestCount INT := 0;
  v_Device2_TestCount INT := 0;
  v_TestDate DATE;

  -- Cursor to fetch test counts for each device on each date
  CURSOR test_cursor IS
    SELECT t.TestDate, 
           COUNT(CASE WHEN td.DeviceId = p_DeviceId1 THEN 1 END) AS Device1_TestCount,
           COUNT(CASE WHEN td.DeviceId = p_DeviceId2 THEN 1 END) AS Device2_TestCount
    FROM Test_Device1 td
    JOIN Test_1 t ON td.TestID = t.TestID
    GROUP BY t.TestDate
    HAVING COUNT(CASE WHEN td.DeviceId = p_DeviceId1 THEN 1 END) = COUNT(CASE WHEN td.DeviceId = p_DeviceId2 THEN 1 END);

BEGIN
  -- Open the cursor
  OPEN test_cursor;

  -- Loop through the cursor results
  LOOP
    FETCH test_cursor INTO v_TestDate, v_Device1_TestCount, v_Device2_TestCount;
    EXIT WHEN test_cursor%NOTFOUND;

    -- Compare and print results when counts are equal
    DBMS_OUTPUT.PUT_LINE('On ' || TO_CHAR(v_TestDate, 'YYYY-MM-DD') || ', ' || p_DeviceId1 || ' had ' || v_Device1_TestCount || ' tests and ' || p_DeviceId2 || ' had ' || v_Device2_TestCount || ' tests.');
  END LOOP;

  -- Close the cursor
  CLOSE test_cursor;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No common test dates found for ' || p_DeviceId1 || ' and ' || p_DeviceId2);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END FindSameTestDate;
/
