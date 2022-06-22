# VicRCodes - mutation_times![lambda_spike](https://user-images.githubusercontent.com/89874227/174873913-22ef4978-25d2-4863-beab-bdb94d50b102.png)
## Description
"mutation_times" generates an intractive temporal visualization of
aminoacid mutations, allowing the user to track for specific and even the
 discovery and identification of new mutational patterns in every coding region 
identified by NEXTCLADE. It only requires both 
nextclade and GISAID outputs merged as single data. 

## Usage 
```r
#load metadata#
metadata <- read.csv("1655830637625.metadata.tsv", header=TRUE, sep="\t")
dim(metadata)
names(metadata)

#load nextclade results#
results <- read.csv("results.tsv", header=TRUE, sep="\t")
dim(results)
names(results) <- c("strain",names(results)[2:53])
head(results)

#merge both#
data <- merge(metadata,results, by="strain", all.x=TRUE)
dim(data)
data.frame(names(data))

#run "regions" command to obtain the list of identified cds#
regions(results)

#run "mutations_time" for every cds#
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:Spike",region="S")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:ORF1a",region="ORF1a")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:ORF1b",region="ORF1b")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:N",region="N")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:E",region="E")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:M",region="M")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:ORF3a",region="ORF3a")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:ORF6",region="ORF6")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:ORF8",region="ORF8")
mutations_time(data=data,xmin="2020-05-01",xmax="2022-02-25",ymin=0,ymax=380,freq=2,title="Lambda:ORF9b",region="ORF9b")

#arguments#
- data: merged data (GISAID metadata + NEXTCLADE results)
- xmin: minimum date range to consider in the plot
- xmax: maximum date range to consider in the plot
- ymin: minimum mutational frequency to consider in the y-axis
- ymax: maximum mutational frequency to consider in the y-axis
- freq: minimum mutatiional frequency to consider in the analysis
- title: plot title
- region: genomic region to analyze (S, ORF1a, ORF3, etc)
``` 

## output
An Interactive temporal visualization plotly
 showing the identified mutations in the right
