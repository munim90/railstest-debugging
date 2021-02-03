require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, options: {args: %w(headless disable-gpu no-sandbox disable-dev-shm-usage window-size=1920,1080)}
end
