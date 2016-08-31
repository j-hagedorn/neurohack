# Reading NIFTI Files
  library(oro.nifti)
  library(oro.dicom)

# Convert DICOM to NIFTI
  # Read in all slices of DICOM
    all_slices_T1 <- readDICOM("Neurohacking_data-master/BRAINIX/DICOM/T1/")
    dim(all_slices_T1$img[[11]])
    hdr <- all_slices_T1$hdr[[11]]
    hdr[hdr$name == "PixelSpacing", "value"]
  
  # Convert to NIFTI
    nii_T1 <- dicom2nifti(all_slices_T1)
    d <- dim(nii_T1); d; class(nii_T1)
    image(1:d[1],1:d[2],nii_T1[,,11],
          col = gray(0:64/64), xlab = "", ylab = "")