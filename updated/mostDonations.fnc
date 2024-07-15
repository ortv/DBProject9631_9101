CREATE OR REPLACE FUNCTION mostDonations (
  FromDate IN DATE,
  ToDate IN DATE
) RETURN VARCHAR2 
IS
  FunctionResult VARCHAR2(100);
  MostDonationCount NUMBER;
  MostDonorID VARCHAR2(50);
BEGIN
  BEGIN
    SELECT DonorID, COUNT(DonationID) AS DonationCount
    INTO MostDonorID, MostDonationCount
    FROM Blood_Donation1
    WHERE DonationDate BETWEEN FromDate AND ToDate
    GROUP BY DonorID
    ORDER BY DonationCount DESC
    FETCH FIRST 1 ROWS ONLY; -- Use the correct Oracle syntax for fetching the first row

    FunctionResult := MostDonorID || ', ' || MostDonationCount;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      FunctionResult := 'No donations found in the given date range';
    WHEN OTHERS THEN
      FunctionResult := 'An error occurred: ' || SQLERRM;
  END;
  RETURN FunctionResult;
END mostDonations;
/
