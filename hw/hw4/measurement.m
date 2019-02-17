%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab key recovery exercise template %
%                                       %
% 2014, Filip Stepanek and Jiri Bucek   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% declaration of the SBOX (might be useful to calculate the power hypothesis)
SBOX=[099 124 119 123 242 107 111 197 048 001 103 043 254 215 171 118 ...
      202 130 201 125 250 089 071 240 173 212 162 175 156 164 114 192 ...
      183 253 147 038 054 063 247 204 052 165 229 241 113 216 049 021 ...
      004 199 035 195 024 150 005 154 007 018 128 226 235 039 178 117 ...
      009 131 044 026 027 110 090 160 082 059 214 179 041 227 047 132 ...
      083 209 000 237 032 252 177 091 106 203 190 057 074 076 088 207 ...
      208 239 170 251 067 077 051 133 069 249 002 127 080 060 159 168 ...
      081 163 064 143 146 157 056 245 188 182 218 033 016 255 243 210 ...
      205 012 019 236 095 151 068 023 196 167 126 061 100 093 025 115 ...
      096 129 079 220 034 042 144 136 070 238 184 020 222 094 011 219 ...
      224 050 058 010 073 006 036 092 194 211 172 098 145 149 228 121 ...
      231 200 055 109 141 213 078 169 108 086 244 234 101 122 174 008 ...
      186 120 037 046 028 166 180 198 232 221 116 031 075 189 139 138 ...
      112 062 181 102 072 003 246 014 097 053 087 185 134 193 029 158 ...
      225 248 152 017 105 217 142 148 155 030 135 233 206 085 040 223 ...
      140 161 137 013 191 230 066 104 065 153 045 015 176 084 187 022];


%%%%%%%%%%%%%%%%%%%%
% LOADING the DATA %
%%%%%%%%%%%%%%%%%%%%

% modify following variables so they correspond 
% your measurement setup
numberOfTraces = 200;
traceSize = 350000;

% modify the following variables to speed-up the measurement
% (this can be done later after analysing the power trace)
offset = 0;
segmentLength = 350000; % for the beginning the segmentLength = traceSize
                    
% columns and rows variables are used as inputs 
% to the function loading the plaintext/ciphertext
columns = 16;
rows = numberOfTraces;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Calling the functions %
%%%%%%%%%%%%%%%%%%%%%%%%%

% function myload processes the binary file containing the measured traces and
% stores the data in the output matrix so the traces (or their reduced parts)
% can be used for the key recovery process.
% Inputs:
%   'file' - name of the file containing the measured traces
%   traceSize - number of samples in each trace
%   offset - used to define different beginning of the power trace
%   segmentLength - used to define different/reduced length of the power trace
%   numberOfTraces - number of traces to be loaded
%
% To reduce the size of the trace (e.g., to speed-up the computation process) 
% modify the offset and segmentLength inputs so the loaded parts of the
% traces correspond to the trace segment you are using for the recovery.
traces = myload('traces.bin', traceSize, offset, segmentLength, numberOfTraces);

% function myin is used to load the plaintext and ciphertext 
% to the corresponding matrices. 
% Inputs:
%   'file' - name of the file containing the plaintext or ciphertext
%   columns - number of columns (e.g., size of the AES data block)
%   rows - number of rows (e.g., number of measurements)
plaintext = myin('plaintext.txt', columns, rows);
ciphertext = myin('ciphertext.txt', columns, rows);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE 1 -- Plotting the power trace(s): %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot one trace (or plot the mean value of traces) and check that it is complete 
% and then select the appropriate part of the traces (e.g., containing the first round).

% --> create the plots here <--  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE 2 -- Key recovery: %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create the power hypothesis for each byte of the key and then correlate
% the hypothesis with the power traces to extract the key.
% Task consists of the following parts:
%   - create the power hypothesis
%   - extract the key using the results of the mycorr function

% variables declaration
byteStart = 1;
byteEnd = 16;
keyCandidateStart = 0;
keyCandidateStop = 255;

% for every byte in the key do:
for BYTE=byteStart:byteEnd  
    
    % Create the power hypothesis matrix (dimensions: 
    % rows = numberOfTraces, columns = 256). 
    % The number 256 represents all possible bytes (e.g., 0x00..0xFF). 
    powerHypothesis = zeros(numberOfTraces,256);
    for K = keyCandidateStart:keyCandidateStop   
        % the actual dpa
        % try all the keys
        % the way to try:
        % for all the inputs, go through each column , compute intermediate
        % value, take known data do exclusive or with the key then do a
        % table lookup - in this way fill the matrix of
        % create the v matrix
        % --> create the power hypothesis here <--  
        
        % do a pop count or hamming to get thenumber of ones this is the
        % pwoer
    end;

        
    
    % function mycorr returns the correlation coeficients matrix calculated
    % from the power consumption hypothesis matrix powerHypothesis and the
    % measured power traces. The resulting correlation coeficients stored in
    % the matrix CC are later used to extract the correct key.
    CC = mycorr(powerHypothesis, traces);
    
    % --> do some operations here to find the correct byte of the key <--

    % take the maximum correlation coefficient - this corresponds to one
    % correct byte
    % this is what the mycorr correlation coefficient is doing
    % get a single row  and a single columns row k, column j that
    % correspond to the k forrect key and the j correct time
    
    
    
end;
