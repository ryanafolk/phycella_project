    seed = -1 
    * Threads = 1 1 1 * Can only use when estimating theta
    
    seqfile = combined.tinyexample.phy
    Imapfile = imap.phyc.case1.tinyexample.txt 
    outfile = out.case1.txt 
    mcmcfile = mcmc.case1.txt 
    traitfile = trait_phycella.case1.tinyexample.csv

    speciesdelimitation = 1 1 2 1 0 1
    
    uniformrootedtrees = 1
            
    cleandata = 0 * remove sites with ambiguity data (1:yes, 0:no)?
    
    *species&tree = 13     P28_chilensis P36_australis P37_australis P38_chilensis P39_australis P40_australis P41_chilensis P42_chilensis P43_chilensis P44_chilensis P45_fulgens P46_maulensis P47_maulensis
    *                2 3 2 2 3 3 3 2 3 2 3 3 2
    *                ((P46_maulensis,P47_maulensis),(P45_fulgens,((P36_australis,P37_australis),(P39_australis,(P40_australis,(P42_chilensis,(P44_chilensis,(P28_chilensis,(P41_chilensis,(P43_chilensis,P38_chilensis))))))))));
    * starting tree from astral population allele table
    
    species&tree = 3     P38_chilensis P41_chilensis P43_chilensis
                    2 3 2
                    (P41_chilensis,(P43_chilensis,P38_chilensis));

    
	*usedata = 1    * 0: no data (prior); 1:seq & trait like
	useseqdata = 1    * 0: no seq data;     1:seq like
	usetraitdata = 1 
    nloci = 50 * number of data sets in seqfile
	ntraits = 1
	nindT = 19 
    
    thetaprior = 3  0.017 # invgamma(a, b) for theta
    tauprior = 3  0.22 # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
    nu0 = 0         # parameters for prior on traits
    kappa0 = 0         # nu0=0 and kappa0=0 for non-informative prior
    
    finetune = 1: 0.02 0.02 0.02 0.02 0.02 0.02 0.02 0.1 
    
    print = 1 0 0 0 
    burnin = 2000 * 2000 default
    sampfreq = 2 
    nsample = 100000 * 20000 default
