* Notes
* If you get: Error: we are in trouble.  Increase LSPNAME?.
* You need to shorten the taxon names considerably
* If you get: Perhaps you did not separate the sequence from its name by >2 spaces?
* Check both the taxon number in the phylip headers and that there are at least 
* two spaces between name and sequence (tab alone isn't enough)

    seed = -1 
    * Threads = 1 1 1 * Can only use when estimating theta
    
    seqfile = combined.case3.phy
    Imapfile = imap.phyc.case3.txt 
    outfile = out.case3.txt 
    mcmcfile = mcmc.case3.txt 
    traitfile = trait_phycella.case3.csv

    speciesdelimitation = 1 1 2 1 0 1
    
    uniformrootedtrees = 1
            
    cleandata = 0 * remove sites with ambiguity data (1:yes, 0:no)?
    
    species&tree = 11      P21 P15 P31 P6 P34 P5 P16 P27 P3 P1 P4
                    2 4 3 5 3 2 3 3 3 3 5
                    (P21,(((P15,P31),(P6,P34)),(P5,(P16,(P27,(P3,(P1,P4)))))));
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
    burnin = 2000 * 2000 default
    sampfreq = 2 
    nsample = 100000 * 20000 default
