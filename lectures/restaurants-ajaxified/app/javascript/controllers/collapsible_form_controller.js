import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["elementToCollapse"];

  connect() {
    this.elementToCollapseTarget.style.height = "0px";
    this.elementToCollapseTarget.style.overflow = "hidden";
    this.elementToCollapseTarget.style.transition = "height 300ms ease-out";
  }

  expand(event) {
    event.currentTarget.style.display = "none";
    this.elementToCollapseTarget.style.height = "150px";
  }
}
