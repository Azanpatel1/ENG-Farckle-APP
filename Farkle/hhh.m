userAPIKey = "TKU53PK1G063P0TO";
channelID = 2877355;
        writeKey = "VNPLWJ3R9FQ1RPN2";
        readKey = "92ABMTYNRSATKN2A";
        player1num = 1;  % Ensure numeric type
play1score = 0;  % Ensure numeric type
dice = [4 6 2 2 3 1];  % Convert dice to a numeric array


url = sprintf('https://api.thingspeak.com/channels/%s/feeds.json?api_key=%s', num2str(channelID), userAPIKey);
    webwrite(url, weboptions('RequestMethod','delete'));

thingSpeakWrite(channelID, 'Fields', [1, 2, 3], 'Values', {player1num, play1score, num2str(dice)}, 'WriteKey', writeKey);

dataStr = thingSpeakRead(channelID, 'Fields', 3, 'ReadKey', readKey, 'OutputFormat', 'table');

dataArray = str2num(dataStr.Field3{1})
