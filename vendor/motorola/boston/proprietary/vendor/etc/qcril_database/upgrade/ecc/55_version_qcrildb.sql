
CREATE TABLE IF NOT EXISTS qcril_properties_table (property TEXT, def_val TEXT, value TEXT, PRIMARY KEY(property));
UPDATE qcril_properties_table set value='55' where property='qcrildb_version';

DELETE FROM qcril_emergency_source_mcc_table where MCC = '602' AND NUMBER = '123';
DELETE FROM qcril_emergency_source_mcc_table where MCC = '602' AND NUMBER = '121';
DELETE FROM qcril_emergency_source_mcc_table where MCC = '602' AND NUMBER = '180';
INSERT OR REPLACE INTO "qcril_emergency_source_voice_table" VALUES('602','123','','full');
INSERT OR REPLACE INTO "qcril_emergency_source_voice_table" VALUES('602','121','','full');
INSERT OR REPLACE INTO "qcril_emergency_source_voice_table" VALUES('602','180','','full');


