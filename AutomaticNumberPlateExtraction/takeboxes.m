function r=takeboxes(NR,container,chk)
takethisbox=[]; % Initialize the variable to an empty matrix.
for i=1:size(NR,1)
    if NR(i,(2*chk))>=container(1) && NR(i,(2*chk))<=container(2) % If Bounding box is among the container plus tolerence.
        takethisbox=cat(1,takethisbox,NR(i,:)); % Take that box and concatenate along first dimension.
    end
end
r=[];
for k=1:size(takethisbox,1)
    var=find(takethisbox(k,1)==reshape(NR(:,1),1,[])); % Finding the indices of the interested boxes among NR
    if length(var)==1                                  % since x-coordinate of the boxes will be unique.  
        r=[r var];                                     
    else                                               % In case if x-coordinate is not unique 
        for v=1:length(var)                            % then check which box fall under container condition. 
            M(v)=NR(var(v),(2*chk))>=container(1) && NR(var(v),(2*chk))<=container(2);
        end
        var=var(M);
        r=[r var];
    end
end
end
