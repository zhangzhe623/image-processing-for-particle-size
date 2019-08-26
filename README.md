# image-processing-for-particle-size_ Using_MATLAB
## INTRODUCTION
This Code was prepaired for particle size detection of the coal over the weigh feeder for an industry (i.e. TATA Sponge jodha, INDIA,  :)Thanks!).
The particle size of the raw material i.e. iron ore, coal, and dolomite are measured frequently in order to maintain the particle size distribution of the input material which has some direct and indirect effects on the quality of the produced sponge iron.

Image processing is a subcategory of digital signal processing which is used to remove noise and signal irregularities followed by generating data from the digital image for future analysis (moisture prediction). Currently, it is used to predict particle size distribution in coal from the image using image analysis through MATLAB.

## MATLAB and Image Processing
MATLAB is used for image analysis as it is more prompt for matrix analysis and the image obtained is nothing but a 3D matrix with red, green and blue as its 3rd dimension.

The process of analysis is divided into four steps which are **first**, RGB to BW image conversion for dimension reduction. **Second**, morphological operation to reduce irregularities and giving structure to the coal particle in the binary image. **Third**, obtaining basic information i.e. area for each particle observed in the image. **Forth**, classifying particles on the basis of area of 3mm particle.

During Cross-Validation of the model with the sieve analysed data outcome of several samples we come up with an observation that the particle size prediction is not accurate when the percentage of fine particles is high which means when the percentage of particle size less than 3mm error increases. If we create a boundary around each particle (i.e. red in colour which may be difficult to observe), we observed that fine particles which are very close to each other or overlapping each other are considered as a single particle which acts as an anomaly in our prediction model.

![](image-processing-for-particle-size/Readme_Image/1.png.jpg)
