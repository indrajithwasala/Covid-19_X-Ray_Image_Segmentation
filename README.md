# Covid19-Xray-Image-Segmentation
Extraction of the region of interest using image segmentation and identifying severe and mild Covid 19 cases.

Extraction of the region of interest in medical images plays an important role in disease diagnosis
as it represents an anatomically organ or anomaly like a tumor. Image segmentation is one of the
methods widely used for this purpose. The purpose of our study is to detect mild and sever COVID
19 cases using segmentation of chest X-ray images. This project proposes a three-stage approach
including preprocessing, noise elimination and classification. X-ray images are typically low
resolution, and the pixel intensity distribution can have wide verities due to patients age and
configuration of X-ray capturing devise. Therefore, image preprocessing will be carried out to
improve the quality of the image and enhance significant areas. Then we will use technique to
eliminate noise occurred in the preprocessing steps and initial steps by preserving the details of
image. Finally, we will use two unsupervised image segmentation methods to detect mild and sever
COVID 19 cases and compare results.

The dataset is a subset of covid-19-xray-dataset, and it contains 30 images of mild cases and 30
images of severe cases. In pre-processing stage, we will enhance lung outline by using shadow
filter, then create the binary images using thresholding, and subsequently delete outer body
regions, fill holes, and filter regions. Morphological operations will be applied to eliminate the
noise before getting the segmented image. As the first method we will use the shadow filter and
local thresholding method for automatic lung segmentation of chest X-ray images. Moreover, we
will apply k-means algorithm as the second method of image classification. In k-means we will
randomly assign k- centroids, assign each observation to its closest centroid to create clusters,
update centroid using the means of the clusters and repeat these steps until centroids stabilize.
Finally, we will compare resulted images from our two segmentation methods and given pre
segmented images in the dataset.
