
commit
--����� ����� ������ ���� 83 ��� ������ �� ��� ���
UPDATE 
    Device1
SET 
    LocationD = 'Israel'
WHERE 
    DeviceType = 83
    AND LastMaintenanceDate < ADD_MONTHS(SYSDATE, -12);

rollback
