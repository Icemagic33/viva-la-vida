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
