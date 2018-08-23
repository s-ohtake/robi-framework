# Welcome to the R batch framework 

The batch framework base is Java spring（java batch framework） 

```
R言語でバッチ処理をする為のフレームワークです。
このフレームワークのベースはspring(Java)の構成にしています。
```

* Structure of the directory and file
```
~/robi-framework/src% tree
├── README.md
├── data             -- job result data
│   ├── iris_0.1.txt
│   ├── iris_0.2.txt
│   ├── iris_0.3.txt
│   ├── iris_0.4.txt
│   ├── iris_0.5.txt
│   ├── iris_0.6.txt
│   ├── iris_0.7.txt
│   ├── iris_0.8.txt
│   └── iris_0.9.txt
├── package.R
├── robi-framework.Rproj
└── src
    ├── Core
    │   ├── Config.R          -- This file is read at start from R　and .Rprofile
    │   ├── Item.R            -- ItemRead and ItemWrite superclass
    │   ├── ItemItemWriterInterface.R   --ItemWriter Interface
    │   ├── ItemProcessor.R          
    │   └── ItemReaderInterface.R --ItemReader Interface
    ├── ItemProcessor         --Processors responsible for data processing implement input checking and business logic
    │   └── IrisProcessor.R
    ├── ItemReader            --Output of data
    │   ├── IrisRead.R
    │   └── UserRead.R        -- DB access sample 
    ├── ItemWriter            -- Write data　
    │   └── IrisWriter.R
    ├── Job
    │   ├── irisJob.R
    │   └── script.R.log
    ├── Model
    │   └── irisModel.R
    └── Step
        └── irisStep.R
 ```

# quick start
In the quick start Iris data is classified by SVM, Nnet, NaiveBayse

Initial setting
```
install.packages('R6')
install.packages("devtools")
devtools::install_github("rappster/R6", ref = "feat_interface")

# R session restart 

install.packages('rJava')
install.packages('RJDBC')
install.packages('erer')
install.packages('e1071')
install.packages('kernlab')
install.packages('nnet')

```
* open job file
```
src/job/irisJob.R
```
* R stuido or R console 
```
Select and run the script
```

* R CMD
```
R CMD BATCH --slave --vanilla  src/job/irisJob.R log/irisJob.log
```
* result out put to see
```
/data dir
```
or
```
$`prob= 0.1`
$`prob= 0.1`$Svm
            
svm.res      setosa versicolor virginica
  setosa         41          0         0
  versicolor      1         44        49
  virginica       0          0         0

$`prob= 0.1`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         42          0         0
  versicolor      0         44        12
  virginica       0          0        37

$`prob= 0.1`$Nb
            
nb.res       setosa versicolor virginica
  setosa         42          0         0
  versicolor      0         44        49
  virginica       0          0         0


$`prob= 0.2`
$`prob= 0.2`$Svm
            
svm.res      setosa versicolor virginica
  setosa         41          0         0
  versicolor      0         35         5
  virginica       0          4        35

$`prob= 0.2`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         41          0         0
  versicolor      0         37         5
  virginica       0          2        35

$`prob= 0.2`$Nb
            
nb.res       setosa versicolor virginica
  setosa         41          0         0
  versicolor      0         39         4
  virginica       0          0        36


$`prob= 0.3`
$`prob= 0.3`$Svm
            
svm.res      setosa versicolor virginica
  setosa         30          0         0
  versicolor      0         33         2
  virginica       0          5        35

$`prob= 0.3`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         30          0         0
  versicolor      0         38         3
  virginica       0          0        34

$`prob= 0.3`$Nb
            
nb.res       setosa versicolor virginica
  setosa         30          0         0
  versicolor      0         32         3
  virginica       0          6        34


$`prob= 0.4`
$`prob= 0.4`$Svm
            
svm.res      setosa versicolor virginica
  setosa         28          0         0
  versicolor      1         25         3
  virginica       0          3        30

$`prob= 0.4`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         29          0         0
  versicolor      0         25         2
  virginica       0          3        31

$`prob= 0.4`$Nb
            
nb.res       setosa versicolor virginica
  setosa         29          0         0
  versicolor      0         23         2
  virginica       0          5        31


$`prob= 0.5`
$`prob= 0.5`$Svm
            
svm.res      setosa versicolor virginica
  setosa         25          0         0
  versicolor      0         25         2
  virginica       0          1        22

$`prob= 0.5`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         25          2         0
  versicolor      0         22         1
  virginica       0          2        23

$`prob= 0.5`$Nb
            
nb.res       setosa versicolor virginica
  setosa         25          0         0
  versicolor      0         25         2
  virginica       0          1        22


$`prob= 0.6`
$`prob= 0.6`$Svm
            
svm.res      setosa versicolor virginica
  setosa         23          0         0
  versicolor      0         14         1
  virginica       0          0        22

$`prob= 0.6`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         23          0         0
  versicolor      0         14         2
  virginica       0          0        21

$`prob= 0.6`$Nb
            
nb.res       setosa versicolor virginica
  setosa         23          0         0
  versicolor      0         14         1
  virginica       0          0        22


$`prob= 0.7`
$`prob= 0.7`$Svm
            
svm.res      setosa versicolor virginica
  setosa         13          0         0
  versicolor      0         15         3
  virginica       0          2        12

$`prob= 0.7`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa         13          0         0
  versicolor      0         16         1
  virginica       0          1        14

$`prob= 0.7`$Nb
            
nb.res       setosa versicolor virginica
  setosa         13          0         0
  versicolor      0         16         2
  virginica       0          1        13


$`prob= 0.8`
$`prob= 0.8`$Svm
            
svm.res      setosa versicolor virginica
  setosa          7          0         0
  versicolor      0          9         3
  virginica       0          0        11

$`prob= 0.8`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa          7          0         0
  versicolor      0          9         5
  virginica       0          0         9

$`prob= 0.8`$Nb
            
nb.res       setosa versicolor virginica
  setosa          7          0         0
  versicolor      0          9         3
  virginica       0          0        11


$`prob= 0.9`
$`prob= 0.9`$Svm
            
svm.res      setosa versicolor virginica
  setosa          4          0         0
  versicolor      0          4         1
  virginica       0          0         6

$`prob= 0.9`$Nnet
            
nnet.res     setosa versicolor virginica
  setosa          4          0         0
  versicolor      0          4         0
  virginica       0          0         7

$`prob= 0.9`$Nb
            
nb.res       setosa versicolor virginica
  setosa          4          0         0
  versicolor      0          4         1
  virginica       0          0         6
```
