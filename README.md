# AM Radio Simulator
In this project, I aimed to design a amplitude modulator (AM) radio signal and modeled sending it into sky, somewhat like real radio stations do. I also tried to reason out why these are called _amplitude modulation_ waves, rather than _frequency modulation_. There's a lot of steps to get these signals from a .wav file to airwaves so I explained what I did here step by step. 


## .wav or mp3? 
For this project, I only used .wav files. This is because they are completely unaltered. Every single frequency within the file stays the same as it is, unlike mp3 files which end up filtering out the frequencies which human ears cannot pick up. Having a .wav file lets us keep the authentic file and makes it easier to edit and process. 


## Importing our file and essential packages 
First things we have to do are import the .wav file in as well as the matlab packages that do signal processing. The song I chose to do was Space Oddity by David Bowie. 

```
song = "oddity.wav";
uiimport(song);
```

## Amplitude Modulation
To send the wave to something like an air-wave, we had to multiply the regular part of the wave with a cosine term. 


## Signal Convolution
Convolution was needed to get the __ to the ___. 


## Unwrapping the Signal


## Input Signal vs Output Signal 
This was my favorite part because I was able to visualize the changes on what happened to the inut signal. I saw that though the overall shape of the signal remained the same, there was definnitely some unwanted noise. This could be fixed by reducing the alpha value, which I think radio stations aim to do.


https://user-images.githubusercontent.com/101938119/178377960-617aa890-fd4e-4374-a0d8-bbb52e096cc2.mov



## Changes I could've done 
