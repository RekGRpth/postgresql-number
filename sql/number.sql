-- unpacked representation
SELECT '0'::number, pg_column_size('0'::number);
SELECT '1'::number, pg_column_size('1'::number);
SELECT '-1'::number, pg_column_size('-1'::number);

CREATE TABLE num (
	n1 number,
	n2 number
);

INSERT INTO num
	VALUES (NULL, '0'),
		('-1', '1'),
		('-128', '127'),
		('-129', '128'),
		('-32768', '32767'),
		('-32769', '32768'),
		('-8388608', '8388607'),
		('-8388609', '8388608'),
		('-2147483648', '2147483647'),
		('-2147483649', '2147483648'),
		('-549755813888', '549755813887'),
		('-549755813889', '549755813888'),
		('-140737488355328', '140737488355327'),
		('-140737488355329', '140737488355328'),
		('-36028797018963968', '36028797018963967'),
		('-36028797018963969', '36028797018963968'),
		('-9223372036854775808', '9223372036854775807');

-- packed representation
SELECT n1, n2, pg_column_size(n1), pg_column_size(n2) FROM num;

-- casts
SELECT number(1); -- explicit call
SELECT 1::number; -- cast from int
SELECT 549755813887::number; -- cast from bigint
SELECT 1::number + 2::number; -- implicit cast to bigint