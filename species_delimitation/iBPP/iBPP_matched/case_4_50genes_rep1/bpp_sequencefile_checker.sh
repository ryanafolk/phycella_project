awk '
  BEGIN{ nseq = 0; nlocus = 0; expectednseq = 0; };
  {
    if ($1 ~ /^[0-9]+/) { # start of new locus
      if (expectednseq != nseq){
        print "line " NR ", ending locus " nlocus ": expected " expectednseq ", found " nseq " sequences"
      }
      nlocus++;
      expectednseq = $1;
      nseq = 0
    };
    if ($1 ~ /P/ ) {nseq++} # line with a sequence
  };' combined*phy

