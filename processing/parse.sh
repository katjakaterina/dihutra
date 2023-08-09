#! /bin/bash

LocalDir=./dihutra
#reviews
#en
InputENrev=./dihutra/reviews/en/txt
#ru
InputRUrevPRO=./dihutra/reviews/ru/prof/txt
InputRUrevSTU=./dihutra/reviews/ru/stud/txt
InputRUrevMT1=./dihutra/reviews/ru/mt1/txt
InputRUrevMT2=./dihutra/reviews/ru/mt2/txt
#hr
InputHRrevPRO=./dihutra/reviews/hr/prof/txt
InputHRrevSTU=./dihutra/reviews/hr/stud/txt
InputHRrevMT=./dihutra/reviews/hr/mt/txt
#fi
InputFIrevPRO=./dihutra/reviews/fi/prof/txt
InputFIrevSTU=./dihutra/reviews/fi/stud/txt
$InputFIrevMT=./dihutra/reviews/fi/mt/txt

#en
for file in $InputENrev/*.txt ; do python3 stanza_pipeline.py --language=en "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/en/conllu
mv $InputENrev/*.conllu $LocalDir/reviews/en/conllu

#ru
#stanza_pipeline_ru.py instead of stanza_pipeline.py because of missing mwt models for Russian
for file in $InputRUrevPRO/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/ru/prof/conllu
mv $InputRUrevPRO/*.conllu $LocalDir/reviews/ru/prof/conllu

for file in $InputRUrevSTU/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/ru/stud/conllu
mv $InputRUrevSTU/*.conllu $LocalDir/reviews/ru/stud/conllu

for file in $InputRUrevMT1/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/ru/mt1/conllu
mv $InputRUrevMT1/*.conllu $LocalDir/reviews/ru/mt1/conllu

for file in $InputRUrevMT2/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/ru/mt2/conllu
mv $InputRUrevMT2/*.conllu $LocalDir/reviews/ru/mt2/conllu


#hr
#stanza_pipeline_ru.py instead of stanza_pipeline.py because of missing mwt models for Croatian
for file in $InputHRrevPRO/*.txt ; do python3 stanza_pipeline_ru.py --language=hr "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/hr/prof/conllu
mv $InputHRrevPRO/*.conllu $LocalDir/reviews/hr/prof/conllu

for file in $InputHRrevSTU/*.txt ; do python3 stanza_pipeline_ru.py --language=hr "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/hr/stud/conllu
mv $InputHRrevSTU/*.conllu $LocalDir/reviews/hr/stud/conllu

for file in $InputHRrevMT/*.txt ; do python3 stanza_pipeline_ru.py --language=hr "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/hr/mt/conllu
mv $InputHRrevMT/*.conllu $LocalDir/reviews/hr/mt/conllu

#fi
for file in $InputFIrevPRO/*.txt ; do python3 stanza_pipeline.py --language=fi "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/fi/prof/conllu
mv $InputFIrevPRO/*.conllu $LocalDir/reviews/fi/prof/conllu

for file in $InputFIrevSTU/*.txt ; do python3 stanza_pipeline.py --language=fi "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/fi/stud/conllu
mv $InputFIrevSTU/*.conllu $LocalDir/reviews/fi/stud/conllu

for file in $InputFIrevMT/*.txt ; do python3 stanza_pipeline.py --language=fi "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/reviews/fi/mt/conllu
mv $InputFIrevMT/*.conllu $LocalDir/reviews/fi/mt/conllu

#news
#en
InputENnews=./dihutra/news/en/txt

#ru
InputRUnewsPRO=./dihutra/news/ru/prof/txt
InputRUnewsSTU=./dihutra/news/ru/stud/txt
InputRUnewsMT=./dihutra/news/ru/mt/txt

#hr
InputHRnewsPRO=./dihutra/news/hr/prof
InputHRnewsSTU=./dihutra/news/hr/stud
InputHRnewsMT=./dihutra/news/hr/mt/txt

#de
InputDEnews=./dihutra/news/de/txt

#en
for file in $InputENnews/*.txt ; do python3 stanza_pipeline.py --language=en "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/en/conllu
mv $InputENnews/*.conllu $LocalDir/news/en/conllu

#ru
#stanza_pipeline_ru.py instead of stanza_pipeline.py because of missing mwt models for Russian
for file in $InputRUnewsPRO/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/ru/prof/conllu
mv $InputRUnewsPRO/*.conllu $LocalDir/news/ru/prof/conllu

for file in $InputRUnewsSTU/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/ru/stud/conllu
mv $InputRUnewsSTU/*.conllu $LocalDir/news/ru/stud/conllu

for file in $InputRUnewsMT/*.txt ; do python3 stanza_pipeline_ru.py --language=ru "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/ru/mt/conllu
mv $InputRUnewsMT/*.conllu $LocalDir/news/ru/mt/conllu


#hr
#stanza_pipeline_ru.py instead of stanza_pipeline.py because of missing mwt models for Russian
for file in $InputHRnewsPRO/*.txt ; do python3 stanza_pipeline_ru.py --language=hr "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/hr/prof/conllu
mv $InputHRnewsPRO/*.conllu $LocalDir/news/hr/prof/conllu

for file in $InputHRnewsSTU/*.txt ; do python3 stanza_pipeline_ru.py --language=hr "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/hr/stud/conllu
mv $InputHRnewsSTU/*.conllu $LocalDir/news/hr/stud/conllu

for file in $InputHRnewsMT/*.txt ; do python3 stanza_pipeline_ru.py --language=hr "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/hr/mt/conllu
mv $InputHRnewsMT/*.conllu $LocalDir/news/hr/mt/conllu


#de
for file in $InputDEnews/*.txt ; do python3 stanza_pipeline.py --language=de "$file" "${file%.txt}.conllu"; done
mkdir $LocalDir/news/de/conllu
mv $InputDEnews/*.conllu $LocalDir/news/de/conllu
