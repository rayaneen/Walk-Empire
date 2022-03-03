import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["info"]
    static values = {
    id: String,
  }
  broadcastEvent() {
    const event = new CustomEvent('marker-clicked',  {
      detail: {
        id: this.idValue
      }
    });

    window.dispatchEvent(event);

  }

}
