#!/bin/bash
# Some loop and sed.
# for i in $(seq 01 12); do sed -n '/PM/p' $i.log; done
num=01

loop1() {
  while [ $num -lt 12 ]
    do
      sed -n '/PM/p' $num.log
      let num+=01                                                                                        # increment num
    done
  echo -e "\nThat's all volks."
}

loop2() {
  while [ $num -lt 12 ]
    do
      sed -n '/resume/p' $num.log
      let num+=01
    done
  echo -e "\nThat's all volksie."
}

loop1
loop2