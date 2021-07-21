#!/bin/bash

UUID=$RANDOM-$RANDOM-$RANDOM-$RANDOM
PROJECT_PATH="/home/test/projects/minikura-userapi"
SSH_HOST="test@172.16.110.222"

COMMAND_DOC="vendor/bin/phpunit --verbose --filter testRun ApiTestBase tests/ApiTestBase.php $UUID"
COMMAND_RUN="docker-compose exec -u test -T web sh -c '$COMMAND_DOC'"

chmod 400 test_key

#ssh -i ./test_key $SSH_HOST "mkdir $PROJECT_PATH/tests/tmp";
#ssh -i ./test_key $SSH_HOST "chmod -R 777 $PROJECT_PATH/tests/tmp";
ssh -i ./test_key $SSH_HOST "mkdir $PROJECT_PATH/tests/tmp/$UUID && chmod -R 777 $PROJECT_PATH/tests/tmp/$UUID";
ssh -i ./test_key $SSH_HOST "mkdir $PROJECT_PATH/tests/tmp/$UUID/input && chmod -R 777 $PROJECT_PATH/tests/tmp/$UUID/input";

scp -i ./test_key -r ./input/* $SSH_HOST:$PROJECT_PATH/tests/tmp/$UUID/input;
ssh -i ./test_key $SSH_HOST "$COMMAND_RUN";
scp -i ./test_key -r $SSH_HOST:$PROJECT_PATH/tests/tmp/$UUID/output ./;