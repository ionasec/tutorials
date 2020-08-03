#!/bin/bash
aws lambda invoke --function-name raz-mylambda-function --payload '{"key": "value"}' out
sed -i'' -e 's/"//g' out
sleep 15
aws logs get-log-events --log-group-name /aws/lambda/raz-mylambda-function --log-stream-name $(cat out) --limit 5