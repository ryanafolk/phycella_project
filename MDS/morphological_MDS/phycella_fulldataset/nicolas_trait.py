#!/usr/bin/env python3

import csv # To process tab-delimited files
import numpy # Used for random sampling 
import sys # To process arguments
import pandas # 
import re
import random
import scipy.spatial
import itertools

infile = sys.argv[1] # Input csv
outfile = sys.argv[2] # Pre-coded output csv
distancematrix = sys.argv[3] # Distance matrix

traitdataset = pandas.read_csv(infile, sep=',', header='infer', encoding = 'utf-8') # Encoding can be problematic
# If you get BOM-related errors use this:
# perl -e 's/\xef\xbb\xbf//;' -pi~ sax_traits*

# E.g., run as:
# ./nicolas_trait.py phycella_traits_reduced.csv out.csv distancematrix.csv
	
print(traitdataset.columns.values)

# Format trait columns
for i in ["flws_n", "perig_form", "color", "est_form", "coron_typ", "coron_color"]:
	traitdataset[i].astype(str)

# Format measurement columns
for i in ["scp_h", "scp_lat", "flws_n", "spt_long", "spt_lat", "ped_long", "ped_lat", "ov_long", "ov_lat", "perig_long", "perig_diam", "tub_lat", "tep1_long", "tep1_lat", "tep3_long", "tep3_lat", "fil1_long", "fil2_long", "ant_long", "est_long", "coron_long", "coron_lat"]:
	traitdataset[i].astype(str)


# Write result
traitdataset.to_csv(path_or_buf=outfile, sep=",")



##############
# Now we prepare for distance matrix construction

# Set taxon as row label
traitdataset.set_index("taxon", inplace=True)
	
# Clean up dataframe
#traitdataset = traitdataset.drop(["Elevation","Special characters","Notes","Name source","Habitat"], axis = 1) # Axis 1 for columns

# Replace empty values as 0 for continuous data -- correct arithmetic
for a in ["scp_h", "scp_lat", "flws_n", "spt_long", "spt_lat", "ped_long", "ped_lat", "ov_long", "ov_lat", "perig_long", "perig_diam", "tub_lat", "tep1_long", "tep1_lat", "tep3_long", "tep3_lat", "fil1_long", "fil2_long", "ant_long", "est_long", "coron_long", "coron_lat"]:
	traitdataset[a].replace('', numpy.NaN, inplace=True)

# For discrete data, 0 is a valid datum, so use unoccupied number 
for a in ["flws_n", "perig_form", "color", "est_form", "coron_typ", "coron_color"]:
	traitdataset[a].replace('', numpy.NaN, inplace=True)


# Jaccard distance, i.e. identical is 0, maximally different is 1
traitdataset_matrix = traitdataset[["flws_n", "perig_form", "color", "est_form", "coron_typ", "coron_color"]].to_numpy()

# Solution from SourceForge for screening missing data values for scipy: https://stackoverflow.com/questions/24781461/compute-the-pairwise-distance-in-scipy-with-missing-values
discrete_dissimilarity_matrix = scipy.spatial.distance.squareform(numpy.array([scipy.spatial.distance.pdist(traitdataset_matrix[s][:, ~pandas.isnull(traitdataset_matrix[s]).any(axis=0)], "jaccard") for s in map(list, itertools.combinations(range(traitdataset_matrix.shape[0]), 2))]).ravel())

discrete_dissimilarity = pandas.DataFrame(discrete_dissimilarity_matrix, columns=traitdataset.index.values, index=traitdataset.index.values)	

#print(discrete_dissimilarity)

# Standardized euclidean distance
traitdataset_matrix = traitdataset[["scp_h", "scp_lat", "flws_n", "spt_long", "spt_lat", "ped_long", "ped_lat", "ov_long", "ov_lat", "perig_long", "perig_diam", "tub_lat", "tep1_long", "tep1_lat", "tep3_long", "tep3_lat", "fil1_long", "fil2_long", "ant_long", "est_long", "coron_long", "coron_lat"]].to_numpy()

# Solution from SourceForge for screening missing data values for scipy: https://stackoverflow.com/questions/24781461/compute-the-pairwise-distance-in-scipy-with-missing-values
continuous_dissimilarity_matrix = scipy.spatial.distance.squareform(numpy.array([scipy.spatial.distance.pdist(traitdataset_matrix[s][:, ~pandas.isnull(traitdataset_matrix[s]).any(axis=0)], "euclidean") for s in map(list, itertools.combinations(range(traitdataset_matrix.shape[0]), 2))]).ravel())

continuous_dissimilarity_matrix = continuous_dissimilarity_matrix/numpy.max(continuous_dissimilarity_matrix) # Normalize to max 1
continuous_dissimilarity = pandas.DataFrame(continuous_dissimilarity_matrix, columns=traitdataset.index.values, index=traitdataset.index.values)	

#print(continuous_dissimilarity)

# Sum two matrices, then divide by two to yield metric ranging from 0 to 1
combined_dataframe = (discrete_dissimilarity.add(continuous_dissimilarity))
combined_dataframe = combined_dataframe.divide(2)

# For cases where missing data filtering results in no distance
for a in combined_dataframe:
	combined_dataframe[a].replace(numpy.NaN, 0, inplace=True)
for a in combined_dataframe:
	combined_dataframe[a].replace('', 0, inplace=True)

print(type(combined_dataframe))
combined_dataframe.to_csv(path_or_buf=distancematrix, sep=",")

# Extra code for subsetting the distance matrix if needed

#tree_occ_matched_taxa = ["Adromischus_roaneanus", "Adromischus_montium-klinghardtii", "Adromischus_alstonii"]
#
#occurrence_not_trait = ["Orostachys_gorovoii", "Aeonium_pseudourbicum", "Sedum_yabeanum"]
#
#remove_list = [x for x in tree_occ_matched_taxa if x not in occurrence_not_trait]

#print(len(remove_list))
#print(list(combined_dataframe.index))

#def subset_columnrow(input, subsetlist):
#	sub = input[subsetlist]
#	sub = sub[sub.index.isin(subsetlist)]
#	if len(list(sub.index)) != len(sub.columns.values):
#		print("Subset did not work.")
#		sys.exit()
#	return sub
#
#combined_dataframe_subset = subset_columnrow(combined_dataframe, remove_list)
#combined_dataframe_subset.to_csv(path_or_buf="_".join([distancematrix, "occ_matched.csv"]), sep=",")
