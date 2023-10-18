-- Calculating the Metrics for each time_series
SELECT
	AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
	SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
	AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
	100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
	1 - (
		(SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
		/ 
		(SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_0), 2)) / COUNT(*))
	) AS R_squared,
	AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_0;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_1), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_1;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_2), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_2;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_3), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_3;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_4), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_4;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_5), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_5;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_6), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_6;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_7), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_7;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - ((SUM(POW(historical_value - predicted_value, 2)) / COUNT(*)) / (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_8), 2)) / COUNT(*))) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_8;


SELECT
    AVG(ABS(historical_value - predicted_value)) AS MeanAbsoluteError,
    SQRT(AVG(POW(historical_value - predicted_value, 2))) AS RootMeanSquaredError,
    AVG(ABS((historical_value - predicted_value) / historical_value)) * 100 AS MeanAbsolutePercentageError,
    100 * AVG(2 * ABS(historical_value - predicted_value) / (historical_value + predicted_value)) AS SymmMeanAbsolutePercentageError,
    1 - (
        (SUM(POW(historical_value - predicted_value, 2)) / COUNT(*))
        / 
        (SUM(POW(historical_value - (SELECT AVG(historical_value) FROM timeseries_9), 2)) / COUNT(*))
    ) AS R_squared,
    AVG(historical_value - predicted_value) AS Forecast_Bias
FROM timeseries_9;
