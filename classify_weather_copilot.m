
% Generate synthetic weather data
numSamples = 1000;
temperature = randi([0, 40], numSamples, 1); % Temperature in degrees Celsius
humidity = randi([0, 100], numSamples, 1); % Humidity in percentage
windSpeed = randi([0, 20], numSamples, 1); % Wind speed in km/h

% Create labels based on conditions
labels = strings(numSamples, 1);
for i = 1:numSamples
    if temperature(i) > 30 && humidity(i) < 50
        labels(i) = 'Sunny';
    elseif temperature(i) < 15
        labels(i) = 'Cold';
    else
        labels(i) = 'Rainy';
    end
end

% Create a table for the dataset
weatherData = table(temperature, humidity, windSpeed, labels);

% Display the first few rows of the dataset
disp(head(weatherData));

% Train a decision tree classifier
treeModel = fitctree(weatherData, 'labels');

% Predict using the trained model
predictedLabels = predict(treeModel, weatherData);

% Display the confusion matrix
figure;
confusionchart(weatherData.labels, predictedLabels);
title('Confusion Matrix for Weather Classification');