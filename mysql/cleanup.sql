DELETE FROM config;
DELETE FROM diff_items;
DELETE FROM diffs;
DELETE FROM snap_items;
DELETE FROM snapshots;
DELETE FROM config_hashes;
DELETE FROM rule_items;
DELETE FROM rule_logs;
DELETE FROM rule_statuses;
DELETE FROM rules;
DELETE FROM marker_items;
DELETE FROM markers;

DELETE FROM guard_change_packages;
DELETE FROM guard_validation_history;
DELETE FROM guard_validation_queue;
DELETE FROM guard_validation_states;