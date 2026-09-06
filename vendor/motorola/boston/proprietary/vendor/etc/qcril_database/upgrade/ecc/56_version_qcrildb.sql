
CREATE TABLE IF NOT EXISTS qcril_properties_table (property TEXT, def_val TEXT, value TEXT, PRIMARY KEY(property));
UPDATE qcril_properties_table set value='56' where property='qcrildb_version';

DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '110';
DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '119';
DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '120';
DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '122';
DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '123';
DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '125';
DELETE FROM qcril_emergency_source_mcc_mnc_table where MCC = '704' AND MNC = '02' AND NUMBER = '*911';



