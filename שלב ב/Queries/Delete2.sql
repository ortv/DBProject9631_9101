
--מוחק מכשיר מגרסא מסוימת
--מוחק מכל הטבלאות הקשורות בו

Commit
BEGIN
    -- Delete related records in Stove1
    DELETE FROM Stove1
    WHERE DeviceId IN (
        SELECT DeviceId 
        FROM Device1
        WHERE VersionD =0
    );

    -- Delete related records in Test_Device1
    DELETE FROM Test_Device1
    WHERE DeviceId IN (
        SELECT DeviceId 
        FROM Device1
        WHERE VersionD =0
    );

    -- Delete related records in DeviceTest_Tube1
    DELETE FROM DeviceTest_Tube1
    WHERE DeviceId IN (
        SELECT DeviceId 
        FROM Device1
        WHERE VersionD =0
    );

    -- Delete devices of type 83
    DELETE FROM Device1
    WHERE VersionD =0;
END;
rollback
