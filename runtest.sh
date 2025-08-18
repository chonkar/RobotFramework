#!/bin/bash

# Navigate to the Jenkins workspace
cd $WORKSPACE

# Cleaning old results
echo "=== Cleaning old results ==="
rm -rf Results/robot_results
rm -rf Results/allure_results
rm -rf Results/allure_report

# Running Robot Framework Tests
echo "=== Running Robot Framework Tests ==="
robot -d Results/robot_results --listener allure_robotframework\;Results/allure_results Tests

# Generating Allure Report
echo "=== Generating Allure Report ==="
allure generate Results/allure_results --clean -o Results/allure_report

echo "=== All Done! ==="