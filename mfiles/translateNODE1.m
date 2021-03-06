function [NODE2 ELEMENT2]=translateNODE1(NODE1,ELEMENT1)

load('inputDataFile', 'springToWall');

NODE2=[];
ELEMENT2=[];
SIZE_NODE=size(NODE1,1);
SIZE_ELEM=size(ELEMENT1,1);

for i=1:SIZE_NODE
   X=NODE1(i,2);
   Y=NODE1(i,3);
   Z=NODE1(i,4);
   [T,R]=cart2pol(X,Y,Z);
   R=R+springToWall;
   [X,Y,Z]=pol2cart(T,R,Z);
   NODE2=[NODE2; i+SIZE_NODE X Y Z];
end

for i=1:SIZE_ELEM
   ELEMENT2=[ELEMENT2; ...
       i+SIZE_ELEM, 2 2 , ...
       ELEMENT1(i,4), ...
       ELEMENT1(i,5), ...
       ELEMENT1(i,6), ...
       ELEMENT1(i,7), ...
       ELEMENT1(i,4)+SIZE_NODE, ...
       ELEMENT1(i,5)+SIZE_NODE, ...
       ELEMENT1(i,6)+SIZE_NODE, ...
       ELEMENT1(i,7)+SIZE_NODE ...
       ];
    
end

end