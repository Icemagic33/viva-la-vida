function [ X ] = get_wave( note, oct, duration, fs )
%get_wave gets the time signal of a note
%   Given the name of a note ('Ab', 'F', 'Bs', etc.), an octave ('h', 'm', 'l'),
%   a duration in seconds, and a sampling frequency
%   (fs) in Hertz, get_wave produces a vector of evenly spaced samples of that note
%   played for that duration, sampled every 1/fs seconds

num = get_num(note, oct); %get the number of the desired note using the function get_num
f = get_freq(num); %get frequency f, using num

% T = get_times(duration,fs);
% Generate the time vector T from 0 to duration with a step of 1/fs
T = 0:1/fs:duration-1/fs; % Ensure that the last sample is just before the end of the duration

X = cos(2*pi*f*T - pi/2); % Calculate the time signal for the note


end

