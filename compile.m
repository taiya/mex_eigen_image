function compile(input)
    clc;
    localpath = fileparts(which('compile'));
    if nargin==0, input = 'fun_mex.cpp'; end;

    % eigen_include_path = ['-I',localpath,'\include']; %< win32
    eigen_include_path = '-I/usr/local/include/eigen3'; %< mac
    if ~iscell(input)
        inputs{1} = input;
    else
        inputs = input;
    end

    fprintf(1,'Compiling library [%s]...\n', localpath);

    % inputs = {'mex_meld.cpp', 'mex_myim2col.cpp'};
    for i=1:numel(inputs)
        err = mex(eigen_include_path, '-outdir',localpath,[localpath,'/',inputs{i}]);
        if err ~= 0, 
            error('compile failed!'); 
        end
    end    
end