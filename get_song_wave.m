function [ Z ] = get_song_wave( song, beat_length, fs )
%get_song_wave produces the time signal for a given song, beat length, and
%sampling frequency
%   song is a two column cell array of chord names and durations 

n_chords = length(song); %number of chords that get played

%for a longer song, good idea to preallocate Z instead of changing length
%each iteration, however, the code is simpler here - no calculation of song
%length (in terms of samples) required
Z = [];
for i=1:n_chords
    chord_name = song{i, 1}; % Extract chord name from the cell array
    duration_in_beats = song{i, 2}; % Extract duration in beats from the cell array
    chord_duration_in_seconds = duration_in_beats * beat_length; % Convert duration to seconds
    
    Z = [Z, get_chord_wave(chord_name, chord_duration_in_seconds, fs)]; % Append chord wave to song signal
end

end

