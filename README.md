Some random scripts for pulling and parsing data from Data.gov.uk

# Worked Example

## Fetch the CSV

    ./grab-data.py | head -n 1 | xargs wget

The head -n 1 just grabs the first, remove it to grab it all

## Remove the junk headers

The CSV file has some random stuff at the front, so delete the first few lines:

    cat dwp-payments-over-25000-for-october-2016.csv | sed -e '1,2d' > clean.csv

## Process the clean data with the query.R

    ./query.R

Which will dump out some summaries.
