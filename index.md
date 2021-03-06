# Final Image

![Many doge. Much fun.](https://github.com/calebperelini/stats220/blob/main/doge_stats.png)

## About

The meme created is a tiling of a number of different iamges fo the popular meme _'doge'_, with poor-resolution comic-sans captions overlaid.

I used **four** different source images, which can be found linked below:
* [Image 1](https://github.com/calebperelini/stats220/blob/main/doge.jpeg)
* [Image 2](https://github.com/calebperelini/stats220/blob/main/Doge.png)
* [Image 3](https://github.com/calebperelini/stats220/blob/main/fkEgPJB32uR2cBU_ZXFA2TmNzYxhUXacBL8fsI8cL_Y.jpeg)
* [Image 3](https://github.com/calebperelini/stats220/blob/main/flat%2C550x550%2C075%2Cf.u1.jpg)

## Programming approach

### Importing images

I started by collating links and assigning them to string variables in order to make the code more readable
This made manipulation of the images **much** easier.

```r
library(magick)

img1_url <- "https://external-preview.redd.it/fkEgPJB32uR2cBU_ZXFA2TmNzYxhUXacBL8fsI8cL_Y.jpg?auto=webp&s=4fd8ada14471e454fecbbe62d5da5774a6d5b7c5"
img2_url <- "https://stayhipp.com/wp-content/uploads/2020/05/doge.jpg"
img3_url <- "https://static.wikia.nocookie.net/mlg-parody/images/0/05/Doge.png/revision/latest/scale-to-width-down/537?cb=20151014005818"
img4_url <- "https://lh3.googleusercontent.com/cSDJBnDhFmK5cFvzpkzBKU6jqwAfuEAyJ3ytchoaEYNRPlUHQ42PseUhd0aDPqQzq-1AHNLRk1y2hKX5H97E-fChbsJMOxLCA7kJpfOE8F0xGuhxemzLN9Et5FsNDRkDPFrgppmU"
```

### Transforming and manipulating images.

With the links assigned to variables, I set about using `image_read()` from the [Magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html) package to read and then transform the images.

```r
doge_1 <- image_read(img1_url) %>%
  image_scale("300") %>%
    image_annotate(text="Much stats\n many R\n much duplication\n",
                   color = "#FF00FF",
                   size = 16,
                   font = "Comic Sans MS",
                   gravity = "west")
```

The images were scaled down to a ratio of 300 pixels using `image_scale()`, and then overlain with meme text using `image_annotate`.

This was repeated for each image in order to standardize and create each meme.

For example, the following image was saved and scaled like so:

![Initial Image](https://github.com/calebperelini/stats220/blob/main/doge.jpeg)

Then modified using `image_annotate()`

![After modification.](https://github.com/calebperelini/stats220/blob/main/Screen%20Shot%202022-03-21%20at%206.42.18%20PM.png)

**Some detail was lost** due to the image scaling, though the text remains legible.

### Appending and output

Finally, the modified meme images were sorted into two rows, with two vectors containg the two rows of images. 

`image_append()` was then used to stitch and append the two rows together, creating a final image, which was then saved as a `.png` using `image_write()`

```r
top_row <- image_append(c(doge_1, doge_2))
bottom_row <- image_append(c(doge_3, doge_4))

final_meme <- c(top_row, bottom_row) %>%
  image_append(stack = TRUE) %>%
  image_scale(500)

image_write(final_meme, "doge_stats.png")
```







