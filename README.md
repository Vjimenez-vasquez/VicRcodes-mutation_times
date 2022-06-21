# VicRCodes - mutation_times![lambda_spike](https://user-images.githubusercontent.com/89874227/174873913-22ef4978-25d2-4863-beab-bdb94d50b102.png)
## Description
"mutation_times" generates an intractive temporal visualization of
mutations, allowing the user to track for specific and even the
 discovery and identification of new mutational patterns. It only requires both 
nextclade and GISAID outputs merged as single data. 

## Usage 
```r
#metadata#
metadata <- read.csv("1655830637625.metadata.tsv", header=TRUE, sep="\t")
dim(metadata)
names(metadata)

#nextclade results#
results <- read.csv("results.tsv", header=TRUE, sep="\t")
dim(results)
names(results) <- c("strain",names(results)[2:53])
head(results)

#merge#
data <- merge(metadata,results, by="strain", all.x=TRUE)
dim(data)
data.frame(names(data))

#REGIONS#
regions(results)

#FUNCTION#
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
``` 

## output
An Interactive temporal visualization plotly
 showing the identified mutations in the right
