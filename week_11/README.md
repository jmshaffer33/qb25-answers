# Ex 1.1
## How many 100bp reads are needed to sequence a 1Mbp genome to 3x coverage?
1Mbp x 3x = 3Mbp of data  
3Mbp / 100bp / read = 0.03M reads = 30,000 reads  

# Ex 1.4 (3x coverage)
## 1. In your simulation, how much of the genome has not been sequenced (has 0x coverage)?
49598 bases have not been sequenced in 3x coverage. 

## 2. How well does this match Poisson expectations? How well does the normal distribution fit the data?
The data is best fit by a Poisson distribution, not a normal distribution as there is a fair portion of the genome that remains un-sequenced or minimally sequenced--this poor sequence coverege makes the distribution have a 'peak' at the left before trailling off at the higher coverange amounts. Poisson distributions are also better suited for rare events, which incorperates the lower coverage values.  

# Ex 1.5 (10x coverage)
## 1. In your simulation, how much of the genome has not been sequenced (has 0x coverage)?
109 bases have not been sequenced in 10x coverage.

## 2. How well does this match Poisson expectations? How well does the normal distribution fit the data?
The data is best fit by a normal distribution, not a Poisson distribution as there are (comparatively) very few bases that have not been sequenced once 10x coverage is achieved; if I remember correctly, at one point the ideal level of coverage to reach was 8x, which incurs a desirable normal distribution. 10 > 8 therby implying that a normal distribution better fits. 

# Ex 1.6 (30x coverage)
## 1. In your simulation, how much of the genome has not been sequenced (has 0x coverage)?
11 bases have not been sequenced in 10x coverage.

## 2. How well does this match Poisson expectations? How well does the normal distribution fit the data?
The data is best fit by a normal distribution, not a Poisson distribution as there are almost no bases that have not been sequenced once 30x coverage is achieved. The histogram is centered around 30, which is pretty big especially when 8x used to be the literature standard. I also have eyes and the histogram looks normally distributed. 

# Ex 2.4
dot -Tpng de_bruijn.dot -o ex2_digraph.pn

# Ex 2.5
## 1. Assume that the maximum number of occurrences of any 3-mer in the actual genome is five. Using your graph from Step 2.4, write one possible genome sequence that would produce these reads. 
ATTGATTCTTATTCATTT 

# Ex 2.6
## 1. In a few sentences, what would it take to accurately reconstruct the sequence of the genome?
Longer reads and higher coverage would allow for more accurate reconstruction of the genome sequence as it provides greater reference data from which to build more perfect sequences. Longer reads mean that you can build more accurate scaffolds with greater proportions of overlap between reads...which makes things more accurate becasue they are less likely to be rearranged in an incorrect order. Higher coverage would also contribute to a more accurate reconstruction of the genome because you just get more overlap with reads that are just slightly different from eachother..these small variations mean lessen the possibility of incorrect read arrangements. 
