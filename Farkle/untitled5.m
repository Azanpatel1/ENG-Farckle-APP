
    % Initialize score variable
    score = 0;
    
    % Get the dice rolls from app.DiceArray1
    diceRolls = randi(6, 1, 6);
    
    % Count occurrences of each dice value (1 through 6)
    counts = histcounts(diceRolls, 1:7);
    
    % Scoring for single 1's and 5's
    score = score + counts(1) * 100;  % Each 1 scores 100 points
    score = score + counts(5) * 50;   % Each 5 scores 50 points
    
    % Scoring for three of a kind, four of a kind, etc.
    for i = 1:6
        if counts(i) >= 3
            % Three of a kind scores
            if i == 1
                score = score + 1000;  % Three 1's score 1000
            else
                score = score + i * 100; % Three of any other number
            end
            % Check for additional scoring for 4, 5, or 6 of a kind
            extraDice = counts(i) - 3;  % Extra dice after the three of a kind
            if extraDice == 1
                score = score + i * 100;  % Double the score for 4 of a kind
            elseif extraDice == 2
                score = score + i * 200;  % Triple the score for 5 of a kind
            elseif extraDice == 3
                score = score + i * 300;  % Quadruple the score for 6 of a kind
            end
        end
    end
    
    % Update the player's score in the app
    disp(score)
