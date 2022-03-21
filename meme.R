# Assignment 1, STATS220, Caleb Perelini

library(magick)

img1_url <- "https://external-preview.redd.it/fkEgPJB32uR2cBU_ZXFA2TmNzYxhUXacBL8fsI8cL_Y.jpg?auto=webp&s=4fd8ada14471e454fecbbe62d5da5774a6d5b7c5"
img2_url <- "https://stayhipp.com/wp-content/uploads/2020/05/doge.jpg"
img3_url <- "https://static.wikia.nocookie.net/mlg-parody/images/0/05/Doge.png/revision/latest/scale-to-width-down/537?cb=20151014005818"
img4_url <- "https://lh3.googleusercontent.com/cSDJBnDhFmK5cFvzpkzBKU6jqwAfuEAyJ3ytchoaEYNRPlUHQ42PseUhd0aDPqQzq-1AHNLRk1y2hKX5H97E-fChbsJMOxLCA7kJpfOE8F0xGuhxemzLN9Et5FsNDRkDPFrgppmU"

doge_1 <- image_read(img1_url) %>%
  image_scale("300") %>%
    image_annotate(text="Much stats\n many R\n much duplication\n",
                   color = "#FF00FF",
                   size = 16,
                   font = "Comic Sans MS",
                   gravity = "west")

doge_2 <- image_read(img2_url) %>%
  image_scale("300") %>%
  image_annotate(text="RStudio          Python IDLE",
                 color = "#000000",
                 size = 16,
                 font = "Comic Sans MS",
                 gravity = "center")

doge_3 <- image_read(img3_url) %>%
  image_scale("300") %>%
  image_annotate(text="Lecturer: Play around with R!\n Me:",
                 color = "#000000",
                 size = 19,
                 font = "Comic Sans MS",
                 gravity = "north")

doge_4 <- image_read(img4_url) %>%
  image_scale("300") %>%
  image_annotate(text="How I feel after programming",
                 color = "#000000",
                 size = 16,
                 font = "Arial",
                 gravity = "north")

top_row <- image_append(c(doge_1, doge_2))
bottom_row <- image_append(c(doge_3, doge_4))

final_meme <- c(top_row, bottom_row) %>%
  image_append(stack = TRUE) %>%
  image_scale(500)

image_write(final_meme, "doge_stats.png")
