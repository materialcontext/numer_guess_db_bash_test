#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -A --tuples-only -c"

SECRET=$(($RANDOM % 1000))
TRIES=0
GUESS=0

# get username
echo "Enter your username:"
read USERNAME

RECORD=$($PSQL "SELECT games_played, best_game FROM user_records WHERE username='$USERNAME'")

# handle new user or returning user
if [[ -z $RECORD ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO user_records(username) values('$USERNAME')")
  IFS=" | " read GAMES BEST <<< "0 | 999"

else
  IFS=" | " read GAMES BEST <<< $RECORD
  echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
fi

# loop until number is found
echo "Guess the secret number between 1 and 1000:"
while [ $GUESS -ne $SECRET ]
do
  read GUESS
  if [[ ! "$GUESS" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    [ $GUESS -gt $SECRET ] && echo "It's lower than that, guess again:"
    [ $GUESS -lt $SECRET ] && echo "It's higher than that, guess again:"
  fi
  ((TRIES++))
done

# handle win
((GAMES++))
echo "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"

# check if new best and update records
BEST=$(( $TRIES < $BEST ? $TRIES : $BEST ))
UPDATE_RECORDS=$($PSQL "UPDATE user_records set games_played=$GAMES, best_game=$BEST where username='$USERNAME'")