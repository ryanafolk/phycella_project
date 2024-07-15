* Notes
* If you get: Error: we are in trouble.  Increase LSPNAME?.
* You need to shorten the taxon names considerably
* If you get: Perhaps you did not separate the sequence from its name by >2 spaces?
* Check both the taxon number in the phylip headers and that there are at least 
* two spaces between name and sequence (tab alone isn't enough)

    seed = -1 
    * Threads = 1 1 1 * Can only use when estimating theta
    
    seqfile = combined.case1.phy
    Imapfile = imap.phyc.case1.txt 
    outfile = out.case1.txt 
    mcmcfile = mcmc.case1.txt 
    traitfile = trait_phycella.case1.csv

    speciesdelimitation = 1 1 2 1 0 1
    
    uniformrootedtrees = 1
            
    cleandata = 0 * remove sites with ambiguity data (1:yes, 0:no)?
    
    species&tree = 13     P28 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47
                    2 3 2 2 3 3 3 2 3 2 3 3 2
                    ((P46,P47),(P45,((P36,P37),(P39,(P40,(P42,(P44,(P28,(P41,(P43,P38))))))))));
    * starting tree from astral population allele table

    
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
    burnin = 200000 * 2000 default
    sampfreq = 2 
    nsample = 100000 * 20000 default
