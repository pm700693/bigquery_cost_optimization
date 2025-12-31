-- Example: partitioned and clustered table
CREATE TABLE dataset.events_partitioned
PARTITION BY DATE(event_timestamp)
CLUSTER BY user_id AS
SELECT * FROM dataset.events_raw;

-- Example: query using partitions
SELECT user_id, COUNT(*) FROM dataset.events_partitioned
WHERE DATE(event_timestamp) BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY user_id;
