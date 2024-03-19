% Define the beat length (duration of one beat)
beat_length = 60 / 136; % in seconds
 
% Create the song cell array (Intro only - rest of the song is just a mere
% repeat
song = {
     % Intro - played twice
     'Db', 0.7;
     'rest', 0.3;
     'Db', 0.7;
     'rest', 0.3;
     'Db', 0.7;
     'rest', 0.3;
     'Db', 0.5;
     'rest', 0.05;

     'Eb', 1;
     'rest', 0.05;
     'Eb', 0.7;
     'rest', 0.3;
     'Eb', 0.5;
     'rest', 0.05;
     'Eb', 0.7;
     'rest', 0.3;
     'Eb', 0.7;
     'rest', 0.3;

     'Ab', 0.7;
     'rest', 0.3;
     'Ab', 0.7;
     'rest', 0.3;
     'Ab', 0.7;
     'rest', 0.3;
     'Ab', 0.5;
     'rest', 0.05;

     'Fm', 1;
     'rest', 0.05;
     'Fm', 0.7;
     'rest', 0.3;
     'Fm', 0.5;
     'rest', 0.05;
     'Fm', 0.7;
     'rest', 0.3;
     'Fm', 0.7;
     'rest', 0.3;

     'Db', 0.7;
     'rest', 0.3;
     'Db', 0.7;
     'rest', 0.3;
     'Db', 0.7;
     'rest', 0.3;
     'Db', 0.5;
     'rest', 0.05;

     'Eb', 1;
     'rest', 0.05;
     'Eb', 0.7;
     'rest', 0.3;
     'Eb', 0.5;
     'rest', 0.05;
     'Eb', 0.7;
     'rest', 0.3;
     'Eb', 0.7;
     'rest', 0.3;

     'Ab', 0.7;
     'rest', 0.3;
     'Ab', 0.7;
     'rest', 0.3;
     'Ab', 0.7;
     'rest', 0.3;
     'Ab', 0.5;
     'rest', 0.05;

     'Fm', 1;
     'rest', 0.05;
     'Fm', 0.7;
     'rest', 0.3;
     'Fm', 0.5;
     'rest', 0.05;
     'Fm', 0.7;
     'rest', 0.3;
     'Fm', 0.7;
     'rest', 0.3;

};
 
% Define the sampling frequency
fs = 44100; % Standard sampling frequency for high-quality audio

% Create the song waveform
Z = get_song_wave_2(song, beat_length, fs);
 
% Play the song waveform
soundsc(Z, fs); 

% Save using audiowrite 
audiowrite('first.wav', Z, fs);


function [ f ] = get_freq( num )
%get_freq produces the frequency of a note in Hz given the key number

middle_A_freq = 440; %Hz
middle_A_num = 22; %this is the key number of middle A

octave_mult = 2; %going up an octave doubles the frequency
num_octave_keys = 12; %there are 12 keys in an octave

%fill in the following lines in terms of num and the constants defined
%above
semitone_mult = 2^(1/num_octave_keys); %frequency ratio of a semitone (two neighbouring keys)
semitone_jump = num - middle_A_num;  %how many semitones away from middle A our key is
f = middle_A_freq * (semitone_mult^semitone_jump); %our key's frequency

end

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

function [ X ] = get_chord_wave( chord, duration, fs )
%get_chord_wave generates the time signal for a chord
%   Given a chord name ('Am', 'D', 'Cmaj7','G', etc.), duration (in sec), and a sampling
%   frequency, this function generates the corresponding time signal

%feel free to add more cases (other chords or inversions of the given chords),
%just be sure to give new cases unique names
    switch chord 
        case 'C'
            notes = {'C','m';
                     'E','m';
                     'G','m'};             
        case 'Cm'
            notes = {'C','m';
                     'Eb','m';
                     'G','m'}; 
        case 'C7'
            notes = {'C','m';
                     'E','m';
                     'G','m';
                     'Bb','m'};
        case 'Cmaj7'
            notes = {'C','m';
                     'E','m';
                     'G','m';
                     'B','m'};
        case 'Cm7'
            notes = {'C','m';
                     'Eb','m';
                     'G','m';
                     'Bb','m'};
        case 'C5'
            notes = {'C', 'm';
                     'G', 'm'};
        case 'D'
            notes = {'D','m';
                     'Fs','m';
                     'A','m'};

        case 'D7' 
            notes = {'D','m';
                     'Fs','m'; 	
                     'A','m';
		             'C','m'};
		     
        case 'Dm'
            notes = {'D','m';
                     'F','m';
                     'A','m'};
        case 'Db'
            notes = {'Cs','m';
                     'F','m';
                     'Gs','m'};
        case 'E'
            notes = {'E','m';
                     'Gs','m';
                     'B','m'};
        case 'Em'
            notes = {'E','m';
                     'G','m';
                     'B','m'};
        case 'Eb'
            notes = {'Eb','m';
                     'G','m';
                     'Bb','m'};
        case 'F'
            notes = {'F','m';
                     'A','m';
                     'C','m'};
        case 'Fm'
            notes = {'C','m';
                     'F','m';
                     'Ab','m';
                     };
        case 'F#m'
            notes = {'Fs','m';
                     'A','m';
                     'Cs','m'};
        case 'G'
            notes = {'G','m';
                     'B','m';
                     'D','m'};
        case 'Gm'
            notes = {'G','m';
                     'Bb','m';
                     'D','m'};
        case 'A'
            notes = {'A','m';
                     'Cs','m';
                     'E','m'};             
        case 'Am'
            notes = {'A','m';
                     'C','m';
                     'E','m'};
        case 'Ab'
            notes = {'C','m';
                     'Eb','m';
                     'Ab','m'};
        case 'B'
            notes = {'B','m';
                     'Ds','m';
                     'Fs','m'};
        case 'Bm'
            notes = {'B','m';
                     'D','m';
                     'Fs','m'}; 
    end

    % Determine the number of notes in the chord
    I = size(notes);
    n = I(1); %n is the number of notes comprising the chord (usually 3)
    X = zeros(1, floor(duration*fs)); %initialize empty X to hold chord time signal

    for i=1:n %this loop will add the wave for each note inside the chord
        X = X + get_wave(notes{i, 1}, notes{i, 2}, duration, fs);
    end

end

function [ Z ] = get_song_wave( song, beat_length, fs )
%get_song_wave produces the time signal for a given song, beat length, and
%sampling frequency
%   song is a two column cell array of chord names and durations 

n_chords = length(song); %number of chords that get played

%for a longer song, good idea to preallocate Z instead of changing length
%each iteration, however, the code is simpler here - no calculation of song
%length (in terms of samples) required
Z = []; % initialize the song waveform

for i = 1:n_chords
    chord_name = song{i, 1}; % chord name from the first column
    num_beats = song{i, 2}; % number of beats from the second column
    chord_duration = num_beats * beat_length; % duration in seconds for the chord
    
    chord_wave = get_chord_wave(chord_name, chord_duration, fs); % get the waveform for the chord
    Z = [Z, chord_wave]; % append the chord waveform to the song waveform
end
end


function [ Z ] = get_song_wave_2( song, beat_length, fs )
%get_song_wave produces the time signal for a given song, beat length, and
%sampling frequency
%   song is a two column cell array of chord names and durations, with 'rest'
%   indicating a break

n_chords = size(song, 1); % number of chords and rests in the song

Z = []; % initialize the song waveform

for i = 1:n_chords
    chord_name = song{i, 1}; % chord name from the first column
    num_beats = song{i, 2}; % number of beats from the second column
    chord_duration = num_beats * beat_length; % duration in seconds for the chord or rest
    
    if strcmp(chord_name, 'rest') % Check if the current item is a rest
        rest_wave = zeros(1, round(fs * chord_duration)); % create a silent waveform
        Z = [Z, rest_wave]; % append the silent waveform to the song waveform
    else
        chord_wave = get_chord_wave(chord_name, chord_duration, fs); % get the waveform for the chord
        Z = [Z, chord_wave]; % append the chord waveform to the song waveform
    end
end

end

function Y = ADSR_env(X, beat_duration, num_beats, fs)
    % Basic ADSR envelope parameters for each beat
    attack_time = 0.01 * beat_duration; % Attack time as a fraction of beat duration
    decay_time = 0.1 * beat_duration; % Decay time
    sustain_level = 0.7; % Sustain level (relative to peak volume)
    release_time = 0.1 * beat_duration; % Release time
    
    % Calculate the number of samples for each phase of the ADSR envelope
    attack_samples = round(fs * attack_time);
    decay_samples = round(fs * decay_time);
    sustain_samples = round(fs * (beat_duration - attack_time - decay_time - release_time)); % Sustain for the rest of the beat
    release_samples = round(fs * release_time);
    
    % Generate ADSR envelope for a single beat
    attack_env = linspace(0, 1, attack_samples);
    decay_env = linspace(1, sustain_level, decay_samples);
    sustain_env = sustain_level * ones(1, sustain_samples);
    release_env = linspace(sustain_level, 0, release_samples);
    ADSR = [attack_env, decay_env, sustain_env, release_env];

    % Ensure the ADSR envelope is the same length as the beat duration
    ADSR = ADSR(1:round(beat_duration * fs));
    
    % Initialize the output signal
    Y = zeros(size(X));
    
    % Number of beats in the song
    total_beats = length(X) / round(beat_duration * fs);
    
    % Apply the ADSR envelope to each beat of the input signal
    for beat = 1:total_beats
        start_idx = (beat - 1) * round(beat_duration * fs) + 1;
        end_idx = start_idx + length(ADSR) - 1;
        
        % Make sure the end index doesn't exceed the signal length
        end_idx = min(end_idx, length(X));
        
        % Apply the envelope to this beat
        Y(start_idx:end_idx) = X(start_idx:end_idx) .* ADSR(1:length(start_idx:end_idx));
    end
end

