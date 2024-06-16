

--מוחק תרומות דם שנעשו לפני יותר משנתיים
--מוחק מכל הטבלאות הקשורות בזה
commit
BEGIN
    -- Delete related records in Refrigerator1
    DELETE FROM Refrigerator1
    WHERE DonationID IN (
        SELECT DonationID 
        FROM Blood_Donation1
        WHERE DonationDate < ADD_MONTHS(SYSDATE, -24)
    );

    -- Delete related records in Test_Device1
    DELETE FROM Test_Device1
    WHERE TestID IN (
        SELECT TestID 
        FROM Test_1
        WHERE BloodDonationID IN (
            SELECT DonationID 
            FROM Blood_Donation1
            WHERE DonationDate < ADD_MONTHS(SYSDATE, -24)
        )
    );

    -- Delete related records in Blood_Donation1
    DELETE FROM Blood_Donation1
    WHERE DonationDate < ADD_MONTHS(SYSDATE, -24);

    -- Delete records in Test_1
    DELETE FROM Test_1
    WHERE BloodDonationID IN (
        SELECT DonationID 
        FROM Blood_Donation1
        WHERE DonationDate < ADD_MONTHS(SYSDATE, -24)
    );

END;
rollback
