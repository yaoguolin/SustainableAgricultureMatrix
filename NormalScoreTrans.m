function [var_score] = NormalScoreTrans(var_name)

var_name2 = var_name(~isnan(var_name)& isfinite(var_name));
var_min = prctile(var_name2,5);
var_max = prctile(var_name2,95);

var_score = var_name;
var_score(:,:) = nan;


var_score = (var_name - var_min).*100./(var_max - var_min);

var_score(var_name<var_min) = 0;
var_score(var_name>var_max) = 100;

end

