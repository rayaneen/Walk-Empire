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
    setTimeout(updateActivity, 2000)
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
          setTimeout(cancelActivity, 2000)

        } else {
          swal("Your conquest is safe!");
        }
      });
  }
}

const cancelActivity = () => {
  const link = document.querySelector('#delete-link');
  link.click();
}

const updateActivity = () => {
  const link = document.querySelector('#update-link');
  link.click();
}
