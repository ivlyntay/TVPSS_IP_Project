let profilePic = document.getElementById("profile-pic");
       let inputFile = document.getElementById("crew-photo");
       let cameraIcon = document.getElementById("camera-icon");

       inputFile.onchange = function() {
           if (inputFile.files && inputFile.files[0]) {
               profilePic.src = URL.createObjectURL(inputFile.files[0]);
               profilePic.style.display = 'block';
               cameraIcon.style.display = 'none'; // Hide camera icon once image is uploaded
           }
       }