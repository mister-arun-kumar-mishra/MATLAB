my_text = fileread('Example_text.txt');
my_text =string(my_text); %converting to a single strings
my_text = splitlines(my_text); % splitting single string into different lines starting from new lines, for better filteration of the data
TF = (my_text ==''); % taking indices of the empty lines
my_text(TF) =[]; % Removing lines
my_text=strip(my_text); % Removing spaces from lines' starting and ending
p = {'.', ',', ':', '/','"', '"'}; %we don't want these characters frequency
my_text =replace(my_text,p,' ');
my_text = join(my_text); % joining all the lines in the string into a single big string
my_text = split(my_text); % splitting all the words in the string;
X = tabulate(my_text);
% y1=cell2mat(X(:,2));
[percentage, index] = sort(cell2mat(X(:,3)),'descend'); %sorting and taking indices of the frequencies
figure('Name','Percentage');
bar( categorical(X(index(1:10,1))), percentage(1:10)); %for percentage
xlabel('word');
ylabel('percentage');
% for maximum word count
% [count, index] = sort(cell2mat(X(:,2)),'descend'); %sorting and taking indices of the frequencies
figure('Name','MAX. Counts');
bar( categorical(X(index(1:10,1))),cell2mat(X(index(1:10),2))); %for percentage
xlabel('word');
ylabel('Count');
