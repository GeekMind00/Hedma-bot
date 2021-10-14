import consumer from "./consumer"
// document.addEventListener('turbolinks:load', () => {

consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
})

consumer.subscriptions.create({ channel: "UserChannel", user_id: 1 }, {
    connected() {
        // Called when the subscription is ready for use on the server
        console.log('connected...')
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        const messageContainer = document.getElementById('messages-container')
        messageContainer.innerHTML = messageContainer.innerHTML + data.message
        console.log(data.message)
        return
    }

});
// })