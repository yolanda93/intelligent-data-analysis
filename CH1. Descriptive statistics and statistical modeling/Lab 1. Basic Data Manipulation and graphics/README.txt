Lab #1: Basic Data Manipulation and graphics (with R)

Data sets:

cereal.txt, description (from STATLIB, starting at bottom of page 1)
physmeas.txt, description
R Script file used in this session: Lab#1.R 

We will practise basic inspection and exploration of data sets with R. 

Reading data from text or csv files (mainly tabular data)
Types of variables
Dealing with missing values
Applying functions to data frame elements. Family function apply.
Other way to do it: package "dplyr". Some resources:
http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
http://rstudio-pubs-static.s3.amazonaws.com/11068_8bc42d6df61341b2bed45e9a9a3bf9f4.html
https://stat545-ubc.github.io/block010_dplyr-end-single-table.html
http://seananderson.ca/2014/09/13/dplyr-intro.html
Basic plotting: package "graphics"
We will skip "lattice" package for graphics. Here is a reference: lattice
Enhaced plots: package "ggplot2". Some resources (or just type ggplot2 in Google):
Basic reference page
ggplot2 cheat sheet
Book by Hadley Wickham: "ggplot2: Elegant graphics for Data Analysis"
Hadley Wickham's slides on data manipulation and visualization
So far, we have imported tabular data in R. There are multiple packages and functions to read data in different formats: XML and XML-like, HTML, jason and others. If you know the basics of XML and HTML, using package XML you can practise importing such data from the web. Also, you can make R speak sql with package sqldf (reference).

Exercise
Notes on a possible answer