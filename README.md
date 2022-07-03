# ODC PROJECT

------

### Integrants - Group 3

- Nicolás Andrés Plaza Iñiguez (github)
- Oscar Eduardo Sanchez Mora (github)

## Telephone box

This is a CLI (Command Line Interface) telephone box program written in MIPS using MARS 4.5. The program interacts with the user as it were a phone booth.

*In this document we will explain part of the code for better understanding*



### Considerations in mind

- You need to have MARS 4.5 or above to run this program (more info [visit the Running the program section](#Running the program))
- The program doesn't accept text as an input just numbers (integers an decimals)
- The program validates the input of cents (0.05, 0.10, 0.50 and 1.00 coins) and phone number (9 digits)
- The user have no control of when the call is finished, the program just sleep for 3 seconds (more info [visit the Code explanation section](#Code explanation))
- The duration of the call that is shown isn't calculated is random (in hh:mm:ss format)
- The cost of the call that is shown isn't calculated is random (from 0.10 to 0.40 dollars)
- The change given is calculated base on the total amount entered minus the cost of the call ($amount\ entered - total\ cost = change$) 



### Code explanation

The written program does not strictly follow a standard convention.

The first part is the `.data` section. Here you can find all the data used in the programs, for example strings, integers and floats values.

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-27-11-image.png)

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-27-24-image.png)

> We know there are better ways to store some values for later use, but we agreed to put all the data here for ease of use.



This is the code, there are comments explaning part of the code. Each section is label for easy identification.

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-40-27-image.png)

First we load the values from the data section to the actual program, so we can reference it later.

Then we validate the input, comparing it the correct values

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-48-04-image.png)

After that we sum the values and show it to the screen.

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-48-44-image.png)





### Running the program

- Open the **app.asm** file in MARS (File > Open... or press Ctrl + O)

- Assamble the file (press the nud and screwdriver icon)

- Run the program (press the Play button nexto to the Assemble button)

- Once the program is running it the bottom part of MARS should look like this

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-40-01-image.png)

- Enter a value and press the ↵ Return key

- It will continue requesting until completing the amount of 0.40 dollars or 40 cents

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-43-28-image.png)

- If an invalid value was entered it will show a message

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-43-53-image.png)

- Once the amount of 40 cents has been completed, you will be asked the following

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-46-06-image.png)

- If you enter 1, you may continue entering more values as before

- If you enter 0, you it will display the total amount of money entered

- Then it will ask for a phone number you want to call

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-53-07-image.png)

- It will continue requesting until you entered an integer value with 9 digits

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-57-53-image.png)

- Once a valid value is entered it will start calling

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-17-59-13-image.png)

- After the call the program will show the cost and duration of the call, the change to be given and a goodby message

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-03-50-image.png)

- The program stops excecuting, you need to Assamble it to run it again

![](/home/fedora/.var/app/com.github.marktext.marktext/config/marktext/images/2022-07-03-18-05-10-image.png)
