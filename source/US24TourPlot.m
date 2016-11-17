clear all;

%outputfile = 'US24.output';
outputfile = 'US24.output';
f = fopen(outputfile,'r');
x = fscanf(f, '%d\t %d', [2, inf]);
fclose(f);
x = x';

% read the list of cities
cities = cell(1e6, 2) ;
citiesfile = 'cities.input';
f = fopen(citiesfile,'r');
rCnt = 0 ; 
while ~feof(f)
    rCnt = rCnt + 1 ;
    cities{rCnt,1} = fscanf(f, '%d', 1) ;
    cities{rCnt,2} = fscanf(f, '%s', 1) ;
end
fclose(f);
cities = cities(1:rCnt-1,:) ;

coordfile = 'US48.input';
f = fopen(coordfile,'r');
coord = fscanf(f, '%d %f %f', [3, inf]);
fclose(f);
coord = coord';

tour = zeros(24,1);
tour(1) = 1;
fromCity = 1;
for k = 1 : 24
    tour(k+1) = x(fromCity,2);
    fromCity = x(fromCity,2);
end
figure(1);
plot(coord(tour(:,1),2),coord(tour(:,1),3),'rO');
text(coord(tour(:,1),2),coord(tour(:,1),3),num2str(coord(tour(:,1),1)),'HorizontalAlignment','center','VerticalAlignment','bottom')
text(coord(tour(:,1),2),coord(tour(:,1),3), cities(tour(:,1),2),'HorizontalAlignment','center','VerticalAlignment','top')


hold on;
plot([coord(tour(:,1),2);coord(1,2)],[coord(tour(:,1),3);coord(1,3)]);
plot(coord(1,2),coord(1,3),'r*'); % the star marks Atlanta
