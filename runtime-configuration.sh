source ../dependencies.git/mysql/runtime-configuration.sh
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Missing MySQL configuration."
  echo "Did you run?"
  echo "$ dependencies.git/run-dependencies.sh"
  exit 1;
fi

source ../dependencies.git/redisearch/runtime-configuration.sh
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Missing Redis configuration."
  echo "Did you run?"
  echo "$ dependencies.git/run-dependencies.sh"
  exit 1;
fi