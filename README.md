# Tracking global agricultural sustainability at the national scale

Xin Zhang†, Guolin Yao,†, Srishti Vishwakarma, Carole Dalin, Adam M. Komarek, David R. Kanter, Kyle Frankel Davis, Kimberly Pfeifer, Jing Zhao, Tan Zou, Paolo D'Odorico,  Christian Folberth, Fernando Galeana, Jessica Fanzo, L orenzo Rosa, William Dennison, Mark Musumba, Amy Heyman, Eric A. Davidson

† These authors contributed equally to this work

Run SAM_data_processing.m directly to transform the raw data to unbounded and bounded scores based on thresholds, and get normalized scores for synergy and trade-off analyses.
LinearScoreTrans.m and NormalScoreTrans.m are helper functions to calculate two types of scores.

Folder \
**data_raw:** contains raw data for environmental, economic, and social dimensions. \
**data_trans:** contains transformed data based on raw data values so that larger values indicate higher sustainability. \
**data_score:** contains unbounded and bounded scores based on thresholds (SAM_score_unbounded.mat, SAM_score_unbounded), and scores derived from normalization methods (SAM_score_normalization).


This code is prepared by Guolin Yao based on original scripts authored by Guolin Yao, Srishti Vishwakarma.
