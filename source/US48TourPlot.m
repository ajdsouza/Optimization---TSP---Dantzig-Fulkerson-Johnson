clear all;

outputfile = 'US48.output';
f = fopen(outputfile,'r');
x = fscanf(f, '%d\t %d', [2, inf]);
fclose(f);
x = x';

coordfile = 'US48.input';
f = fopen(coordfile,'r');
coord = fscanf(f, '%d %f %f', [3, inf]);
fclose(f);
coord = coord';

tour = zeros(48,1);
tour(1) = 1;
fromCity = 1;
for k = 1 : 48
    tour(k+1) = x(fromCity,2);
    fromCity = x(fromCity,2);
end
figure(1);
plot(coord(:,2),coord(:,3),'rO');
hold on;
plot([coord(tour(:,1),2);coord(1,2)],[coord(tour(:,1),3);coord(1,3)]);
plot(coord(1,2),coord(1,3),'r*'); % the star marks Atlanta
