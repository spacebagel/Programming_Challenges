20 \ The numbers list length
1 +

: RESULT
  1 DO
    I 15 mod 0= IF
      ." FizzBuzz"
    ELSE
      I 5 mod 0= IF
        ." Buzz"
      ELSE
        I 3 mod 0= IF
          ." Fizz"
        ELSE
          I .
        THEN
      THEN
    THEN
    space
  LOOP ;

RESULT cr