function SetImage(image, alternate, description, fullImage) {
    document.getElementById("FullImage").src = image;
    document.getElementById("FullImage").alt = alternate;
    document.getElementById("FullImageLink").href = fullImage;
    document.getElementById("FullImageDescription").innerHTML = description;
}