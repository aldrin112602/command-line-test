#!/usr/bin/bash
# Command line test

echo "My Command Line Test"
echo "Please choose the below options:"
echo "1. Sign in"
echo "2. Sign up"
echo "3. Exit"

echo "Please choose your option: "
read choosed
is_login=0

function take_test {
    echo "Please choose the below options:"
    echo "1. Take a test"
    echo "2. Exit"
    echo "Please choose your option: "
    read _choosed
    correct_ans=0
    if [[ $_choosed -eq 1 ]]; then
      question=("What is the color name of #000?" "What is the color name of #ff0?")
      ans=("black" "yellow")
      for i in ${!question[@]}; do
        echo "${question[$i]}"
        read your_ans
        if [[ $your_ans -eq "${ans[$i]}" ]]; then
          echo "Your answer is correct!"
          correct_ans++
        else
          echo "Your answer is wrong!, the correct answer is ${ans[$i]}"
        fi
      done
      echo "Congratulations! your score is $correct_ans"
    fi
}

if [[ $choosed -eq 1 ]]; then
  #sign in
  echo "Sign In"
  echo "Enter Username:"
  read uname
  echo "Enter Password:"
  read pswd
  
  #validate inputs
  LINE=1
  isUnamePass=0
  isPswdPass=0
  while read -r CURRENT_LINE; do
    if [ $LINE -eq 1 -a $CURRENT_LINE -eq $uname ]; then
      isUnamePass=1
    fi
    
    if [ $LINE -eq 2 -a $CURRENT_LINE -eq $pswd ]; then
      isPswdPass=1
    fi
    (( LINE++ ))
  done < "./data.txt"
  
  
  if [ $isUnamePass -eq 1 -a $isPswdPass -eq 1]; then
    #Signed in success
    echo "Signed In Successfully!"
    take_test
  else
    #Failed Sign in
    echo "Incorrect Username or Password"
  fi
elif [[ $choosed -eq 2 ]]; then
  #sign up
else 
  #exit
fi
