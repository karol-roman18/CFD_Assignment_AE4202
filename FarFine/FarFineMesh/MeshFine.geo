Include "airfoil.geo";
nmain = 120;
mainprog = 1.071;
ninlet = 100;
ntop = 75;
nbot1 = 64;
nbot2 = 62;
nwake = 50;
nfar = 150;
//+
Split Curve {88} Point {106};
//+
Point(160) = {-0.5, 3.36, 0, 1.0};
//+
Point(161) = {-0.5, -3.36, 0, 1.0};
//+
Point(162) = {1.5, 3.36, 0, 1.0};
//+
Point(163) = {1.2, -3.36, 0, 1.0};
//+
Circle(104) = {160, 80, 161};
//+
Line(105) = {72, 160};
//+
Line(106) = {88, 161};
//+
Line(107) = {1, 162};
//+
Line(108) = {1, 163};
//+
Line(109) = {162, 160};
//+
Point(166) = {3.5, 0.0604, 0, 1.0};
//+
Point(167) = {3.5, -3.36, 0, 1.0};
//+
Point(168) = {3.5, 3.36, 0, 1.0};
//+
Line(111) = {166, 168};
//+
Line(112) = {166, 167};
//+
Line(113) = {162, 168};
//+
Line(114) = {1, 166};
//+
Line(115) = {163, 167};
//+
Point(169) = {17, 3.36, 0, 1.0};
//+
Point(170) = {17, 0.0604, 0, 1.0};
//+
Point(171) = {17, -3.36, 0, 1.0};
//+
Line(116) = {168, 169};
//+
Line(117) = {166, 170};
//+
Line(118) = {167, 171};
//+
Line(119) = {170, 169};
//+
Line(120) = {170, 171};
//+
Point(172) = {0.22482, -3.36, 0, 1.0};
//+
Line(121) = {106, 172};
//+
Line(122) = {161, 172};
//+
Line(123) = {172, 163};

//+
Transfinite Curve {105, 107, 111, 119, 106, 121, 108, 112, 120} = nmain Using Progression mainprog;
//+
Transfinite Curve {104} = ninlet Using Bump 0.1;
//+
Transfinite Curve {72} = ninlet Using Bump 4;
//+
Transfinite Curve {109} = ntop Using Bump 1;
//+
Transfinite Curve {1} = ntop Using Progression 0.96;
//+
Transfinite Curve {123} = nbot2 Using Progression 1.002;
//+
Transfinite Curve {90} = nbot2 Using Progression 1.03;
//+
Transfinite Curve {89} = nbot1 Using Progression 1.015;
//+
Transfinite Curve {122} = nbot1 Using Bump 2.5;
//+
Transfinite Curve {114} = nwake Using Progression 1.025;
//+
Transfinite Curve {113} = nwake Using Progression 1.014;
//+
Transfinite Curve {115} = nwake Using Progression 1.035;
//+
Transfinite Curve {118} = nfar Using Progression 1.0;
//+
Transfinite Curve {117} = nfar Using Progression 1.0;
//+
Transfinite Curve {116} = nfar Using Progression 1.006;
//+
Curve Loop(1) = {105, 104, -106, -72};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {1, 105, -109, -107};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {89, 121, -122, -106};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {123, -108, -90, 121};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {107, 113, -111, -114};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {114, 112, -115, -108};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {112, 118, -120, -117};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {116, -119, -117, 111};
//+
Plane Surface(8) = {8};
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Surface {6};
//+
Transfinite Surface {7};
//+
Transfinite Surface {8};
//+
Transfinite Surface {5};
//+
Transfinite Surface {4};
//+
Transfinite Surface {3};
//+
Recombine Surface {1, 2, 6, 7, 8, 5, 4, 3};
//+
Extrude {0, 0, 1} {
  Surface{1}; Surface{2}; Surface{5}; Surface{8}; Surface{7}; Surface{6}; Surface{4}; Surface{3}; Layers {1}; Recombine;
}
//+
Physical Volume("Fluid", 300) = {1, 2, 3, 4, 5, 6, 7, 8};
//+
Physical Surface("Inlet", 301) = {136, 162, 180, 198};
//+
Physical Surface("Ground", 302) = {294, 264, 250, 224};
//+
Physical Surface("Outlet", 303) = {202, 228};
//+
Physical Surface("Side", 304) = {233, 211, 189, 167, 145, 299, 277, 255};
//+
Physical Surface("Side", 304) += {8, 5, 2, 1, 4, 6, 7, 3};
//+
Physical Surface("Wing", 305) = {272, 154, 286, 144};
