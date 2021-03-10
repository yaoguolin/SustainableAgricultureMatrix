% Tracking global agricultural sustainability at the national scale
% This code script is designed for transform raw SAM indicators to SAM scores
% Coded by Guolin Yao, Srishti Vishwakarma
%% Read in the data
clear;
dir_raw = '.\data_raw\';
dir_score = '.\data_score\';
dir_trans = '.\data_trans\';
load([dir_raw 'SAM_basic.mat'])
load([dir_raw 'SAM_raw.mat'])

%% Initial transformation
%%%%%%%%%%%%%%% Environment %%%%%%%%%%%%%%%
%SUSI
Env_trans.SUSI=-log10(Env.SUSI + min(Env.SUSI(Env.SUSI>0)));

%Nsur
Env.Nsur(Env.Nsur<0) = 0;
Env_trans.Nsur= -Env.Nsur;

%Psur
Env.Psur(Env.Psur<0) = 0;
Env_trans.Psur= -Env.Psur;

%LCC
Env_trans.LCC=-log10(Env.LCC + min(Env.LCC(Env.LCC>0)));

%GHG
Env_trans.GHG=-log10(Env.GHG + min(Env.GHG(Env.GHG>0)));

%SER
Env_trans.SER=-log10(Env.SER);

%%%%%%%%%%%%%%%% Economics %%%%%%%%%%%%%%%
% AGDP
Econ_trans.AGDP = log10(Econ.AGDP);

% A2F
Econ_trans.A2F = Econ.A2F;

% PVOL
Econ_trans.PVOL = -log10(Econ.PVOL);

% AEXP
Econ_trans.AEXP = log10(Econ.AEXP);

% TROP
Econ_trans.TROP = log10(Econ.TROP);

% FLS
Econ_trans.FLS = Econ.FLS .* -1;

%%%%%%%%%%%%%%%% Social %%%%%%%%%%%%%%%
% RSH
Social_trans.RSH = Social.RSH;

% RSE
Social_trans.RSE = Social.RSE;
% UDN
Social_trans.UDN = Social.UDN .* -1;

% RPV
Social_trans.RPV = Social.RPV .* -1;

% GGG
Social_trans.GGG = Social.GGG;

% LRS
Social_trans.LRS = Social.LRS .* -1;

save([dir_trans, 'SAM_trans.mat'],'Env_trans','Econ_trans','Social_trans');

%% Score transformation - threshold method (unbounded)
%%%%%%%%%%%%%%% Environment %%%%%%%%%%%%%%%
%SUSI
Env_trans.SUSI(isinf(Env_trans.SUSI)) = nan;
Env_score.SUSI = LinearScroeTrans_f(Env_trans.SUSI,-1*log10(2+nanmin(Env.SUSI(Env.SUSI>0))),-1*log10(1+nanmin(Env.SUSI(Env.SUSI>0))),100/3,200/3);

%Nsur
Env_trans.Nsur(isinf(Env_trans.Nsur)) = nan;
Env_score.Nsur = LinearScroeTrans_f(Env_trans.Nsur,-69,-52,100/3,200/3);

%Psur
Env_trans.Psur(isinf(Env_trans.Psur)) = nan;
Env_score.Psur = LinearScroeTrans_f(Env_trans.Psur,-6.9,-3.5,100/3,200/3);

%LCC
Env_trans.LCC(isinf(Env_trans.LCC)) = nan;
Env_score.LCC = LinearScroeTrans_f(Env_trans.LCC,-1*log10(0.053+nanmin(Env.LCC(Env.LCC>0))),-1*log10(0+nanmin(Env.LCC(Env.LCC>0))),100/3,200/3);

%GHG
Env_trans.GHG(isinf(Env_trans.GHG)) = nan;
Env_score.GHG = LinearScroeTrans_f(Env_trans.GHG,-1*log10(1.08+nanmin(Env.GHG(Env.GHG>0))),-1*log10(0.86+nanmin(Env.GHG(Env.GHG>0))),100/3,200/3);

%SER
Env_trans.SER(isinf(Env_trans.SER)) = nan;
Env_score.SER = LinearScroeTrans_f(Env_trans.SER,-1*log10(5),-1*log10(1),100/3,200/3);

%%%%%%%%%%%%%%%% Economics %%%%%%%%%%%%%%%
% AGDP
Econ_trans.AGDP(isinf(Econ_trans.AGDP)) = nan;
Econ_score.AGDP = LinearScroeTrans_f(Econ_trans.AGDP,log10(460),log10(7946),100/3,200/3);

% AEXP
Econ_trans.AEXP(isinf(Econ_trans.AEXP)) = nan;
Econ_score.AEXP = LinearScroeTrans_f(Econ_trans.AEXP,log10(25),log10(2405),100/3,200/3);

% TROP
Econ_trans.TROP(isinf(Econ_trans.TROP)) = nan;
Econ_score.TROP = LinearScroeTrans_f(Econ_trans.TROP,log10(17),log10(71),100/3,200/3);

% A2F
Econ_trans.A2F(isinf(Econ_trans.A2F)) = nan;
Econ_score.A2F = LinearScroeTrans_f(Econ_trans.A2F,25,80,100/3,200/3);

% PVOL
Econ_trans.PVOL(isinf(Econ_trans.PVOL)) = nan;
Econ_score.PVOL = LinearScroeTrans_f(Econ_trans.PVOL,log10(1/0.23),log10(1/0.1),100/3,200/3);

% FLS
Econ_trans.FLS(isinf(Econ_trans.FLS)) = nan;
Econ_score.FLS = LinearScroeTrans_f(Econ_trans.FLS,-6.6,-2.5,100/3,200/3);

%%%%%%%%%%%%%%%% Social %%%%%%%%%%%%%%%
% RSH
Social_trans.RSH(isinf(Social_trans.RSH)) = nan;
Social_score.RSH = LinearScroeTrans_f(Social_trans.RSH,22,48,100/3,200/3);

% RSE
Social_trans.RSE(isinf(Social_trans.RSE)) = nan;
Social_score.RSE = LinearScroeTrans_f(Social_trans.RSE,30,100,100/3,200/3);

% UDN
Social_trans.UDN(isinf(Social_trans.UDN)) = nan;
Social_score.UDN = LinearScroeTrans_f(Social_trans.UDN,-7.5,0,100/3,200/3);

% RPV
Social_trans.RPV(isinf(Social_trans.RPV)) = nan;
Social_score.RPV = LinearScroeTrans_f(Social_trans.RPV,-13,-2,100/3,200/3);

% GGG
Social_trans.GGG(isinf(Social_trans.GGG)) = nan;
Social_score.GGG = LinearScroeTrans_f(Social_trans.GGG,70,80,100/3,200/3);

% LRS
Social_trans.LRS(isinf(Social_trans.LRS)) = nan;
Social_score.LRS = LinearScroeTrans_f(Social_trans.LRS,-3,-2,100/3,200/3);

save([dir_score, 'SAM_score_unbounded.mat'],'Env_score','Econ_score','Social_score');

%% Score transformation - threshold method (bounded)
envName = fieldnames(Env);
econName = fieldnames(Econ);
socName = fieldnames(Social);

envN = length(envName);
econN = length(econName);
socN = length(socName);

Env_scoreB = Env_score;
Econ_scoreB = Econ_score;
Social_scoreB = Social_score;


for var = 1:1:envN
    Env_scoreB.(envName{var})(Env_scoreB.(envName{var})>100) = 100;
    Env_scoreB.(envName{var})(Env_scoreB.(envName{var})<0) = 0; 
end

for var = 1:1:econN
    Econ_scoreB.(econName{var})(Econ_scoreB.(econName{var})>100) = 100;
    Econ_scoreB.(econName{var})(Econ_scoreB.(econName{var})<0) = 0; 
end

for var = 1:1:socN
    Social_scoreB.(socName{var})(Social_scoreB.(socName{var})>100) = 100;
    Social_scoreB.(socName{var})(Social_scoreB.(socName{var})<0) = 0; 
end

save([dir_score, 'SAM_score_bounded.mat'],'Env_scoreB','Econ_scoreB','Social_scoreB');



%% Score transformation - normalization (used for correlation)

Env_scoreN = structfun(@NormalScoreTrans, Env_trans, 'UniformOutput', false);
Econ_scoreN = structfun(@NormalScoreTrans, Econ_trans, 'UniformOutput', false);
Social_scoreN = structfun(@NormalScoreTrans, Social_trans, 'UniformOutput', false);

save([dir_score, 'SAM_score_normalization.mat'],'Env_scoreN','Econ_scoreN','Social_scoreN');


