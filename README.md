# Individual-fMRI-Approaches reveal Cerebellar-Visual Community in patients with OCD that is related to their Obsessive-Compulsive symptom scores

## Summary of work and code
The study compares the brain organisation of healthy controls and patients with obsessive compulsive disorder (OCD).

To this aim, the study utilises the resting state fMRI's (rsfMRI) of all subjects and removes the common subspace shared by the subjects in each group to obtain the individual-fMRI of a subject. The method uses common and orthogonal basis extraction technique that was developed by Zhou et al, (2016). The method has been shownto benefit rsfMRI studies (Kashyap et al, 2019).  

The present work also found Individual-fMRI's to be better than conventional-fMRI when functional connections are compared between healthy controls and patients with OCD. The code helps to obtain the individual fMRI of a subject and project the common subspace on the brain (please download the code https://github.com/alexandershaw4/SourceMesh).

Prediction based approches were used to justify that the functional architecture of the brain of patients with OCD is different from controls. Elastic-net (Zou and Hastie, 3005; Friedman et al, 2010), in leave-one-out cross validation was used. The code can be downloaded from https://web.stanford.edu/~hastie/glmnet_matlab/. Alternatively, if you are using MATLAB 2020 version (and above) then elastic-net algorithm can be inbuilt.

Brain organisation of patients with OCD and healthy controls were obtained through community detection technique (Betzel et al, 2019). The algorithm provides community structure of each subject and allows to estimate the number nodes each subject has in a community. The code is available here https://www.brainnetworkslab.com/coderesources.

We used the inter-individual variation in the number of nodes in a community to predict the behavioural scores of OCD related behavioural measures (anxiety (HAS), depression (HDRS), obsessive and compulsive measures (OCI-R and Y-BOCS)). Stronger association were found only for OCI-R score.

*Communities revealed that frontal dissociation with striatal and limbic regions and cerebellar association with visual regions are the key features related to clinical symtomatology of OCD.


## Please enjoy our work
Kashyap R, Eng GK, Bhattacharjee S, Gupta B, Ho R, Ho SH., Zhang, M.,Mahendran, R., Sim, K., Chen SH.A Individual-based Approach reveals Fronto-Striato-Limbic dissociation and Cerebellar-Visual association in Obsessive-Compulsive Disorder. Scientific Reports, (2020).

If you are using the code, please also cite
Zhou, G., Cichocki, A., Zhang, Y. & Mandic, D. P. Group Component Analysis for Multiblock Data: Common and Individual Feature Extraction. IEEE Transactions on Neural Networks and Learning Systems 27, 2426–2439 (2016).

For any details or queries please contact: clinicalbrainlab@gmail.com 


### References (important to the work)
#1. Zhou, G., Cichocki, A., Zhang, Y. & Mandic, D. P. Group Component Analysis for Multiblock Data: Common and Individual Feature Extraction. IEEE Transactions on Neural Networks and Learning Systems 27, 2426–2439 (2016).
#2. Kashyap, R. et al. Individual-specific fMRI-Subspaces improve functional connectivity prediction of behavior. NeuroImage 189, 804–812 (2019).
#3. Friedman, J., Hastie, T. & Tibshirani, R. Regularization paths for generalized linear models via coordinate descent. Journal of statistical software 33, 1 (2010).
#4. Zou, H. & Hastie, T. Regularization and variable selection via the elastic net. Journal of the royal statistical society: series B (statistical methodology) 67, 301–320 (2005).
#5. Betzel, R. F. et al. The community structure of functional brain networks exhibits scale-specific patterns of inter-and intra-subject variability. Neuroimage 202, 115990 (2019).
