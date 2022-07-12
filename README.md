# AM Radio Simulator
In this project, I aimed to design a amplitude modulator (AM) radio signal and modeled sending it into sky, somewhat like real radio stations do. I also tried to reason out why these are called _amplitude modulation_ waves, rather than _frequency modulation_. There's a lot of steps to get these signals from a .wav file to airwaves and back to .wav so I explained what I did here step by step. 


## .wav or mp3? 
For this project, I only used .wav files. This is because they are completely unaltered. Every single frequency within the file stays the same as it is, unlike mp3 files which end up filtering out the frequencies which human ears cannot pick up. Having a .wav file lets us keep the authentic file and makes it easier to edit and process. 


## Importing our file and essential packages 
First things we have to do are import the .wav file in as well as the matlab packages that do signal processing. The song I chose to do was Space Oddity by David Bowie. 

```
song = "oddity.wav";
uiimport(song);
[m,Fs] = audioread(filename);
mEnergy = sum((m'.^2)*(1/Fs));
```
> This takes our song in, plays it back, and also saves the frequency of the song. 

Here's a snippet:

https://user-images.githubusercontent.com/101938119/178377960-617aa890-fd4e-4374-a0d8-bbb52e096cc2.mov

## Amplitude Modulation
<p align="center">
  <img 
    width="950"
    height="372"
    src="https://github.com/akhilvreddy/AM-Radio-Simulator/blob/main/Images/image1.png"
  >
</p>

Here is the diagram explaining what happens to an input wave's amplitude. If you let our original signal be m(t), we see that it comes into the modulator and is combined with a cosine term cos(2πft) and a linear gain, A<sub>c</sub>. This combination is called a convolution, which essentially means multiplication in the frequency domain for both of the signals. The convolution signal can be written as s(t), which is essentially our airwave. If we model white-gaussian noise as w(t) and the error coefficient as alpha, we know that alpha*w(t) is the error added on to the our airwave. Adding these two waves element-wise gives our final noise wave, y(t).
Notice that only the amplitude is changing here. 


## Unwrapping the Signal
Given our final signal, we need to do the opposite of what we did before. Here is what I did, it is essentially the same code as above, but opposite. 
```
m1lowpass = lowpass(v1,Fs/2,(10^7)); 
m1 = resample(v1,44100,10^7); 
soundsc(m1,Fs);
```
> This takes our wave in, converts it to a song through resampling, and then plays it back to us.  


## Input Signal vs Output Signal 
This was my favorite part because I was able to visualize the changes on what happened to the inut signal. I saw that though the overall shape of the signal remained the same, there was definnitely some unwanted noise. This could be fixed by reducing the alpha value, which I think radio stations aim to do. Also, I think alpha is just an exponential function of how far you are from the radio station since static increases drastically the farther you are from a station while driving.

<p align="center">
  <img 
    width="950"
    height="372"
    src="https://github.com/akhilvreddy/AM-Radio-Simulator/blob/main/Images/image2.png"
  >
</p>


> The left image is our original signal wave and the right image is the final wave, which is supposed to be coming out of a car radio. As you can see, the car radio wave is much louder (hence the amplitude modulation) and is a little bit noisier (has more static).

## Changes I could've done 

- I could've lengthened the .wav file in order to model a real song on the radio. However, my laptop was struggling to process a 5 second file, it definitely would've struggled with a longer file.  
- I should've passed the signal through a bandpass filter instead of just a lowpass signal to reject both very high frequency parts and very low frequency parts. 
- Trying this out with a mp3 file could've been cool, and seeing how the signal changes could show how the two files act differently under processing.

