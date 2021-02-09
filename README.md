# EnvironmentalDraw

 Name: Aileen Drohan
 
 Student Number: 
 
 1st Programming Assignment in Processing(Java)
 HDip in Computer Science, WIT
 
 Brief description of the animation achieved:
 -------------------------------------------
 
 BASIC IDEA 
 The computer will draw an image based on questions 
 relating to the time of day and weather conditions outside.
 
 HOW IT WORKS 
 - A number of swing dialog boxes are called to 
 a) personalise the experience, b) give instructions 
 and c) ask questions. 
 - Different questions are asked depend on the user's response 
 to the yes/no option in Swings confirm dialog boxes i.e. if 
 an integer values of 0(Yes)or 1(No) has been returned.
 The returned value is assigned to make certain boolean conditions 
 either true or false.
 - Based on the evaluation of these conditions a drawing/animation 
 is then outputted in draw to the screen with a call to custom 
 methods for either a sunny day/ cloudy day/ rainy night or starry night.  
 - Once a method has been called the user can then press their mouse 
 to reveal either a hidden image or animation.
 
 Known bugs/problems: 
 --------------------
 1. In the very first JPane Input dialog box if the user pressed cancel 
 a null pointer exception is returned.
 
 Sources referred to during the development of the assignment:
 -------------------------------------------------------------
 REFERENCE SECTION IN PROCESSING'S WEBSITE
 PImage datatype for storing images found in Processing's Reference
 triangle and quad functions
 TUTORIAL SECTION IN PROCESSING'S WEBSITE
 translate() function as seen in 2D transformations tutorial 
 here https://processing.org/tutorials/transform2d/  
 
