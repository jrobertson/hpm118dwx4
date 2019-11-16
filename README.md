# Formatting an HTML document into pages using the HpM118dwx4 gem

## Usage

    require 'hpm118dwx4'

    hp = HpM118dwx4.new 'page8a.html', pg_height: 740, debug: true
    puts hp.to_html
    hp.save

Note: This gem was designed for printing 4 sheets per page on each side of the page. It was used with the HP Laserjet Pro M118dw printer.

## Resources

* hpm118dwx4 https://rubygems.org/gems/hpm118dwx4

html printer hpm118dwx4 page pages booklet book
