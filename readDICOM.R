

# Reading DICOM Files
  library(oro.dicom)

# Reading one slice
  slice <- readDICOM("Neurohacking_data-master/BRAINIX/DICOM/FLAIR/IM-0001-0011.dcm")
  names(slice)
  class(slice$hdr)
  class(slice$hdr[[1]])
  class(slice$img)
  class(slice$img[[1]])
  dim(slice$img[[1]])

# Display image
  d <- dim(t(slice$img[[1]]))
  image(1:d[1],1:d[2], t(slice$img[[1]]), col = gray(0:64/64))

# Display histogram
  hist(slice$img[[1]][,],
       breaks = 50, xlab = "FLAIR",
       prob = T, col = rgb(0,0,1,1/4),
       main = "")

# Look at header
  hdr <- slice$hdr[[1]]
  names(hdr)

# Read in all slices
  all_slices_T1 <- readDICOM("Neurohacking_data-master/BRAINIX/DICOM/T1/")
  dim(all_slices_T1$img[[11]])
  hdr <- all_slices_T1$hdr[[11]]
  hdr[hdr$name == "PixelSpacing", "value"]
  
