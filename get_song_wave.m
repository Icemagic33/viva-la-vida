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