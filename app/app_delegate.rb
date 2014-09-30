class AppDelegate
  attr_accessor :status_menu

  def applicationDidFinishLaunching(notification)
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']

    @status_menu = NSMenu.new

    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
    @status_item.setMenu(@status_menu)
    @status_item.setHighlightMode(true)
    @status_item.setTitle(@app_name)
    @status_menu.addItem createMenuItem("Quit", 'terminate:')
    @mt_queue = Dispatch::Queue.concurrent("io.bbhoss.metrictime")
    full_yolo
  end

  def full_yolo
    @status_item.setTitle(time_in_decimal)
    @mt_queue.after(1) { full_yolo }
  end

  def createMenuItem(name, action)
    NSMenuItem.alloc.initWithTitle(name, action: action, keyEquivalent: '')
  end

  def time_in_decimal
    seconds_in_day = Time.now.to_i - Time.now.at_beginning_of_day.to_i
    dectime = seconds_in_day / 0.864 # total of 86400 seconds in a day
    cd = ((dectime - (dectime % 1000)) / 1000).to_i
    qd = (dectime - (dectime % 1) - (cd * 1000)).to_i
    final_value_s = ((cd < 10) ? "0" : "") + cd.to_s + "."
    final_value_s  += ((qd < 10) ? "0" : "") + ((qd < 100) ? "0" : "") + qd.to_s + " LMT"
    final_value_s
  end
end