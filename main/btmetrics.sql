-- Create DB
create database if not exists BTMetrics;

-- use DB
use btmetrics;

-- Loaded the predicted and historical dataset using the Table Data Import Wizard
-- Loaded them as historical_values and predicted_values
select * from historical_values;
select * from predicted_values;

-- Fix date column in historical_value table
-- Create new column
ALTER TABLE historical_values
ADD new_date DATE;

-- Set new column to contain correctly formatted date data
UPDATE historical_values
SET new_date = STR_TO_DATE(date, '%d/%m/%Y');


-- Fix date column in predicted_value table
-- Create new column
ALTER TABLE predicted_values
ADD new_model_run_date DATE;

ALTER TABLE predicted_values
ADD new_prediction_date DATE;

-- Set new column to contain correctly formatted date data
UPDATE predicted_values
SET new_model_run_date = STR_TO_DATE(model_run_date, '%d/%m/%Y');

UPDATE predicted_values
SET new_prediction_date = STR_TO_DATE(prediction_date, '%d/%m/%Y');


-- Join both tables using date and time_series column, then save in a VIEW "hist_pred"
CREATE VIEW hist_pred AS
select h.new_date as historical_date, p.new_prediction_date as prediction_date,
h.time_series_name as historical_time_series_name, p.time_series_name as prediction_time_series_date,
h.historical_value as historical_value, p.predicted_value as predicted_value
FROM
    historical_values AS h
INNER JOIN
    predicted_values AS p
ON
    h.new_date = p.new_prediction_date
    AND
    h.time_series_name = p.time_series_name;

-- checking the hist_pred view    
select * from hist_pred;
    
-- Create view (hist_pred2) to store necessary columns from the hist_pred table
CREATE VIEW hist_pred2 AS
select historical_date as the_date, historical_time_series_name as time_series_name,
historical_value, predicted_value
FROM hist_pred;


-- checking the hist_pred2 view    
select * from hist_pred2;


-- storing each time_series in a view
CREATE VIEW timeseries_0 AS
select * from hist_pred2
where time_series_name = "time_series_0";

CREATE VIEW timeseries_1 AS
select * from hist_pred
where time_series_name = "time_series_1";

CREATE VIEW timeseries_2 AS
select * from hist_pred2
where time_series_name = "time_series_2";

CREATE VIEW timeseries_3 AS
select * from hist_pred2
where time_series_name = "time_series_3";

CREATE VIEW timeseries_4 AS
select * from hist_pred2
where time_series_name = "time_series_4";

CREATE VIEW timeseries_5 AS
select * from hist_pred2
where time_series_name = "time_series_5";

CREATE VIEW timeseries_6 AS
select * from hist_pred2
where time_series_name = "time_series_6";

CREATE VIEW timeseries_7 AS
select * from hist_pred2
where time_series_name = "time_series_7";

CREATE VIEW timeseries_8 AS
select * from hist_pred2
where time_series_name = "time_series_8";

CREATE VIEW timeseries_9 AS
select * from hist_pred2
where time_series_name = "time_series_9";


-- Querying some of the views
select * from timeseries_0;
select * from timeseries_5;


-- Create table to store final result
Create table Result
(
	TimeSeriesName text,
    MeanAbsoluteError double,
    RootMeanSquaredError double,
    MeanAbsolutePercentageError double,
    SymmMeanAbsolutePercentageError double,
    RSquared double,
    ForcastBias double    
);

-- Fill Result table with time_series
INSERT INTO Result (TimeSeriesName)
VALUES
    ('time_series_0'),
    ('time_series_1'),
    ('time_series_2'),
    ('time_series_3'),
    ('time_series_4'),
    ('time_series_5'),
    ('time_series_6'),
    ('time_series_7'),
    ('time_series_8'),
    ('time_series_9');

select * from result;


-- Update "Result" table with metric results *for each time_series
UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_0),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_0),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_0),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_0),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_0), 2)) / COUNT(*))) FROM timeseries_0),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_0)
WHERE TimeSeriesName = "time_series_0";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_1),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_1),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_1),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_1),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_1), 2)) / COUNT(*))) FROM timeseries_1),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_1)
WHERE TimeSeriesName = "time_series_1";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_2),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_2),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_2),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_2),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_2), 2)) / COUNT(*))) FROM timeseries_2),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_2)
WHERE TimeSeriesName = "time_series_2";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_3),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_3),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_3),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_3),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_3), 2)) / COUNT(*))) FROM timeseries_3),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_3)
WHERE TimeSeriesName = "time_series_3";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_4),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_4),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_4),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_4),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_4), 2)) / COUNT(*))) FROM timeseries_4),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_4)
WHERE TimeSeriesName = "time_series_4";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_5),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_5),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_5),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_5),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_5), 2)) / COUNT(*))) FROM timeseries_5),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_5)
WHERE TimeSeriesName = "time_series_5";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_6),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_6),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_6),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_6),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_6), 2)) / COUNT(*))) FROM timeseries_6),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_6)
WHERE TimeSeriesName = "time_series_6";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_7),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_7),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_7),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_7),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_7), 2)) / COUNT(*))) FROM timeseries_7),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_7)
WHERE TimeSeriesName = "time_series_7";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_8),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_8),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_8),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_8),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_8), 2)) / COUNT(*))) FROM timeseries_8),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_8)
WHERE TimeSeriesName = "time_series_8";


UPDATE RESULT
	SET MeanAbsoluteError = (SELECT AVG(ABS(historical_value - predicted_value)) FROM timeseries_9),
		RootMeanSquaredError = (SELECT SQRT(AVG(POW(historical_value - predicted_value, 2))) FROM timeseries_9),
        MeanAbsolutePercentageError = (SELECT AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 FROM timeseries_9),
        SymmMeanAbsolutePercentageError = (SELECT 100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) FROM timeseries_9),
        RSquared = (SELECT 1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_9), 2)) / COUNT(*))) FROM timeseries_9),
        ForcastBias = (SELECT AVG(historical_value - predicted_value) FROM timeseries_9)
WHERE TimeSeriesName = "time_series_9";


-- Final Table with Metric Result
select * from result;