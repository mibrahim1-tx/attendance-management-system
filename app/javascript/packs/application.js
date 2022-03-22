// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("jquery")

import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
// import "./stylesheets/application.scss"

import Turbolinks from "turbolinks"
import Chart from 'chart.js/auto';
import "channels"

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


let submit_messages;
$(document).on('turbolinks:load', function () {
  submit_messages()
})
submit_messages = function () {
  $('#message_body').on('keydown', function (event) {
    if (event.keyCode == 13) {
      event.currentTarget.form.submit()
      $('input').click()
      event.target.value = ''
    }
  })
}



