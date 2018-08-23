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
