# frozen_string_literal: true

require "webdrivers"

driver = Selenium::WebDriver.for(
  :chrome,
  capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions": { args: ["headless", "disable-gpu"] },
  ),
)

urls = [
  "https://gtm-backout-spike.netlify.app/",
  "https://gtm-backout-spike.netlify.app/accordions/",
  "https://gtm-backout-spike.netlify.app/tabs/",
  "https://gtag--gtm-backout-spike.netlify.app/",
  "https://gtag--gtm-backout-spike.netlify.app/accordions/",
  "https://gtag--gtm-backout-spike.netlify.app/tabs/",
]

100.times do
  driver.get(urls.sample)
  ga4_events = driver.find_elements(class: "ga4-event")

  rand(1..10).times do
    ga4_events.sample.click
    sleep(rand(1..10))
  end

  driver.execute_script("return dataLayer").each do |event|
    puts event.to_json if event.is_a?(Hash) && event["event"] == "ga4-event"
  end
end
