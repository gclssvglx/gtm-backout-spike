window.onload = function (event) {
  console.log('Page load...')

  // page view...
  var titles = document.getElementsByTagName('title')

  var data = {
    'event': 'ga4-event',
    'event_data': {
      'action': 'page_view',
      'url': window.location.href,
      'text': titles[0].innerText
    }
  }
  window.dataLayer.push(data)

  // all other interactions...
  var ga4_events = document.getElementsByClassName('ga4-event')

  for (var i = 0; i < ga4_events.length; i++) {
    ga4_events[i].addEventListener('click', function (event) {
      event.preventDefault()

      if (window.dataLayer) {
        var event_data = JSON.parse(event.target.getAttribute('data-ga4'))
        var data = { 'event': 'ga4-event', event_data }
        window.dataLayer.push(data)
      }
    })
  }
}
