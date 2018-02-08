%clear from previous runs
clear;
clf;

%find the SVD of our input, A
A = [1, 2; 0, 2];
[U, S, V] = svd(A);

%draw the unit circle using a parameterization of sin and cos
hold on
theta = 0 : pi / 50 : 2 * pi;
x = cos(theta);
y = sin(theta);
plot(x, y);
%draw the columns of V
plotv(V(:,1));
plotv(V(:,2));
hold off

%draw the ellipse resulting from the SVD
ellipse = figure;
figure(ellipse);
hold on
%find the image of the unit circle via the same parameterization as prior
theta = 0 : pi / 50 : 2 * pi;
x = cos(theta);
y = sin(theta);
ellipse_x = A(1) * x + A(3) * y;
ellipse_y = A(2) * x + A(4) * y;
plot(ellipse_x, ellipse_y);
%draw the scaled columns of U
plotv(U*S(:,1));
plotv(U*S(:,2));
hold off