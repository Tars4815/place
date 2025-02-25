/* Loading oriented images chunks */
document.addEventListener("DOMContentLoaded", function () {
  /* First chunk of images */
  /* Setting the paths for camera parameters and images list */
  const cameraParamsPathPila1 = "./img_selected/campata3/d800_20mm.xml";
  const imageParamsPathPila1 = "./img_selected/campata3/CDP_campata3_d800.txt";

  Potree.OrientedImageLoader.load(
    cameraParamsPathPila1,
    imageParamsPathPila1,
    viewer
  ).then((images) => {
    images.visible = true;
    viewer.scene.addOrientedImages(images);
    images.name = "campata3-d800";
  });

  /* Second chunk of images */
  /* Setting the paths for camera parameters and images list */
  const cameraParamsPath = "./img_selected/campata3/p1_35mm.xml";
  const imageParamsPath = "./img_selected/campata3/CDP_campata3_p1_35mm.txt";

  Potree.OrientedImageLoader.load(
    cameraParamsPath,
    imageParamsPath,
    viewer
  ).then((images) => {
    images.visible = false; // change this to true if you want to make them visible at first loading without any user action or input
    viewer.scene.addOrientedImages(images);
    images.name = "campata3-p1";
  });
});
