; Akinator game (theme: Electronic components of the line following robot)
;
; Por Juana Valentina Mendoza Santamaria
; juana.mendoza@usantoto.edu.co
;
; Universidad Santo Tom?s Seccional Tunja, Ingenier?a de Sistemas, June 1, 2020
;
; References
;  Akinator game: https://es.akinator.com/
;  ASCII Generator: http://www.network-science.de/ascii/
;  Genius ascii-art: 
;   https://www.asciiart.eu/movies/aladdin
;   https://ascii.co.uk/art/genii
;  Interruptions list: 
;   http://www.gabrielececchetti.it/Teaching/CalcolatoriElettronici/Docs/i8086_and_DOS_interrupts.pdf
;   https://en.wikipedia.org/wiki/INT_10H
;   http://spike.scu.edu.au/~barry/interrupts.html#ah09
;   https://www.pcjs.org/documents/books/mspl13/msdos/norton/
;  A simple line following robot: https://www.roboticsbible.com/simple-line-following-robot.html

TITLE   Akinator game - Theme: Electronic components
                .286
                .MODEL SMALL

                .STACK 100h

                .DATA
labAkinatorLogo DB 10, 13, "              _|        _|                        _|"
                DB 10, 13, "      _|_|_|  _|  _|        _|_|_|      _|_|_|  _|_|_|_|    _|_|    _|  _|_|"
                DB 10, 13, "    _|    _|  _|_|      _|  _|    _|  _|    _|    _|      _|    _|  _|_|"
                DB 10, 13, "    _|    _|  _|  _|    _|  _|    _|  _|    _|    _|      _|    _|  _|"
                DB 10, 13, "      _|_|_|  _|    _|  _|  _|    _|    _|_|_|      _|_|    _|_|    _|"
                DB 10, 13
                DB 10, 13, "                                       By Juana Valentina Mendoza Santamaria"
                DB 10, 13, "                                               juana.mendoza@usantoto.edu.co"
                DB 10, 13, "                             Universidad Santo Tomas - Seccional Tunja, 2020"
                DB "$"
labIntroduction DB 10, 13, "                         A Simple Line Following Robot"
                DB 10, 13, "                         ============================="
                DB 10, 13, 10, 13
                DB 10, 13, " A line following robot is a mobile machine employed to sense and follow the"
                DB 10, 13, " black lines that are drawn on the white surface. As this robot is developed"
                DB 10, 13, " using a protoboard, it will be very simple to construct. This technique can"
                DB 10, 13, " be incorporated into the Automated Guided Vehicles (AGV) for providing the"
                DB 10, 13, " easy way of operation."
                DB "$"
labComponents   DB 10, 13, "                                Components used"
                DB 10, 13, "                                ==============="
                DB 10, 13, 10, 13
                DB 10, 13, " - 1 Protoboard"
                DB 10, 13, " - 1 Battery 9V"
                DB 10, 13, " - 2 Resistors 470 ohm"
                DB 10, 13, " - 2 Resistors 2.2 Kohm"
                DB 10, 13, " - 2 Resistors 680 ohm"
                DB 10, 13, " - 2 Resistors 10 Kohm"
                DB 10, 13, " - 2 Motors"
                DB 10, 13, " - 2 LEDs"
                DB 10, 13, " - 2 Transistors BD140"
                DB 10, 13, " - 2 Transistors BC557"
                DB 10, 13, " - 2 Transistors BC547"
                DB 10, 13, " - 2 Photosensors CNY70"
                DB 10, 13, " - 1 Jumper"
                DB 10, 13, " - 1 Switch"
                DB 10, 13, " - 1 Battery connector"
                DB 10, 13, " - 50 cm. wire"
                DB "$"
labInstructions DB 10, 13, "                                 Construction"
                DB 10, 13, "                                 ============"
                DB 10, 13, 10, 13
                DB 10, 13, " The robot consists of two symmetrical parts, one for each wheel. To the"
                DB 10, 13, " positive pole of the battery, we connect the emitter of transistor BC557,"
                DB 10, 13, " the emitter connects to a 2.2 kohm resistor and to the base of transistor"
                DB 10, 13, " BD140, the collector of this transistor is connected to the motor. From"
                DB 10, 13, " the motor, using a 470 ohm resistor, we connect a LED to the 680 ohm"
                DB 10, 13, " resistor and to the K-pin of the photosensor. E-pin of the photosensor"
                DB 10, 13, " connects to the base of transistor BC547 and to a 10K resistor that is"
                DB 10, 13, " grounded. The BC547 emitter is also grounded. A-pin and C-pin of the "
                DB 10, 13, " photosensor turn positive."
                DB "$"
labBattery      DB 10, 13, "                                    Battery"
                DB 10, 13, "                                    ======="
                DB 10, 13, 10, 13
                DB 10, 13, " This entry covers electrochemical power sources. Electricity is most"
                DB 10, 13, " often generated electromagnetically, but since these sources cannot be"
                DB 10, 13, " classified as components, they are outside the scope of the encyclopedia."
                DB 10, 13, " Electrostatic sources are excluded for similar reasons."
                DB 10, 13, " A battery is sometimes referred to as a cell or power cell, but can"
                DB 10, 13, " actually contain multiple cells, as defined in this entry. It used to be"
                DB 10, 13, " called an accumulator or a pile, but those terms are now archaic."
                DB "$"
labPhotosensor  DB 10, 13, "                                  Photosensor"
                DB 10, 13, "                                  ==========="
                DB 10, 13, 10, 13
                DB 10, 13, " The photosensor responds to light when the light generates electron-hole"
                DB 10, 13, " pairs in the semiconductor material. For a bipolar NPN phototransistor"
                DB 10, 13, " (the most common variant), the important region for pair generation is"
                DB 10, 13, " the reverse-biased collector-base interface. Photocurrent generated here"
                DB 10, 13, " acts as current injected into the base of an ordinary transistor, and"
                DB 10, 13, " permits a larger current to pass from the collector to the emitter."
                DB "$"
labSwitch       DB 10, 13, "                                   Switch"
                DB 10, 13, "                                   ======"
                DB 10, 13, 10, 13
                DB 10, 13, " A switch contains at least two contacts, which close or open when an "
                DB 10, 13, " external lever or knob is flipped or moved."
                DB "$"
labLED          DB 10, 13, "                                    LED"
                DB 10, 13, "                                    ==="
                DB 10, 13, 10, 13
                DB 10, 13, " A component usually 10mm or smaller in diameter, made of transparent "
                DB 10, 13, " or translucent epoxy or silicone, most often containing one "
                DB 10, 13, " light-emitting diode. It is purposed as a status indicator in a device,"
                DB 10, 13, " rather than as a source of illumination, and is sometimes referred to as"
                DB 10, 13, " a standard LED."
                DB 10, 13, " LED indicators that emit infrared and ultraviolet light are included in"
                DB 10, 13, " this entry. LEDs that are designed to illuminate large interior or "
                DB 10, 13, " exterior areas are discussed in a separate entry as LED area lighting."
                DB 10, 13, " They are sometimes described as high-brightness LEDs and almost always"
                DB 10, 13, " emit white light."
                DB 10, 13, " The term light-emitting diode is becoming less common, as the acronym"
                DB 10, 13, " LED has become ubiquitous."
                DB "$"
labGearmotor    DB 10, 13, "                                  Gearmotor"
                DB 10, 13, "                                  ========="
                DB 10, 13, 10, 13
                DB 10, 13, " A servo motor is actually a combination of a motor, reduction gearing,"
                DB 10, 13, " and miniaturized control electronics, usually packaged together inside"
                DB 10, 13, " a very compact sealed plastic case. The motor itself may be AC or DC,"
                DB 10, 13, " and if DC, it may be brushed or brushless. What distinguishes a servo"
                DB 10, 13, " from other types of motor is that it is not designed for continuous"
                DB 10, 13, " rotation. It is a position-seeking device."
                DB 10, 13, " Its rotational range may be more than 180 degrees but will be"
                DB 10, 13, " significantly less than 360 degrees."
                DB "$"
labProtoboard   DB 10, 13, "                                  Breadboard"
                DB 10, 13, "                                  =========="
                DB 10, 13, 10, 13
                DB 10, 13, " A breadboard (protoboard) is a construction base for prototyping of"
                DB 10, 13, " electronics. Originally the word referred to a literal bread board, a"
                DB 10, 13, " polished piece of wood used for slicing bread. In the 1970s the "
                DB 10, 13, " solderless breadboard (a.k.a. plugboard, a terminal array board) became"
                DB 10, 13, " available and nowadays the term breadboard is commonly used to refer to"
                DB 10, 13, " these."
                DB 10, 13, " Because the solderless breadboard does not require soldering, it is"
                DB 10, 13, " reusable. This makes it easy to use for creating temporary prototypes"
                DB 10, 13, " and experimenting with circuit design."
                DB "$"
labResistor     DB 10, 13, "                                  Resistor"
                DB 10, 13, "                                  ========"
                DB 10, 13, 10, 13
                DB 10, 13, " A resistor is one of the most fundamental components in electronics."
                DB 10, 13, " Its purpose is to impede a flow of current and impose a voltage "
                DB 10, 13, " reduction. It consists of two wires or conductors attached at opposite"
                DB 10, 13, " ends or sides of a relatively poor electrical conductor, the resistance"
                DB 10, 13, " of which is measured in ohms, universally represented by the Greek omega"
                DB 10, 13, " symbol."
                DB "$"
labTransistor   DB 10, 13, "                                 Transistor"
                DB 10, 13, "                                 =========="
                DB 10, 13, 10, 13
                DB 10, 13, " The word transistor, on its own, is often used to mean bipolar transistor,"
                DB 10, 13, " as this was the type that became most widely used in the field of discrete"
                DB 10, 13, " semiconductors."
                DB 10, 13, " A bipolar transistor amplifies fluctuations in current or can be used to"
                DB 10, 13, " switch current on and off.  In its amplifying mode, it replaced the vacuum"
                DB 10, 13, " tubes that were formerly used in the amplification of audio signals and "
                DB 10, 13, " many other applica?tions."
                DB "$"
labGenius       DB 10, 13, "                                                 _.---.__"
                DB 10, 13, "                                              .'        `-."
                DB 10, 13, "                                             /      .--.   |"
                DB 10, 13, "                                             \/  / /    |_/"
                DB 10, 13, "                                              `\/|/    _(_)"
                DB 10, 13, "                                           ___  /|_.--'    `.   ."
                DB 10, 13, "                                           \  `--' .---.     \ /|"
                DB 10, 13, "                                            )   `       \     //|"
                DB 10, 13, "                                            | __    __   |   '/||"
                DB 10, 13, "                                            |/  \  /  \      / ||"
                DB 10, 13, "                                            ||  |  |   \     \  |"
                DB 10, 13, "                                            \|  |  |   /        |"
                DB 10, 13, "                                           __\\@/  |@ | ___ \--'"
                DB 10, 13, "                                          (     /' `--'  __)|"
                DB 10, 13, "                                         __>   (  .  .--' & \"
                DB 10, 13, "                                        /   `--|_/--'     &  |"
                DB 10, 13, "                                        |                 #. |"
                DB 10, 13, "                                        |      o _ o      q# |"
                DB 10, 13, "                                          `.________.ad####'"
                DB 10, 13, "                                            `#####|||||''"
                DB 10, 13, "                                             `&#'"
                DB "$"
labThinkAbout   DB         "                          .-=-.            / Now, from the list choose ONE"
                DB 10, 13, "                         /  ! )\          |  electrical component. Don't tell"
                DB 10, 13, "  Choose ONE:         __ \__/__/          |  anyone, not even me."
                DB 10, 13, "                     / _<( ^.^ )   -------   With my mental powers and with"
                DB 10, 13, "  1. Battery        / /   \ c /O          |  a few questions, I'm going to"
                DB 10, 13, "  2. Photosensor    \ \_.-./=\.-._     _  |  guess the super-secret"
                DB 10, 13, "  3. Switch          `-._  `~`    `-,./_< |  electronic component that"
                DB 10, 13, "  4. LED                 `\' \'\`'----'    \ you're thinking now..."
                DB 10, 13, "  5. Gearmotor             \  . \ "
                DB 10, 13, "  6. Protoboard             `-~~~\   ."
                DB 10, 13, "  7. Resistor          .      `-._`-._   *"
                DB 10, 13, "  8. Transistor    ()                   * )"
                DB 10, 13, "                  <^^>             *     (   ."
                DB 10, 13, "                 .-''-.                    )"
                DB 10, 13, "      .---.    .'-....-'-._     _...---''`/. '"
                DB 10, 13, "     ( (`\ \ .'   *        ``-''    _.-''`"
                DB 10, 13, "      \ \ \ : :. a k i n a t o r .-'"
                DB 10, 13, "       `\`.\: `:.     *       _.'"
                DB 10, 13, "       (  .'`.`            _.'"
                DB 10, 13, "        ``    `-..______.-'"
                DB 10, 13, "                  ):.  ("
                DB 10, 13, "                .'-....-'."
                DB 10, 13, "              '-..______..-'"
                DB "$"
labQuestion1    DB "                  Does the component have long wire connectors?$"
labQuestion2    DB "                   Do you need a code to connect the component?$"
labQuestion3    DB "                        Light characterizes this component?$"
labQuestion4    DB "                         Is the component a semiconductor?$"
labQuestion5    DB "                Can the component interrupt the electric current?$"
labQuestion6    DB "                        Does the component have an emitter?$"
labQuestion7    DB "                  Is voltage a characteristic of this component?$"
labClue         DB "                         Please type Y (Yes) or N (No) -> $"

batteryAns      DB "NYNNNNY"        ; Battery answers
photosensorAns  DB "YYYNNYN"        ; Photosensor answers
switchAns       DB "YNNNYNN"        ; Switch answers
ledAns          DB "YYYYYNN"        ; LED answers
gearmotorAns    DB "YNNNNNY"        ; Gearmotor answers
protoboardAns   DB "NNNNNNN"        ; Protoboard answers
resistorAns     DB "YNNNNNN"        ; Resistor answers
transistorAns   DB "YYNYNYN"        ; Transistor answers

batteryFlag     DB 1                ; Battery flag
photosensorFlag DB 1                ; Photosensor flag
switchFlag      DB 1                ; Switch flag
ledFlag         DB 1                ; LED flag
gearmotorFlag   DB 1                ; Gearmotor flag
protoboardFlag  DB 1                ; Protoboard flag
resistorFlag    DB 1                ; Resistor flag
transistorFlag  DB 1                ; Transistor flag

component1      DB "Battery$"
component2      DB "Photosensor$"
component3      DB "Switch$"
component4      DB "LED$"
component5      DB "Gearmotor$"
component6      DB "Protoboard$"
component7      DB "Resistor$"
component8      DB "Transistor$"

color           DB 113              ; Backgroud-color * 16 + font-color
posX            DB 0                ; Column
posY            DB 0                ; Row
questionCount   DB 1                ; Question counter
character       DB ?                ; Character

labWait         DB "Press any key to continue...$"
labSuccess      DB "Akinator read your mind!"
                DB 10, 13, "The secret electronic component is: "
                DB "$"
labNotFound     DB "Akinator is disappointed."
                DB 10, 13, "I could not read your mind"
                DB 10, 13, "or you lied in your answers."
                DB "$"
eogFlag         DB 0                ; End of Game flag

        .CODE
;....:::: main function ::::....
begin PROC FAR
        .STARTUP

        CALL showInitialSlides      ; Show initial slides
        CALL showQuestion           ; Show the questions
        
        .EXIT                       ; Program exit
begin ENDP

;....:::: Scroll up screen ::::....
;
; PARAMETERS:
;   AL = lines to scroll (0 = clear, CH, CL, DH, DL are used)
;   BH = Background Color * 16 + Foreground color
;        0: black, 1: blue, 2: green, 3: cyan, 4: red, 5: magenta, 6: brown, 7: light gray
;        8: dark gray, 9: light blue, 10: light green, 11: light cyan, 12: light red, 13: light magenta,
;        14: yellow, 15: white
;   CH = Upper row number, CL = Left column number, DH = Lower row number, DL = Right column number
; RETURN:
;   none
clrScr PROC NEAR
        PUSHA                       ; Save the registers
        MOV AL, 0                   ; Page 0
        MOV BH, color               ; Screen color
        MOV CH, 0                   ; Top row
        MOV CL, 0                   ; Left column
        MOV DH, 24                  ; Down row
        MOV DL, 79                  ; Right column
        MOV AH, 06h                 ; Function
        INT 10h                     ; Interruption
        POPA                        ; Recover the registers
        RET
clrScr ENDP

;....:::: Set cursor position ::::....
;
; PARAMETERS:
;   BH = Page Number, DH = Row, DL = Column
; RETURN:
;   none
gotoXY PROC    NEAR                 ; Procedimiento para ubicar el cursor en pantalla texto
        PUSHA                       ; Save the registers
        MOV     BH, 00              ; Page
        MOV     DL, posX            ; x-coordinate
        MOV     DH, posY            ; y-coordinate
        MOV     AH, 02H             ; Function
        INT     10H                 ; Interruption
        POPA                        ; Recover the registers
        RET
gotoXY ENDP

;....::::  Outputs a string terminated with a $ to the screen. ::::....
;
; PARAMETERS:
;   DS:DX = address of string
; RETURN:
;   none
print PROC NEAR
        PUSHA                       ; Save the registers
        MOV AH, 09h                 ; Function
        INT 21h                     ; Interruption
        POPA                        ; Recover the registers
        RET
print ENDP

;....:::: Flush keyboard buffer and read standard input ::::....
;
; PARAMETERS:
;   AL = STDIN input function to execute after flushing buffer
;      01h: Read character from standard input, wuth echo
;      06h: Direct console input
;      07h: Direct character input, without echo
;      08h: Character input without echo
;      0Ah: Buffered input
; RETURN:
;   none
keyPress PROC NEAR
        PUSHA                       ; Save the registers
        MOV AL, 07h                 ; Number of input function to execute after flushing buffer
        MOV AH, 0Ch                 ; Function
        INT 21h                     ; Interruption
        POPA                        ; Recover the registers
        RET
keyPress ENDP

;....:::: Read character from standard input, with echo ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   AL -> character = Character read (ASCII code)
readChar PROC NEAR
        PUSHA                       ; Save the registers
        MOV AH, 01h                 ; Function
        INT 21h                     ; Interruption
        MOV character, AL           ; Character from keyboard
        POPA                        ; Recover the registers
        RET
readChar ENDP

;....:::: Input of a string (Buffered input) ::::....
;
; PARAMETERS:
;   DS:DX Buffer
;   Offset   Size   Description
;       00      1   maximum characters buffer can hold
;       01      1   number of chars from last input which may be recalled
;                   OR number of characters actually read, excluding CR
;       02      n   actual characters read, including the final carriage return
; RETURN:
;   DS:DX Buffer filled with user input
read PROC NEAR
        PUSHA                       ; Save the registers
        MOV AH, 0Ah                 ; Function
        INT 21h                     ; Interruption
        POPA                        ; Recover the registers
        RET
read ENDP

;....:::: Wait to press any key ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
waitEnter PROC NEAR
        PUSHA                       ; Save the registers
        MOV posX, 0                 ; Column
        MOV posY, 24                ; Row
        CALL gotoXY                 ; Locate the cursor
        LEA DX, labWait             ; Wait message
        CALL print                  ; Show the message
        CALL keyPress               ; Wait for pressing any key
        POPA                        ; Recover the registers
        RET
waitEnter ENDP

;....:::: Show Slide ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showSlide PROC NEAR
        PUSHA                       ; Save the registers
        CALL clrScr                 ; Clear screen
        CALL gotoXY                 ; Locate the cursor
        CALL print                  ; Show the string
        CALL waitEnter              ; Wait to press ENTER keyboard
        POPA                        ; Recover the registers
        RET
showSlide ENDP

;....:::: Show intial slides ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showInitialSlides PROC NEAR
        PUSHA                       ; Save the registers

        CALL showCover              ; Show cover
        CALL showIntroduction       ; Show introduction
        CALL showComponentsList     ; Show components list
        CALL showInstructions       ; Show construction instructions
        CALL showBattery            ; Show battery concepts
        CALL showPhotosensor        ; Show Photosensor concepts
        CALL showSwitch             ; Show Switch concepts
        CALL showLED                ; Show LED concepts
        CALL showGearmotor          ; Show Gearmotor concepts
        CALL showProtoboard         ; Show Protoboard concepts
        CALL showResistor           ; Show Resistor concepts
        CALL showTransistor         ; Show Transistor concepts
        CALL showThinkAbout         ; Show Think about slide

        POPA                        ; Recover the registers
        RET
showInitialSlides ENDP

;....:::: Show Cover ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showCover PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 3 * 16 + 0       ; Background: cyan, font-color: black
        MOV posX, 0                 ; Column
        MOV posY, 7                 ; Row
        LEA DX, labAkinatorLogo     ; Akinator logo
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showCover ENDP

;....:::: Show introduction ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showIntroduction PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 7                 ; Row
        LEA DX, labIntroduction     ; Line follower robot introduction
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showIntroduction ENDP

;....:::: Show components list ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showComponentsList PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labComponents       ; Components
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showComponentsList ENDP

;....:::: Show construction instructions ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showInstructions PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labInstructions     ; Construction introductions
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showInstructions ENDP

;....:::: Show battery concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showBattery PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labBattery          ; Battery concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showBattery ENDP

;....:::: Show photosensor concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showPhotosensor PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labPhotosensor      ; Photosensor concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showPhotosensor ENDP

;....:::: Show switch concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showSwitch PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labSwitch           ; Switch concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showSwitch ENDP

;....:::: Show LED concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showLED PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labLED              ; LED concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showLED ENDP

;....:::: Show Gearmotor concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showGearmotor PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labGearmotor        ; Gearmotor concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showGearmotor ENDP

;....:::: Show Protoboard concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showProtoboard PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labProtoboard       ; Protoboard concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showProtoboard ENDP

;....:::: Show Resistor concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showResistor PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labResistor         ; Resistor concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showResistor ENDP

;....:::: Show Transistor concepts ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showTransistor PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labTransistor       ; Transistor concepts
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showTransistor ENDP

;....:::: Show Think about slide ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   none
showThinkAbout PROC NEAR
        PUSHA                       ; Save the registers
        MOV color, 6 * 16 + 14      ; Background: brown, font-color: yellow
        MOV posX, 0                 ; Column
        MOV posY, 2                 ; Row
        LEA DX, labThinkAbout       ; Think about slide
        CALL showSlide              ; Show the slide
        POPA                        ; Recover the registers
        RET
showThinkAbout ENDP

;....:::: Read the answer ::::....
;
; PARAMETERS:
;   none
; RETURN:
;   character - Character from user input
readAnswer PROC NEAR
        PUSHA                       ; Save the registers
ra01:
        MOV posX, 59                ; Column
        MOV posY, 6                 ; Row
        CALL gotoXY                 ; Locate the cursor
        CALL readChar               ; Read a character
        MOV AL, character           ; Character
        CMP AL, 'y'                 ; Only accepts 'y' or 'n'
        JE ra02
        CMP AL, 'Y'
        JE ra04
        CMP AL, 'n'
        JE ra03
        CMP AL, 'N'
        JE ra04
        JMP ra01
ra02:
        MOV AL, 'Y'                 ; Uppercase
        MOV character, AL
        JMP ra04
ra03:   
        MOV AL, 'N'                 ; Uppercase
        MOV character, AL
        JMP ra04
ra04:
        POPA                        ; Recover the registers
        RET
readAnswer ENDP

;....:::: Discard components ::::....
;
; PARAMETERS:
;   questionCount - Question number
;   batteryAns, photosensorAns, switchAns, ledAns, gearmotorAns, protoboardAns, resistorAns,
;     transistorAns - Answers
;   character - User input
; RETURN:
;   batteryFlag, photosensorFlag, switchFlag, ledFlag, gearmotorFlag, protoboardFlag,
;      resistorFlag, transistorFlag - Flags
discard PROC NEAR
        PUSHA                       ; Save the registers

        XOR BX, BX                  ; Question number
        MOV BL, questionCount       ; Index
        DEC BL

        LEA DX, batteryAns          ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d01
        JMP d02
d01:
        MOV batteryFlag, 0          ; Turn off the flag
d02:
        LEA DX, photosensorAns      ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d03
        JMP d04
d03:
        MOV photosensorFlag, 0      ; Turn off the flag
d04:
        LEA DX, switchAns           ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d05
        JMP d06
d05:
        MOV switchFlag, 0           ; Turn off the flag
d06:
        LEA DX, ledAns              ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d07
        JMP d08
d07:
        MOV ledFlag, 0              ; Turn off the flag
d08:
        LEA DX, gearmotorAns        ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d09
        JMP d10
d09:
        MOV gearmotorFlag, 0        ; Turn off the flag
d10:
        LEA DX, protoboardAns       ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d11
        JMP d12
d11:
        MOV protoboardFlag, 0       ; Turn off the flag
d12:
        LEA DX, resistorAns         ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d13
        JMP d14
d13:
        MOV resistorFlag, 0         ; Turn off the flag
d14:
        LEA DX, transistorAns       ; Address base
        MOV SI, DX                  ; Source index
        MOV AL, [SI + BX]           ; Get the label character        
        CMP AL, character           ; Compare User input vs. label character
        JNE d15
        JMP d16
d15:
        MOV transistorFlag, 0       ; Turn off the flag
d16:
        POPA                        ; Recover the registers
        RET
discard ENDP

;....:::: Check gameover ::::....
;
; PARAMETERS:
;   questionCount - Question number
; RETURN:
;   eogFlag - End of game flag
checkEOG PROC NEAR
        PUSHA                       ; Save the registers

        CMP questionCount, 8        ; Was it the last question?
        JNE ceog99

        MOV color, 0 * 16 + 5       ; Background: black, font-color: magent
        CALL clrScr                 ; Clear screen

        MOV posX, 0                 ; Column
        MOV posY, 1                 ; Row
        CALL gotoXY                 ; Locate the cursor
        LEA DX, labGenius           ; Show the successful message
        CALL print                  ; Show the string

        MOV posX, 0                 ; Column
        MOV posY, 12                ; Row
        CALL gotoXY                 ; Locate the cursor
        LEA DX, labNotFound         ; Show the unsuccessful message
        CALL print                  ; Show the string
        
        CALL waitEnter              ; Wait and ENTER key
        
        MOV color, 0 * 16 * 15      ; OS screen
        CALL clrScr                 ; Clear screen

        MOV eogFlag, 1              ; Gameover
ceog99:
        POPA                        ; Recover the registers
        RET
checkEOG ENDP

;....:::: Show guess screen ::::....
;
; PARAMETERS:
;   DS:DX Guessed electric component
; RETURN:
;   none
showGuess PROC NEAR
        PUSHA                       ; Save the registers
        PUSH DX                     ; Save the component message address

        MOV color, 5 * 16 + 15      ; Background: cyan, font-color: white
        CALL clrScr                 ; Clear screen

        MOV posX, 0                 ; Column
        MOV posY, 1                 ; Row
        CALL gotoXY                 ; Locate the cursor
        LEA DX, labGenius           ; Show the successful message
        CALL print                  ; Show the string

        MOV posX, 0                 ; Column
        MOV posY, 10                ; Row
        CALL gotoXY                 ; Locate the cursor
        LEA DX, labSuccess          ; Show the successful message
        CALL print                  ; Show the string

        MOV posX, 0                 ; Column
        MOV posY, 12                ; Row
        CALL gotoXY                 ; Locate the cursor
        POP DX                      ; The message address
        CALL print                  ; Show the guessed component
        
        CALL waitEnter              ; Wait and ENTER key
        
        MOV color, 0 * 16 * 15      ; OS screen
        CALL clrScr                 ; Clear screen

        POPA                        ; Recover the registers
        RET
showGuess ENDP

;....:::: Akinator guess ::::....
;
; PARAMETERS:
;   batteryFlag, photosensorFlag, switchFlag, ledFlag, gearmotorFlag, protoboardFlag,
;      resistorFlag, transistorFlag - Flags
;   component1, component2, component3, component4, component5, component6, component7,
;      component8 - Component names
; RETURN:
;   DS:DX - Guessed component name
guess PROC NEAR
        PUSHA                       ; Save the registers

        CMP batteryFlag, 1          ; Is this the flag?
        JE g01
        JMP g02
g01:
        LEA DX, component1
        CALL showGuess
        JMP g99
g02:
        CMP photosensorFlag, 1      ; Is this the flag?
        JE g03
        JMP g04
g03:
        LEA DX, component2
        CALL showGuess
        JMP g99
g04:
        CMP switchFlag, 1           ; Is this the flag?
        JE g05
        JMP g06
g05:
        LEA DX, component3
        CALL showGuess
        JMP g99
g06:
        CMP ledFlag, 1              ; Is this the flag?
        JE g07
        JMP g08
g07:
        LEA DX, component4
        CALL showGuess
        JMP g99
g08:
        CMP gearmotorFlag, 1        ; Is this the flag?
        JE g09
        JMP g10
g09:
        LEA DX, component5
        CALL showGuess
        JMP g99
g10:
        CMP protoboardFlag, 1       ; Is this the flag?
        JE g11
        JMP g12
g11:
        LEA DX, component6
        CALL showGuess
        JMP g99
g12:
        CMP resistorFlag, 1         ; Is this the flag?
        JE g13
        JMP g14
g13:
        LEA DX, component7
        CALL showGuess
        JMP g99
g14:
        LEA DX, component8
        CALL showGuess
g99:
        POPA                        ; Recover the registers
        RET
guess ENDP

;....:::: Check if Akinator guess ::::....
;
; PARAMETERS:
;   batteryFlag, photosensorFlag, switchFlag, ledFlag, gearmotorFlag, protoboardFlag,
;      resistorFlag, transistorFlag - Flags
; RETURN:
;   eogFlag - End-of-game flag
checkGuess PROC NEAR
        PUSHA                       ; Save the registers

        XOR CX, CX                  ; Counter = 0

        CMP batteryFlag, 0          ; Flag
        JNZ cg01
        JMP cg02
cg01:
        INC CX
cg02:
        CMP photosensorFlag, 0      ; Flag
        JNZ cg03
        JMP cg04
cg03:
        INC CX
cg04:
        CMP switchFlag, 0           ; Flag
        JNZ cg05
        JMP cg06
cg05:
        INC CX
cg06:
        CMP ledFlag, 0              ; Flag
        JNZ cg07
        JMP cg08
cg07:
        INC CX
cg08:
        CMP gearmotorFlag, 0        ; Flag
        JNZ cg09
        JMP cg10
cg09:
        INC CX
cg10:
        CMP protoboardFlag, 0       ; Flag
        JNZ cg11
        JMP cg12
cg11:
        INC CX
cg12:
        CMP resistorFlag, 0         ; Flag
        JNZ cg13
        JMP cg14
cg13:
        INC CX
cg14:
        CMP transistorFlag, 0       ; Flag
        JNZ cg15
        JMP cg16
cg15:
        INC CX
cg16:
        CMP CX, 1
        JE cg17
        JMP cg18
cg17:
        CALL guess                  ; Akinator guess!
        MOV eogFlag, 1              ; Turn on the end of game flag
        MOV questionCount, 9        ; No more questions
cg18:
        POPA                        ; Recover the registers
        RET
checkGuess ENDP

;....:::: Show the question ::::....
;
; PARAMETERS:
;   questionCount - Question number
;   labQuestion1, labQuestion2, labQuestion3, labQuestion4, labQuestion5, labQuestion6,
;     labQuestion7 - Questions
;   eogFlag - End-of-game flag
; RETURN:
;   DS:DX - Current question
;   questionCount - Question number
showQuestion PROC NEAR
        PUSHA                       ; Save the registers
sq00:
        MOV AL, questionCount       ; Question counter
        CMP AL, 1                   ; Question 1
        JE  sq01
        CMP AL, 2                   ; Question 2
        JE  sq02
        CMP AL, 3                   ; Question 3
        JE  sq03
        CMP AL, 4                   ; Question 4
        JE  sq04
        CMP AL, 5                   ; Question 5
        JE  sq05
        CMP AL, 6                   ; Question 6
        JE  sq06
sq07:
        LEA DX, labQuestion7        ; Question 7
        JMP sq08
sq06:
        LEA DX, labQuestion6        ; Question 6
        JMP sq08
sq05:
        LEA DX, labQuestion5        ; Question 5
        JMP sq08
sq04:
        LEA DX, labQuestion4        ; Question 4
        JMP sq08
sq03:
        LEA DX, labQuestion3        ; Question 3
        JMP sq08
sq02:
        LEA DX, labQuestion2        ; Question 2
        JMP sq08
sq01:
        LEA DX, labQuestion1        ; Question 1
        JMP sq08
sq08:
        MOV color, 1 * 16 + 14      ; Background: blue, font-color: yellow
        CALL clrScr                 ; Clear screen
        MOV posX, 0                 ; Column
        MOV posY, 4                 ; Row
        CALL gotoXY                 ; Locate the cursor
        CALL print                  ; Show the question
        MOV posX, 0                 ; Column
        MOV posY, 6                 ; Row
        CALL gotoXY                 ; Locate the cursor
        LEA DX, labClue             ; Show the clue
        CALL print

        CALL readAnswer             ; Read the answer
        CALL discard                ; Discard components
        CALL checkGuess             ; Check to guess
        
        MOV AL, questionCount       ; Next question
        INC AL
        MOV questionCount, AL
        
        CALL checkEOG               ; Check gameover

        CMP eogFlag, 1              ; Is the gameover?
        JE  sq09

        JMP sq00
sq09:
        POPA                        ; Recover the registers
        RET
showQuestion ENDP

        END
