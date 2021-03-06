
library(tidyverse)
library(dplyr)
library(stringr)


#CHALLENGE 1
#getting data into r
f<-"https://raw.githubusercontent.com/difiore/ada-2021-datasets/main/darwin.txt"
darwin<-read.delim(f, header=T, sep="\t")

#how many paragraphs
glimpse(darwin)

#pringint 34th paragraph
x<-darwin[34,]
print(x)

#splitting 34th paragraph
split<-str_split(x, " ")
split<-unlist(split)
print(split)

#how many unique words?
unique<-unique(split)
length(unique)

#most common word
names(table(split))[as.vector(table(split))==max(table(split))]

#how many words only appear once
frequencies<-table(split)
length(names(frequencies)[frequencies==1])

#how many words appear 5 or more times
length(names(frequencies)[frequencies>4])

#extracting last paragraph
final_quote<-darwin[56,]

#splitting final_quote
split_quote<-str_split(final_quote, " ")
split_quote<-unlist(split_quote)

#extracting every 3rd element
every_third<-split_quote[seq(1,length(split_quote), 5)]
print(every_third)

#arranging in reverse alphabetical order
sort(every_third, decreasing=T)



#CHALLENGE 2

#creating the vectors
t<-c(35,88,42,84,81,30)
city<-c("Beijing","Lagos","Paris","Rio de Janeiro","San Juan","Toronto")

#associating temp data with city data
names(t)<-city

#accessing temperatures of first three cities on the list
t[1:3]

#accessing temperatures of Paris & San Juan
t[c(3,5)]

#CHALLENGE 3

#creating the matrix
m1<-matrix(data=c(159:1),nrow=8, ncol=20)
View(m1)

#extracting row 5 column 2
m1[5,2]

#extracting rows 5-7
m1[c(5:7),]

#Extracting the contents of row3 column4 to row6 column9 as a new variable
m2<-m1[3:6,4:9]
m2

#Examining this variable
class(m2)
mode(m2)

#This variable is a matrix array, and the mode is numeric

#Challenge 4

#creating the array
a<-array(data=seq(2,800,2), dim=c(5,5,4,4))

#Testing to see what the examples return
a[1,1,1,2]
a[2,3,2,]
a[1:5,1:5,3,3]

#CHALLENGE 5

#creating the list

#strepsirrhines
lorisoidea<-c("Lorisidae","Galagidae")
lorisiformes<-list(lorisoidea)
names(lorisiformes)<c("Lorisoidea")
lemuroidea<-c("Cheirogaleidae","Lepilemuridae","Indriidae","Lemuridae","Daubentoniidae")
lemuriformes<-list(lemuroidea)
names(lemuriformes)<-c("Lemuroidea")
strepsirrhini<-list(lorisiformes, lemuriformes)
names(strepsirrhini)<-c("Lorisiformes","Lemuriformes")

#haplorhines
cercopithecoidea<-c("Cercopithecidae")
hominoidea<-c("Hylobatidae","Hominidae")
catarhini<-list(hominoidea, cercopithecoidea)
names(catarhini)<-c("Hominoidea","Cercopithecoidea")
ceboidea<-c("Cebidae","Atelidae","Pitheciidae")
platyrrhini<-list(ceboidea)
names(platyrrhini)<-c("Ceboidea")
simiiformes<-list(platyrrhini, catarhini)
names(simiiformes)<-c("Platyrrhini", "Catarhini")
tarsioidea<-c("Tarsiidae")
tarsiiformes<-list(tarsioidea)
names(tarsiiformes)<-c("Tarsioidea")
haplorhini<-list(tarsiiformes, simiiformes)
names(haplorhini)<-c("Tarsiiformes","Simiiformes")
primates<-list(strepsirrhini, haplorhini)
names(primates)<-c("Strepsirrhini","Haplorhini")

#all primates
all<-list(primates)
names(all)<-c("Primates")

#separating platyrrhines
nwm<-haplorhini[[2]][1]

#looking at the structure of this new variable
class(nwm)
mode(nwm)

#extracting tarsiers
haplorhini$Tarsiiformes


