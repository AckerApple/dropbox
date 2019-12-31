var PDFImage = require("pdf-image").PDFImage;

module.exports = function(pdfPath){
  var pdfImage = new PDFImage(pdfPath);
  pdfImage.convertPage(0, {omitPageNumOnFileName:true}).then(function (imagePath) {
    console.log('done')
  })
  .catch(e=>console.error(e))
}