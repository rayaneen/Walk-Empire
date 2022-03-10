import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';
import Swal from 'sweetalert2'


export default class extends Controller {
  congrats() {
    swal({
      title: "Congratulations boss!",
      text: "You conquered a new territory!",
      icon: "success",
      button: "Nice!",
    });
    playAudio();
    setTimeout(updateActivity, 30000000);

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
  capture() {
    let timerInterval
    Swal.fire({
      title: 'Establishing domination',
      html: 'Remaining time: <b></b> milliseconds.',
      timer: 2500,
      timerProgressBar: true,
      didOpen: () => {
        Swal.showLoading()
        const b = Swal.getHtmlContainer().querySelector('b')
        timerInterval = setInterval(() => {
          b.textContent = Swal.getTimerLeft()
        }, 100)
      },
      willClose: () => {
        clearInterval(timerInterval)
      }
    }).then((result) => {

      if (result.dismiss === Swal.DismissReason.timer) {
        swal({
          title: "Congratulations boss!",
          text: "You conquered a new territory!",
          icon: "success",
          button: "Nice!",
        });
        playAudio();
        setTimeout(lvlUp, 4000);
      }
    })
  }
}
const lvlUp = () => {
  Swal.fire({
    customClass: "levelup",
    showCancelButton: false,
    showConfirmButton: false,
    backdrop: `
    rgba(0,0,123,0.4)
    url("https://media0.giphy.com/media/5dl2u2Iy6hwEEXwlFv/giphy.gif?cid=790b7611211ad444f084a087fd8ad6d5a57e92f804e9f67f&rid=giphy.gif&ct=g")
    no-repeat
    center
  `
  })
  LvlUpAudio();
  setTimeout(updateActivity, 6000);
}

const playAudio = () => {
  const audio = new Audio('https://res.cloudinary.com/duu07h2y1/video/upload/v1646814492/mixkit-winning-notification-2018_gjwuzz.wav');
  audio.play();
}

const LvlUpAudio = () => {
  const audio = new Audio('https://res.cloudinary.com/duu07h2y1/video/upload/v1646837708/win_usrs99.wav');
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
