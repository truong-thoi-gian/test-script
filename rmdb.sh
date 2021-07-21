#!/bin/bash

UUID=$(($(date +%s%N)/1000000))-$RANDOM-$RANDOM-$RANDOM-$RANDOM
PROJECT_PATH="/home/test/projects/minikura-userapi"
SSH_HOST="test@172.16.110.222"

COMMAND_DOC="php artisan db:seed"
COMMAND_RUN="docker-compose exec -u test -T web sh -c '$COMMAND_DOC'"

chmod 400 test_key
ssh -i ./test_key $SSH_HOST "$COMMAND_RUN";