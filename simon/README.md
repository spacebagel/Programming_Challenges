# The Simon game (SQL only)

This is a Simon game written only in PostgreSQL.

![Simon Circle](https://github.com/user-attachments/assets/109c9835-3146-4bde-b21b-0d1fa0505d51)

## How to use
1. Enter to psql with settings for the current game view:
```
psql -U <USER> -d <DATABASE> \encoding=UTF8
\pset pager off
\pset format unaligned
\pset footer off
\pset tuples_only on
```

`<USER>` - postgre user name

`<DATABASE>` - Simon game database name

![Example](https://github.com/user-attachments/assets/75f335f7-7bc4-43c4-add9-16cae48eb62e)

![Input settings](https://github.com/user-attachments/assets/362507b2-0774-4f70-878d-3c164647b593)

2. Start the main part of game. Use the `select simon_game();` command

![Start the game](https://github.com/user-attachments/assets/048bab57-6b91-4e65-980b-e008286ad641)

3. Remember all selected colors:

![Start the game](https://github.com/user-attachments/assets/8e2e0bf1-bd93-4f7a-a827-87a710fc240b)

4. Check your answer follow the `select hi_simon('ANSWER');` command

`ANSWER` - color sequance (r - red, g - green, y - yellow, b - blue)

![Check the answer](https://github.com/user-attachments/assets/750a215c-e13e-4054-9b09-47c467ed3294)

![Yeeee](https://github.com/user-attachments/assets/a36de958-fe8d-4064-94a6-b0cfc41a19c9)


## Installation guide
Steps to install:
1. Clone this repository
2. Create new database

   For example, with pgAdmin GUI:

   ![Adding database step 1](https://github.com/user-attachments/assets/51d96fe7-e7ec-40f5-8afd-379a5f321ae1)
   
   ![Adding database step 2](https://github.com/user-attachments/assets/9b8941cf-9378-4ae8-baa1-0de68444be59)
   
4. Restore the database from `simon_db_backup.sql` file
  In pgAdmin:
 
    ![Restoring database step 1](https://github.com/user-attachments/assets/137c3eea-8342-46c3-81d4-3c07e59f060d)
    
    ![Restoring database step 2](https://github.com/user-attachments/assets/bb1610bb-dca5-4be7-8f40-2620b6e9977c)
    
    ![Restoring database step 3](https://github.com/user-attachments/assets/818990be-0c9a-4e96-a3c3-780b01ab5cd6)
