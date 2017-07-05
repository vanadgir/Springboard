> library(readr)
> refine_original <- read_csv("~/Springboard/Foundations of Data Science/R projects/refine_original.csv")
Parsed with column specification:
cols(
  company = col_character(),
  `Product code / number` = col_character(),
  address = col_character(),
  city = col_character(),
  country = col_character(),
  name = col_character()
)

> refine_df %>% mutate(company = tolower(company))

> refine_df <- refine_df %>% mutate(company = tolower(company))
> View(refine_df)

> refine_df %>% filter(grepl('ph|fi', company))
# A tibble: 9 x 6
   company `Product code / number`             address   city         country            name
     <chr>                   <chr>               <chr>  <chr>           <chr>           <chr>
1 phillips                     p-5 Groningensingel 147 arnhem the netherlands   dhr p. jansen
2 phillips                    p-43 Groningensingel 148 arnhem the netherlands   dhr p. hansen
3  philips                     x-3 Groningensingel 149 arnhem the netherlands   dhr j. Gansen
4  phllips                    x-34 Groningensingel 150 arnhem the netherlands   dhr p. mansen
5  phillps                    x-12 Groningensingel 151 arnhem the netherlands  dhr p. fransen
6 phillips                    p-23 Groningensingel 152 arnhem the netherlands dhr p. franssen
7 phillips                    p-56   Delfzijlstraat 54 arnhem the netherlands mevr l.  mokken
8  fillips                    v-67   Delfzijlstraat 55 arnhem the netherlands mevr l.  mokken
9   phlips                    v-21   Delfzijlstraat 56 arnhem the netherlands mevr l.  mokken

> refine_df %>% filter(grepl('ph|fi', company)) %>% mutate(company = "phillips")
# A tibble: 9 x 6
   company `Product code / number`             address   city         country            name
     <chr>                   <chr>               <chr>  <chr>           <chr>           <chr>
1 phillips                     p-5 Groningensingel 147 arnhem the netherlands   dhr p. jansen
2 phillips                    p-43 Groningensingel 148 arnhem the netherlands   dhr p. hansen
3 phillips                     x-3 Groningensingel 149 arnhem the netherlands   dhr j. Gansen
4 phillips                    x-34 Groningensingel 150 arnhem the netherlands   dhr p. mansen
5 phillips                    x-12 Groningensingel 151 arnhem the netherlands  dhr p. fransen
6 phillips                    p-23 Groningensingel 152 arnhem the netherlands dhr p. franssen
7 phillips                    p-56   Delfzijlstraat 54 arnhem the netherlands mevr l.  mokken
8 phillips                    v-67   Delfzijlstraat 55 arnhem the netherlands mevr l.  mokken
9 phillips                    v-21   Delfzijlstraat 56 arnhem the netherlands mevr l.  mokken

> phillips_df <- refine_df %>% filter(grepl('ph|fi', company)) %>% mutate(company = "phillips")

> refine_df %>% filter(grepl('ak', company))
# A tibble: 7 x 6
  company `Product code / number`           address   city         country            name
    <chr>                   <chr>             <chr>  <chr>           <chr>           <chr>
1    akzo                    v-43 Leeuwardenweg 178 arnhem the netherlands   dhr p. bansen
2    akzo                    v-12 Leeuwardenweg 179 arnhem the netherlands   dhr p. vansen
3    akzo                     x-5 Leeuwardenweg 180 arnhem the netherlands  dhr p. bransen
4    akz0                    p-34 Leeuwardenweg 181 arnhem the netherlands  dhr p. janssen
5   ak zo                     q-5 Leeuwardenweg 182 arnhem the netherlands mevr l.  rokken
6    akzo                     q-9 Leeuwardenweg 183 arnhem the netherlands mevr l.  lokken
7    akzo                     x-8 Leeuwardenweg 184 arnhem the netherlands mevr l.  mokken

> akzo_df <- refine_df %>% filter(grepl('ak', company)) %>% mutate(company = "akzo")

> refine_df %>% filter(grepl('van', company))
# A tibble: 5 x 6
     company `Product code / number`           address   city         country            name
       <chr>                   <chr>             <chr>  <chr>           <chr>           <chr>
1 van houten                    x-45 Delfzijlstraat 57 arnhem the netherlands mevr l.  sokken
2 van houten                    v-56 Delfzijlstraat 58 arnhem the netherlands mevr l.  wokken
3 van houten                    v-65 Delfzijlstraat 59 arnhem the netherlands mevr l.  kokken
4 van houten                    x-21 Delfzijlstraat 60 arnhem the netherlands mevr l.  Bokken
5 van houten                    p-23 Delfzijlstraat 61 arnhem the netherlands mevr l.  dokken

> vanhouten_df <- refine_df %>% filter(grepl('van', company))

> refine_df %>% filter(grepl('uni', company))
# A tibble: 4 x 6
   company `Product code / number`        address   city         country             name
     <chr>                   <chr>          <chr>  <chr>           <chr>            <chr>
1  unilver                     x-3 Jourestraat 23 arnhem the netherlands  mevr l.  gokken
2 unilever                     q-4 Jourestraat 24 arnhem the netherlands mevr l.  stokken
3 unilever                     q-6 Jourestraat 25 arnhem the netherlands  mevr l.  rokken
4 unilever                     q-8 Jourestraat 26 arnhem the netherlands  mevr l.  rokken

> unilever_df <- refine_df %>% filter(grepl('uni', company)) %>% mutate(company = "unilever")

> bind_rows(phillips_df, akzo_df, unilever_df, vanhouten_df)
# A tibble: 25 x 6
    company `Product code / number`             address   city         country            name
      <chr>                   <chr>               <chr>  <chr>           <chr>           <chr>
 1 phillips                     p-5 Groningensingel 147 arnhem the netherlands   dhr p. jansen
 2 phillips                    p-43 Groningensingel 148 arnhem the netherlands   dhr p. hansen
 3 phillips                     x-3 Groningensingel 149 arnhem the netherlands   dhr j. Gansen
 4 phillips                    x-34 Groningensingel 150 arnhem the netherlands   dhr p. mansen
 5 phillips                    x-12 Groningensingel 151 arnhem the netherlands  dhr p. fransen
 6 phillips                    p-23 Groningensingel 152 arnhem the netherlands dhr p. franssen
 7 phillips                    p-56   Delfzijlstraat 54 arnhem the netherlands mevr l.  mokken
 8 phillips                    v-67   Delfzijlstraat 55 arnhem the netherlands mevr l.  mokken
 9 phillips                    v-21   Delfzijlstraat 56 arnhem the netherlands mevr l.  mokken
10     akzo                    v-43   Leeuwardenweg 178 arnhem the netherlands   dhr p. bansen
# ... with 15 more rows

> refine_df <- bind_rows(phillips_df, akzo_df, unilever_df, vanhouten_df)
> View(refine_df)

> library(tidyr)

> refine_df %>% separate(`Product code / number`, c("product_code", "product_number"), sep = "-")
# A tibble: 25 x 7
    company product_code product_number             address   city         country
 *    <chr>        <chr>          <chr>               <chr>  <chr>           <chr>
 1 phillips            p              5 Groningensingel 147 arnhem the netherlands
 2 phillips            p             43 Groningensingel 148 arnhem the netherlands
 3 phillips            x              3 Groningensingel 149 arnhem the netherlands
 4 phillips            x             34 Groningensingel 150 arnhem the netherlands
 5 phillips            x             12 Groningensingel 151 arnhem the netherlands
 6 phillips            p             23 Groningensingel 152 arnhem the netherlands
 7 phillips            p             56   Delfzijlstraat 54 arnhem the netherlands
 8 phillips            v             67   Delfzijlstraat 55 arnhem the netherlands
 9 phillips            v             21   Delfzijlstraat 56 arnhem the netherlands
10     akzo            v             43   Leeuwardenweg 178 arnhem the netherlands
# ... with 15 more rows, and 1 more variables: name <chr>

> refine_df <- refine_df %>% separate(`Product code / number`, c("product_code", "product_number"), sep = "-")

> View(refine_df)

> refine_df %>% filter(product_code == 'p')
# A tibble: 6 x 7
     company product_code product_number             address   city         country
       <chr>        <chr>          <chr>               <chr>  <chr>           <chr>
1   phillips            p              5 Groningensingel 147 arnhem the netherlands
2   phillips            p             43 Groningensingel 148 arnhem the netherlands
3   phillips            p             23 Groningensingel 152 arnhem the netherlands
4   phillips            p             56   Delfzijlstraat 54 arnhem the netherlands
5       akzo            p             34   Leeuwardenweg 181 arnhem the netherlands
6 van houten            p             23   Delfzijlstraat 61 arnhem the netherlands
# ... with 1 more variables: name <chr>

> refine_df %>% filter(product_code == 'p') %>% mutate(product_category = "Smartphone")
# A tibble: 6 x 8
     company product_code product_number             address   city         country
       <chr>        <chr>          <chr>               <chr>  <chr>           <chr>
1   phillips            p              5 Groningensingel 147 arnhem the netherlands
2   phillips            p             43 Groningensingel 148 arnhem the netherlands
3   phillips            p             23 Groningensingel 152 arnhem the netherlands
4   phillips            p             56   Delfzijlstraat 54 arnhem the netherlands
5       akzo            p             34   Leeuwardenweg 181 arnhem the netherlands
6 van houten            p             23   Delfzijlstraat 61 arnhem the netherlands
# ... with 2 more variables: name <chr>, product_category <chr>

> product_p <- refine_df %>% filter(product_code == 'p') %>% mutate(product_category = "Smartphone")
> product_v <- refine_df %>% filter(product_code == 'v') %>% mutate(product_category = "TV")
> product_x <- refine_df %>% filter(product_code == 'x') %>% mutate(product_category = "Laptop")
> product_q <- refine_df %>% filter(product_code == 'q') %>% mutate(product_category = "Tablet")

> product_p
# A tibble: 6 x 8
     company product_code product_number             address   city         country
       <chr>        <chr>          <chr>               <chr>  <chr>           <chr>
1   phillips            p              5 Groningensingel 147 arnhem the netherlands
2   phillips            p             43 Groningensingel 148 arnhem the netherlands
3   phillips            p             23 Groningensingel 152 arnhem the netherlands
4   phillips            p             56   Delfzijlstraat 54 arnhem the netherlands
5       akzo            p             34   Leeuwardenweg 181 arnhem the netherlands
6 van houten            p             23   Delfzijlstraat 61 arnhem the netherlands
# ... with 2 more variables: name <chr>, product_category <chr>

> refine_df <- bind_rows(product_p, product_v, product_x, product_q)

> View(refine_df)

> refine_df <- refine_df %>% mutate(full_address = paste(address, city, country, sep = ', '))
> View(refine_df)

> refine_df <- mutate(refine_df, company_phillips = ifelse(company == "phillips", 1, 0))
> refine_df <- mutate(refine_df, company_akzo = ifelse(company == "akzo", 1, 0))
> refine_df <- mutate(refine_df, company_van_houten = ifelse(company == "van houten", 1, 0))
> refine_df <- mutate(refine_df, company_unilever = ifelse(company == "unilever", 1, 0))

> View(refine_df)

> refine_df <- mutate(refine_df, product_smartphone = ifelse(product_category == "Smartphone", 1, 0))
> refine_df <- mutate(refine_df, product_tv = ifelse(product_category == "TV", 1, 0))
> refine_df <- mutate(refine_df, product_laptop = ifelse(product_category == "Laptop", 1, 0))
> refine_df <- mutate(refine_df, product_tablet = ifelse(product_category == "Tablet", 1, 0))

> View(refine_df)

> write.csv(refine_df, file = "refine_clean.csv")
