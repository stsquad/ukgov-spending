##
## Process "clean.csv" and dump some information out
##

## 1. read in a data table
##
## fileEncoding is the key to dealing with weird multi-byte characters
## for extended character sets. We use latin1 but it may be UTF-8, the website didn't say
##

# tbl <- read.csv(file.choose(),header=TRUE,sep=",",fileEncoding="latin1")
tbl <- read.csv("clean.csv",header=TRUE,sep=",",fileEncoding="latin1")

## Lets tweak amount to be a real number
tbl$Amount <- as.numeric(gsub(",", "", sub("\\£","", tbl$Amount)))

# Lets iterate the the names/table heads
for(n in names(tbl)){
    cat ("Looking at heading: ", n, "\n")
    cat (length(tbl[[n]]), " entries\n")
    cat (length(unique(tbl[[n]])), " are unqiue\n")
}


# Looking at the DWP CSV files I reckon
# Departmental Family,Entity,Expense Type,Expense Area,Supplier
#dpf <- pivotOptions(tbl[["Departmental.Family"]])

## So lets extract all the unqiue Expense.Types
expTypes <- unique(tbl[["Expense.Type"]])

for (e in expTypes) {
    ## Sum up all rows with this expense type

    totalCost = sum(tbl[tbl$"Expense.Type" == e, "Amount"])
    cat ("For ", e, " total is ", totalCost, "\n")
}
