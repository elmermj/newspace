# Newspace

A news portal powered by Flutter.

To run or compile the application, you must register an account with newsapi.org.
After that, create a new dart file to paste this code below:

class APIs {
  static String newsAPIkey = <PASTE-YOUR-API-KEY> ;
}

Note:
The default region is "ID" (Indonesia). Only "US" (United States) region provides the URL to the article's image.
The timestamp is subtracted by 1 day to simulate the time difference between DateTime.now() and the articles' published timestamp. 
This is due to the free newsapi.org account having a day delay.


Disclaimer:
Portospace is an upcoming social network ecosystem that I'm currently building.
