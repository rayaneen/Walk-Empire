import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';

export default class extends Controller {
  congrats() {
    swal({
      title: "Congratulations boss!",
      text: "You conquered a new territory!",
      icon: "success",
      button: "Nice!",
    });
    playAudio();
    setTimeout(updateActivity, 3000);

  }

  cancel() {
    swal({
      title: "Are you sure?",
      text: "This will cancel all your efforts to conquer this point!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
      .then((willDelete) => {
        if (willDelete) {
          swal("Your conquest has been canceled!", {
            icon: "success",
          });
          setTimeout(cancelActivity, 3000)

        } else {
          swal("Your conquest is safe!");
        }
      });
  }
}

const playAudio = () => {
  const audio = new Audio('https://res.cloudinary.com/duu07h2y1/video/upload/v1646814492/mixkit-winning-notification-2018_gjwuzz.wav');
  audio.play();
}

const cancelActivity = () => {
  const link = document.querySelector('#delete-link');
  link.click();
}

const updateActivity = () => {
  const link = document.querySelector('#update-link');
  link.click();
}
