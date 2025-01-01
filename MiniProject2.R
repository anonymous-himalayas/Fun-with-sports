all_data = season1

all_data2 = rbind(all_data, season2)
all_data3 = rbind(all_data2,season3)
all_data_df = rbind(all_data3, season4, season5, season6, season7, season8, season9, season10)
all_data_df

colnames(all_data_df) <- c("id", "player value", "training hours (weekly)",
                          "age", "injuries", "location", "gender", "sport")


all_data_table <- setDT(all_data_df)


all_data = season1
all_data2 = rbind(all_data, season2)
all_data3 = rbind(all_data2,season3)
all_data_df = rbind(all_data3, season4, season5, season6, season7, season8, season9, season10)
colnames(all_data_df) <- c("id", "player value", "training hours (weekly)",
                           "age", "injuries", "location", "gender", "sport")

all_data_df$sport <- replace(all_data_df$sport, all_data_df$sport %in% c("\"6\"", "\"5\"", "\"4\"", "\"3\"", "\"2\"", "\"1\"", "\"NA\""), 
        c("Boxing", "Baseball", "Tennis", "Soccer", "Football", "Basketball", NA))

all_data_df$gender <- replace(all_data_df$gender, all_data_df$gender %in% c("\"1\"", "\"2\"", "\"NA\""), c("Female", "Male", NA))

all_data_df$location <- replace(all_data_df$location, all_data_df$location %in% c("\"7\"", "\"6\"", "\"5\"", "\"4\"", "\"3\"", "\"2\"", "\"1\"", "\"NA\""), 
                                c("Saudi Arabia", "USA", "Spain", "Germany", "France", "Italy", "UK", NA))

all_data_df$id<-gsub("\"","",as.character(all_data_df$id))
all_data_df$`player value`<- gsub("\"","",as.character(all_data_df$`player value`))
all_data_df$`training hours (weekly)` <- gsub("\"","",as.character(all_data_df$`training hours (weekly)`))
all_data_df$age <- gsub("\"","",as.character(all_data_df$age))
all_data_df$injuries <- gsub("\"","",as.character(all_data_df$injuries))
all_data_table = all_data_df
all_data_table <- setDT(all_data_df)
all_data_table
as.numeric(as.character(all_data_table$id))
as.numeric(as.character(all_data_table$`player value`))
as.numeric(as.character(all_data_table$`training hours (weekly)`))
as.numeric(as.character(all_data_table$age))
as.numeric(as.character(all_data_table$injuries))
all_data <- tibble(all_data_table)


all_data <- all_data %>% mutate_at(c("id", "player value", "training hours (weekly)", "age", "injuries"), as.numeric)

all_data$`training hours (weekly)`

season0_data <- head(all_data, n = 50)
summary(season0_data)
