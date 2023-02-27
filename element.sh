#!/bin/bash

#script to read in variable from terminl and display information about first 10 elements in the periodic table

#CREATED BY DAVID FORBES, 2/26/2023

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"


DISPLAY_INFO(){
  echo hello world

}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."

else
  #if argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    SEARCH_RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")

  else
    #if argument is a symbol
    if [[ ${#1} -le 2 ]]
    then
      SEARCH_RESULT=$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")

    else
      #if argument is a string
      SEARCH_RESULT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE name = '$1'")
