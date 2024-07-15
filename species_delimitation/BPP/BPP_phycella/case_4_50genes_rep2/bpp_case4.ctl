    seed = -1 
    Threads = 1 1 1 * Can only use when estimating theta
    
    seqfile = ./Set50_case4/combined.phy
    Imapfile = imap.phyc.case4.txt 
    outfile = out.case4.txt 
    mcmcfile = mcmc.case4.txt 

    speciesdelimitation = 1 1 2 1 * speciesdelimitation algorithm1 finetune (a m)
    speciestree = 1 * speciestree pSlider ExpandRatio ShrinkRatio
    speciestree = 1  0.4 0.2 0.1   * speciestree pSlider ExpandRatio ShrinkRatio
        
    speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted
    
    cleandata = 0 * remove sites with ambiguity data (1:yes, 0:no)?
    
    usedata = 1 * 0: no data (prior); 1:seq like
    nloci = 50 * number of data sets in seqfile
    
    species&tree = 14       P11_ornata P10_amoena P8_amoena P9_amoena P12_ornata P13_lutea P20_quilapilun P14_ornata P33_ornata P35_lutea P32_arzae P17_arzae P19_arzae P18_davidii
                    3 3 3 3 2 2 4 4 3 3 2 3 3 5
                    ((P11_ornata,(P10_amoena,(P8_amoena,P9_amoena))),(P12_ornata,((P13_lutea,(P20_quilapilun,(P14_ornata,P33_ornata))),(P35_lutea,(P32_arzae,(P17_arzae,(P19_arzae,P18_davidii)))))));
                    * starting tree from astral population allele table
    
    thetaprior = 3  0.017 # invgamma(a, b) for theta
    tauprior = 3  0.22 # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
    
    finetune = 1: 0.02 0.02 0.02 0.02 0.02 0.02 0.02 # finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr
    
    print = 1 0 0 0 
    burnin = 2000 * 2000 default
    sampfreq = 2 
    nsample = 100000 * 20000 default
