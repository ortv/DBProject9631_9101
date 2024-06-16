
--����� �� ��� ������
--������ ���� ����� ������ ����� �����. ���� �� �� ���� ������ ����� ������ ���� ��� ������ ������
-- ���� �� ���� �� ���� ������ ��� ����� �� ��� ����� �������� LAG
--��� ���� �� ������ �� Device1,Test_Device1,Test_1 ���� �� ����� ���� ������.
--�������� �������� ���� �� ���� ����� �� �������
--���� �� ���� ������ ����� �� ���� ������ ��� ����� ���� �� �����

WITH TestIntervals AS (
    SELECT
        d.DeviceId,
        d.DeviceType,
        d.LastMaintenanceDate,
        t.TestID,
        t.TestDate,
        LAG(t.TestDate) OVER (PARTITION BY d.DeviceId ORDER BY t.TestDate) AS PrevTestDate
    FROM 
        Device1 d
    LEFT JOIN 
        Test_Device1 td ON d.DeviceId = td.DeviceId
    LEFT JOIN 
        Test_1 t ON td.TestID = t.TestID
)
SELECT
    DeviceId,
    DeviceType,
    LastMaintenanceDate,
    COUNT(TestID) AS NumberOfTests,
    AVG(TestDate - PrevTestDate) AS AvgTimeBetweenTests
FROM
    TestIntervals
GROUP BY
    DeviceId,
    DeviceType,
    LastMaintenanceDate
ORDER BY
    NumberOfTests DESC;
