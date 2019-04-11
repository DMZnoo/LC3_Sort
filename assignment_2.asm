.ORIG x3000



    lea r0, MY_NAME ;load first output

    puts

    and r2,r2,#0

    

    AND r3, r3, #0 ;initialize for size count

    AND r5, r5, #0 ;initialize for size count

    



; print the input prompt



    LEA r0, PRINT_INSTRUCTION ;load instruction

    PUTS

    LEA r4, ARRAY ;load array size of 9

    GETSTRING ;get user input

    GETC

    OUT

    ld r1, negnum ;load -48 to subtract from user input to get the numeric value to be stored in the array

    add r2,r0,r1 ;result of the subtraction being stored in r2

    Brnz COUNT_NUMBER ;if it is positive, then it is a number not a space (space is 32 in ascii)

    STR r0, r4, #0 ;store the number in r4

    

    ADD r3, r3, #1 ; same as i++

    ADD r4, r4, #1 ;go to next index in the array

    add r5,r5,#1 ; same as i++

    COUNT_NUMBER ;jump to here if it was a space

    ld r1, NEWLINE_NEG ;check if user returned

    add r2,r0,r1

    BRz EXIT_LOOP ;if he/she did, exit loop



    BR GETSTRING

EXIT_LOOP





    LEA R0, OUTPUTSTRING ;return what was typed in

    PUTS

    LEA R4, ARRAY

   

    



    LOOP

    ldr r0, r4, #0

    out

    ld r0, SPACE ;add space in between to match the format required

    out

    add r4,r4,#1

    add r3,r3,#-1

    BRz DONE

   

    

BR LOOP



DONE





lea r0, howmany_1 ;output string of how many numbers in the array

puts



ld r0, number

add r0,r0,r5 ;numeric value of the size of r4

out



lea r0, howmany_2 ;end of the output string

puts





;bubble sort code

add r5,r5,#-1 ;start with size-1
and r3,r3,#0 ;will be used for outputting the array again
add r3,r5,r3
SORTING
and r6,r6,#0
lea r4, ARRAY
INNER ;inner loop will be another loop for comparing the adjacent indexes i and i+1

ldr r0,r4,#0 ;load ith value
add r4,r4,#1
ldr r1,r4,#0 ;load (i+1)th value

not r2,r1
add r2,r2,#1 ;2's complement the (i+1)th value
add r2,r0,r2 ;compare
brnz PASS ;if ith is bigger, then swap or else pass it off
add r4,r4,#-1
str r1,r4,#0
add r4,r4,#1
str r0,r4,#0
PASS

add r6,r6,#1 ;add count of the inner loop
not r2,r5
add r2,r2,#1
add r2,r6,r2 ;check if the inner loop reached its end (meaning reached r5 which is the size)
brn INNER



add r5,r5,#-1 ;decrement the size
brz EXIT ;if done, exit out

BR SORTING

EXIT


lea r0, smallest ;smallest number output string
puts

lea r4, ARRAY
ldr r0,r4,#0 ;first number in the array is the smallest, if done right
out



lea r0, biggest ;biggest number output string
puts


add r4,r4,r3 ;if you add the r3, which was stored before the loop (since r5 is now 0, its useless), you'll get to the end of the array
ldr r0,r4,#0
out




lea r0, sorted ;sorted list output string
puts


add r3,r3,#1
lea r4, ARRAY

    LOOP_2

    ldr r0, r4, #0

    out

    ld r0, SPACE

    out

    add r4,r4,#1

    add r3,r3,#-1

    BRz FINISHED


BR LOOP_2

FINISHED



HALT

     PRINT_INSTRUCTION .stringz "Please enter a list of numbers from 1-9 separated by spaces: "    

    OUTPUTSTRING .stringz "\nYou have entered: "

    MY_NAME .stringz "Jinwoo Lee :18018154\n"

    NEWLINE_NEG .FILL x-000A

    SPACE .fill x0020

    ARRAY .blkw #19

    howmany_1 .stringz "\nThere are "

    howmany_2 .stringz " numbers in the list.\n"

    number .fill #48

    negnum .fill x-0030

    smallest .stringz "The smallest number is: "

    biggest .stringz "\nThe biggest number is: "

    sorted .stringz "\nThe sorted list is: "

    

.END
        