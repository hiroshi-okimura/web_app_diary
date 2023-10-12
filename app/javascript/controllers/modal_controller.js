import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal" ]

  connect() {
    document.body.classList.add('overflow-hidden');
  }

  // モーダルを開くアクション
  open() {
    this.modalTarget.classList.remove('hidden');
    document.body.classList.add('overflow-hidden');
  }

  // モーダルを閉じるアクション
  closeModal() {
    this.modalTarget.classList.add('hidden');
    document.body.classList.remove('overflow-hidden');
  }

  // DB接続後のモーダルを閉じるアクション
  close(event) {
    if (event.detail.success) {
      this.modalTarget.classList.add('hidden');
      document.body.classList.remove('overflow-hidden');
    }
  }
}
