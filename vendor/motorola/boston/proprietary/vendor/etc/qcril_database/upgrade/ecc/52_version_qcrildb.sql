
CREATE TABLE IF NOT EXISTS qcril_properties_table (property TEXT, def_val TEXT, value TEXT, PRIMARY KEY(property));
UPDATE qcril_properties_table set value='52' where property='qcrildb_version';

INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('338','100','110','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('338','100','112','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('338','100','119','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('338','100','911','','');

INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('342','600','110','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('342','600','112','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('342','600','119','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('342','600','911','','');

INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('346','140','110','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('346','140','112','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('346','140','119','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('346','140','911','','');

INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('364','39','911','','');
INSERT OR REPLACE INTO "qcril_emergency_source_mcc_mnc_table" VALUES('364','39','919','','');



