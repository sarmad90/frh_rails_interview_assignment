import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['propertyFields'];

  connect() {
    // this.element.textContent = "Hello World!"
  }

  addProperty() {
    let index = this.element.dataset.index;
    let idPrefix = "product_properties_attributes_" + index;
    let fieldSetId = idPrefix + "_fieldset";
    let html = `
      <div id="${fieldSetId}">
        <label style="display: block" for="product_properties_attributes_${index}_name">Name</label>
        <input type="text" name="product[properties_attributes][${index}][name]" id="${idPrefix}_name">

        <label style="display: block" for="product_properties_attributes_${index}_value">Value</label>
        <input type="text" name="product[properties_attributes][${index}][value]" id="${idPrefix}_value">
        <a data-action="properties#removeProperty" href="javascript:void(0);" data-properties-fieldset-id-param="${fieldSetId}">Remove Property</a>
        <hr>
      </div>
    `

    this.propertyFieldsTarget.insertAdjacentHTML('beforeend', html);
    this.element.dataset.index = Number(index) + 1;
  }

  removeProperty(event) {
    document.getElementById(event.params.fieldsetId).remove();
  }
}
