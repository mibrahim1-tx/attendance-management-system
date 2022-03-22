import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the room")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Recieving:") 
    console.log(data)
    console.log(data.msg, data.sender_name)
    console.log(data.msg.sent_time)
    $('#msg-list').append(`<li><div class="message-block"><div class="d-flex flex-column gap-2"><div><strong>${data?.sender_name}</strong><span class="float-end">${data?.sent_time}</span></div><p>${data?.msg?.body}</p></div></div></li>`)
  }
});


