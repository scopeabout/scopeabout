let ProfilePhotoUpdateView;

ProfilePhotoUpdateView = class ProfilePhotoUpdateView {
  constructor(holderElementId, fileInputElementId, hiddenInputElementId) {

    this.holder = document.getElementById(holderElementId);
    this.fileInput = document.getElementById(fileInputElementId);
    this.hiddenInput = document.getElementById(hiddenInputElementId);

    this.image = null;
    this.cropper = null;

    this.bindEvents();
  }

  bindEvents() {
    this.fileInput.onchange = this._renderImageFromFileSelection.bind(this)
  }

  _renderImageFromFileSelection(event) {
    this.image = this._loadImage(event.target.files[0]);
  }

  _loadImage(imgSource) {
    return loadImage(
      imgSource,
      this.renderImage.bind(this),
      {
        orientation: true,
        maxWidth: 2048,
        maxHeight: 2048,
        minWidth: 1024,
        minHeight: 1024,
        canvas: true

      }
    )
  }

  renderCropper(image) {
    this.cropper = new Cropper(image, {
      aspectRatio: 1,
      viewMode: 2,
      dragMode: 'move',
      background: false,
      crop: this.setCroppedData.bind(this)
    });
  }

  renderImage(img) {
    if (img.type === "error") {
      console.log("Error loading image");
    } else {
      this.holder.innerHTML = '';
      this.holder.appendChild(img);
      this.renderCropper(img);
    }
  }

  setCroppedData() {
    this.cropper.getCroppedCanvas().toBlob(function (blob) {
      let a = new FileReader();

      a.onload = function (e) {
        let dataUrl = e.target.result;
        this.hiddenInput.value = dataUrl;
      }.bind(this);
      a.readAsDataURL(blob);
    }.bind(this));
  }
};

