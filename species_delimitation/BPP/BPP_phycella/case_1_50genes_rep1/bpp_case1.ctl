    seed = -1 
    Threads = 1 1 1 * Can only use when estimating theta
    
    seqfile = ./Set50_case1/combined.phy
    Imapfile = imap.phyc.case1.txt 
    outfile = out.case1.txt 
    mcmcfile = mcmc.case1.txt 

    speciesdelimitation = 1 1 2 1 * speciesdelimitation algorithm1 finetune (a m)
    speciestree = 1 * speciestree pSlider ExpandRatio ShrinkRatio
    speciestree = 1  0.4 0.2 0.1   * speciestree pSlider ExpandRatio ShrinkRatio
        
    speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted
    
    cleandata = 0 * remove sites with ambiguity data (1:yes, 0:no)?
    
    usedata = 1 * 0: no data (prior); 1:seq like
    nloci = 50 * number of data sets in seqfile
    
    species&tree = 13     P28_chilensis P36_australis P37_australis P38_chilensis P39_australis P40_australis P41_chilensis P42_chilensis P43_chilensis P44_chilensis P45_fulgens P46_maulensis P47_maulensis
                    2 3 2 2 3 3 3 2 3 2 3 3 2
                    ((P46_maulensis,P47_maulensis),(P45_fulgens,((P36_australis,P37_australis),(P39_australis,(P40_australis,(P42_chilensis,(P44_chilensis,(P28_chilensis,(P41_chilensis,(P43_chilensis,P38_chilensis))))))))));
    * starting tree from astral population allele table
    
    thetaprior = 3  0.017 # invgamma(a, b) for theta
    tauprior = 3  0.22 # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
    
    finetune = 1: 0.02 0.02 0.02 0.02 0.02 0.02 0.02 # finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr
    
    print = 1 0 0 0 
    burnin = 2000 * 2000 default
    sampfreq = 2 
    nsample = 100000 * 20000 default
