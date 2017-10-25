require 'csv'

lines = CSV.read('./kanji_1_500.csv', "r", {col_sep: "\t"})