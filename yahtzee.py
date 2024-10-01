import sys, random

ones_g, twos_g, threes_g, fours_g, fives_g, sixes_g = -1, -1, -1, -1, -1, -1
three_of_a_kind_g, four_of_a_kind_g, full_house_g, small_straight_g, large_straight_g = -1, -1, -1, -1, -1 
sum_g, bonus_g, chance_g, yahtzee_g, total_score_g = -1, -1, -1, -1, -1

ones_computer_g, twos_computer_g, threes_computer_g, fours_computer_g, fives_computer_g, sixes_computer_g = -1, -1, -1, -1, -1, -1
three_of_a_kind_computer_g, four_of_a_kind_computer_g, full_house_computer_g, small_straight_computer_g, large_straight_computer_g = -1, -1, -1, -1, -1 
sum_computer_g, bonus_computer_g, chance_computer_g, yahtzee_computer_g, total_score_computer_g = -1, -1, -1, -1, -1

def close_program(a):
    agree_vars = ['r', 'R', 'Roll', 'roll']
    if a not in agree_vars:
        print('Thanks! Goodbye!')
        sys.exit() 

def roll_or_select(a):
    roll_vars = ['r', 'R', 'Roll', 'roll']
    select_vars = ['s', 'S', 'Select', 'select']
    if a in roll_vars:
        return True
    if a in select_vars:
        return False

def print_cube(cube_list):
    border = '+---+ ' * 5
    print(border)
    for i in range(len(cube_list)):
        #+---+
        #| i |
        #+---+        
        print(f'| {cube_list[i]} |', end=' ')
    print('\n' + border)

def print_table(cube_list):
    combination_list = ['Ones', 'Twos', 'Threes', 'Fours', 'Fives', 
                        'Sixes', 'Sum', 'Bonus', 'Three of a kind', 
                        'Four of a kind', 'Full House', 'Small straight',
                        'Large straight', 'Chance', 'YAHTZEE', 'TOTAL SCORE']
    global ones_g, twos_g, threes_g, fours_g, fives_g, sixes_g, sum_g, bonus_g, three_of_a_kind_g, four_of_a_kind_g, full_house_g,  small_straight_g, large_straight_g, chance_g, yahtzee_g, total_score_g
    global ones_computer_g, twos_computer_g, threes_computer_g, fours_computer_g, fives_computer_g, sixes_computer_g, three_of_a_kind_computer_g, four_of_a_kind_computer_g, full_house_computer_g, small_straight_computer_g, large_straight_computer_g, sum_computer_g, bonus_computer_g, chance_computer_g, yahtzee_computer_g, total_score_computer_g

    border_list = [6, 8, 15]
    
    count_list = [cube_list.count(1), cube_list.count(2), cube_list.count(3), 
                  cube_list.count(4), cube_list.count(5), cube_list.count(6)]
    ones = count_list[0] * 1
    twos = count_list[1] * 2
    threes = count_list[2] * 3 
    fours = count_list[3] * 4
    fives = count_list[4] * 5
    sixes = count_list[5] * 6

    sum_ = 0
    bonus = 0

    three_of_a_kind = 0
    if count_list.count(3):
        three_of_a_kind = sum(cube_list)
    
    four_of_a_kind = 0
    if count_list.count(4):
        four_of_a_kind = sum(cube_list)

    full_house = 0
    if count_list.count(3) and count_list.count(2):
        full_house = 25
    
    small_straight = 0
    if min(count_list[0:4]) > 0 or min(count_list[1:5]) > 0 or min(count_list[2:6]) > 0:
        small_straight = 30

    large_straight = 0
    if min(count_list[0:5]) > 0 or min(count_list[1:6]) > 0:
        large_straight = 40

    chance = sum(cube_list)
    
    yahtzee = 0
    if min(count_list) > 0:
        yahtzee = 50

    total_score = 0 

    result_list = [ones, twos, threes, fours, fives, sixes, sum_, bonus, three_of_a_kind, four_of_a_kind, full_house, small_straight, large_straight, chance, yahtzee, total_score]
    
    global_result_list = [ones_g, twos_g, threes_g, fours_g, fives_g, sixes_g, sum_g, 
                          bonus_g, three_of_a_kind_g, four_of_a_kind_g, full_house_g,
                          small_straight_g, large_straight_g, chance_g, yahtzee_g, 
                          total_score_g ]
    
    global_computer_result_list = [ones_computer_g, twos_computer_g, threes_computer_g, fours_computer_g, fives_computer_g, sixes_computer_g, sum_computer_g, bonus_computer_g,
                                   three_of_a_kind_computer_g, four_of_a_kind_computer_g, full_house_computer_g, small_straight_computer_g, 
                                   large_straight_computer_g, chance_computer_g, yahtzee_computer_g, total_score_computer_g]

    column_len = 18
    border_horizontal = f'+{'-' * 18}+{'-' * 8}+{'-' * 10}+'
    ignore_id_list = [6, 7, 15]
    print(border_horizontal)
    print(f'|{' ' * column_len}| Player | Computer |')
    print(border_horizontal)
    for i in range(len(combination_list)):
        if i in border_list:
                print(border_horizontal)
        if global_result_list[i] != -1:
            result_str = str(global_result_list[i])
        elif (result_list[i] != 0) and (max(cube_list) != 0):
            result_str = str(result_list[i])
        else:
            result_str = '0'
        
        if global_computer_result_list[i] != -1:
            computer_result_str = str(global_computer_result_list[i])
        else:
            computer_result_str = '0'

        print(f'|{i if i not in ignore_id_list and global_result_list[i] == -1 else len(str(i)) * ' '} ' + 
              combination_list[i] + ' ' * (column_len - len(combination_list[i]) - len(str(i)) - 1) + f'| {result_str}{' ' * (6 - len(result_str))} | {computer_result_str}{' ' * (8 - len(computer_result_str))} |' )
    print(border_horizontal)

def select_option_from_table(cube_list, id):
    count_list = [cube_list.count(1), cube_list.count(2), cube_list.count(3), 
                   cube_list.count(4), cube_list.count(5), cube_list.count(6)]
    
    global ones_g, twos_g, threes_g, fours_g, fives_g, sixes_g, sum_g, bonus_g, three_of_a_kind_g, four_of_a_kind_g, full_house_g,  small_straight_g, large_straight_g, chance_g, yahtzee_g, total_score_g 

    if id == 0:
        if ones_g == -1:
            ones_g = count_list[0] * 1
    if id == 1:
        if twos_g == -1:
            twos_g = count_list[1] * 2
    if id == 2:
        if threes_g == -1:
            threes_g = count_list[2] * 3
    if id == 3:
        if fours_g == -1:
            fours_g = count_list[3] * 4
    if id == 4:
        if fives_g == -1:
            fives_g = count_list[4] * 5
    if id == 5:
        if sixes_g == -1:
            sixes_g = count_list[5] * 6
    if id == 8:
        if three_of_a_kind_g == -1:
            if count_list.count(3):
                three_of_a_kind_g = sum(cube_list)
            else:
                three_of_a_kind_g = 0 
    if id == 9:
        if four_of_a_kind_g == -1:
            if count_list.count(4):
                four_of_a_kind_g = sum(cube_list)
            else:
                four_of_a_kind_g = 0
    if id == 10:
        if full_house_g == -1:
            if count_list.count(3) and count_list.count(2):
                full_house_g = 25
            else:
                full_house_g = 0
    if id == 11:
        if small_straight_g == -1:
            if min(count_list[0:4]) > 0 or min(count_list[1:5]) > 0 or min(count_list[2:6]) > 0:
                small_straight_g = 30
            else:
                small_straight_g = 0
    if id == 12:
        if large_straight_g == -1:
            if min(count_list[0:5]) > 0 or min(count_list[1:6]) > 0:
                large_straight_g = 40
            else:
                large_straight_g = 0
    if id == 13:
        if chance_g == -1:
            chance_g = sum(cube_list)
    if id == 14:
        if yahtzee_g == -1:
            if min(count_list) > 0:
                yahtzee_g = 50
            else:
                yahtzee_g = 0
    total_score_g = sum(c for c in [ones_g, twos_g, threes_g, fours_g, fives_g, sixes_g, three_of_a_kind_g, four_of_a_kind_g, full_house_g,  small_straight_g, large_straight_g, chance_g, yahtzee_g] if c > 0)

def throw_cube(cubeList, needToThrow):
    for i in range(len(cubeList)):
        if i+1 in needToThrow:
            cubeList[i] = random.randint(1, 6)
    return cubeList

def computer_step():
    global ones_computer_g, twos_computer_g, threes_computer_g, fours_computer_g, fives_computer_g, sixes_computer_g, three_of_a_kind_computer_g, four_of_a_kind_computer_g, full_house_computer_g, small_straight_computer_g, large_straight_computer_g, sum_computer_g, bonus_computer_g, chance_computer_g, yahtzee_computer_g, total_score_computer_g
    cubes_list = [random.randint(1, 6), random.randint(1, 6), random.randint(1, 6), random.randint(1, 6), random.randint(1, 6)]

    count_list = [cubes_list.count(1), cubes_list.count(2), cubes_list.count(3), 
                  cubes_list.count(4), cubes_list.count(5), cubes_list.count(6)]
    
    temp_results = []

    if ones_computer_g == -1:
        temp_results.append(count_list[0])
    else:
        temp_results.append(0)
    
    if twos_computer_g == -1:
        temp_results.append(count_list[1] * 2)
    else:
        temp_results.append(0)

    if threes_computer_g == -1:
        temp_results.append(count_list[1] * 3)
    else:
        temp_results.append(0)

    if fours_computer_g == -1:
        temp_results.append(count_list[1] * 4)
    else:
        temp_results.append(0)

    if fives_computer_g == -1:
        temp_results.append(count_list[1] * 5)
    else:
        temp_results.append(0)
    
    if sixes_computer_g == -1:
        temp_results.append(count_list[1] * 6)
    else:
        temp_results.append(0)
    
    if three_of_a_kind_computer_g == -1 and count_list.count(3):
        temp_results.append(sum(cubes_list))
    else:
        temp_results.append(0)

    if four_of_a_kind_computer_g == -1 and count_list.count(4):
        temp_results.append(sum(cubes_list))
    else:
        temp_results.append(0)

    if full_house_computer_g == -1 and (count_list.count(3) and count_list.count(2)):
        temp_results.append(25)
    else:
        temp_results.append(0)

    if small_straight_computer_g == -1 and (min(count_list[0:4]) > 0 or min(count_list[1:5]) > 0 or min(count_list[2:6]) > 0):
        temp_results.append(30)
    else:
        temp_results.append(0)

    if large_straight_computer_g == -1 and (min(count_list[0:5]) > 0 or min(count_list[1:6]) > 0):
        temp_results.append(40)
    else:
        temp_results.append(0)
    
    temp_results.append(0)
    temp_results.append(0)

    if chance_computer_g == -1:
        temp_results.append(sum(cubes_list))
    else:
        temp_results.append(0)

    if yahtzee_computer_g == -1 and (min(count_list) > 0):
        temp_results.append(50)
    else:
        temp_results.append(0)

    max_score = temp_results.index(max(temp_results))

    if max_score == 0: ones_computer_g = max(temp_results)
    if max_score == 1: twos_computer_g = max(temp_results)
    if max_score == 2: threes_computer_g = max(temp_results)
    if max_score == 3: fours_computer_g = max(temp_results)
    if max_score == 4: fives_computer_g = max(temp_results)
    if max_score == 5: sixes_computer_g = max(temp_results)
    if max_score == 6: three_of_a_kind_computer_g = max(temp_results)
    if max_score == 7: four_of_a_kind_computer_g = max(temp_results)
    if max_score == 8: full_house_computer_g = max(temp_results)
    if max_score == 9: small_straight_computer_g = max(temp_results)
    if max_score == 10: large_straight_computer_g = max(temp_results)
    if max_score == 13: chance_computer_g = max(temp_results)
    if max_score == 14: yahtzee_computer_g = max(temp_results)

    total_score_computer_g = sum(c for c in [ones_computer_g, twos_computer_g, threes_computer_g, fours_computer_g, fives_computer_g, sixes_computer_g, three_of_a_kind_computer_g, four_of_a_kind_computer_g, full_house_computer_g,  small_straight_computer_g, large_straight_computer_g, chance_computer_g, yahtzee_computer_g] if c > 0)

def computer_step_after_player(cubes_list):
    global ones_g, twos_g, threes_g, fours_g, fives_g, sixes_g
    global three_of_a_kind_g, four_of_a_kind_g, full_house_g, small_straight_g, large_straight_g, chance_g, yahtzee_g

    access_list = []

    if ones_g == -1:
        access_list.append(0)
    if twos_g == -1:
        access_list.append(1)
    if threes_g == -1:
        access_list.append(2)
    if fours_g == -1:
        access_list.append(3)
    if fives_g == -1:
        access_list.append(4)
    if sixes_g == -1:
        access_list.append(5)

    if three_of_a_kind_g == -1:
        access_list.append(8)
    if four_of_a_kind_g == -1:
        access_list.append(9)
    if full_house_g == -1:
        access_list.append(10)
    if small_straight_g == -1:
        access_list.append(11)
    if large_straight_g == -1:
        access_list.append(12)
    if chance_g == -1:
        access_list.append(13)
    if yahtzee_g == -1:
        access_list.append(14)

    print_table(cubes_list)
    try:
        selected_id = int(input('Select [0-5] or [8-14] option: '))
        while selected_id not in access_list:
            selected_id = int(input('Select [0-5] or [8-14] option: '))
        select_option_from_table(cubes_list, selected_id)
        computer_step()
        print_table([0, 0, 0, 0, 0])
    except:
        computer_step_after_player(cubes_list)

def dice_roll():
    cubes_list = [1, 2, 3, 4, 5]
    print_cube(cubes_list)
    close_program(input("Roll Dice or Exit? (R/e):"))
    cubes_list = throw_cube(cubes_list, [1, 2, 3, 4, 5])
    print_table(cubes_list)
    print_cube(cubes_list)

    for _ in range(2):
        if roll_or_select(input("Roll Dice or Select value from the table ? (R/s): ")):
            cubes_list = throw_cube(cubes_list, list(map(int, input("Select dices by space [1-5]: ").split())))
            print_table(cubes_list)
            print_cube(cubes_list)
        else:
            computer_step_after_player(cubes_list)
            return
        
    computer_step_after_player(cubes_list)
    
print('-' * 27 + '\n' + '| 🎲 Welcome to Yahtzee 🎲 |' + '\n' + '-' * 27 + '\n')

for i in range(13):
    dice_roll()

if total_score_g > total_score_computer_g:
    print('You won! 🎆')
elif total_score_g == total_score_computer_g:
    print('Your strengths are equal. Draw. 🤷‍♂️')
else:
    print('You lose! 😭')