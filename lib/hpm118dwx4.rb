#!/usr/bin/env ruby

# file: hpm118dwx4.rb


require 'htmlbook'


class HpM118dwx4 < HtmlBook


  def initialize(filename='page.html', pg_height: 500, debug: false)

    super(filename, pg_height: pg_height, debug: debug)

  end

  private
  
  def build_html(doc, pages)
    
    doc = super(doc, pages)
    
    # add the a, b, c, and d to each page
    a = %w(a b c d).cycle

    puts 'doc.xml: ' + doc.xml.inspect if @debug
    
    doc.root.xpath('//body/div').each do |e|
      e.attributes[:class] = ['page', a.next]
    end
    
    return doc
  end

  def css()
    
s=<<CSS
    body { font-size: 1.96em;  }
    .a {background-color: #fe2;}
    .b {background-color: #ae2;}
    .c {background-color: #8d2;}
    .d {background-color: #aa2;}
    .c, .d {
      background-color: #a42; margin-top: 3.6em; padding-top: 0em;
  min-height: 88%;
     }
    .b, .d {background-color: #aa2; margin-left: 2.3em;}
    .a, .c {background-color: #aa2; margin-right: 2.1em;}
CSS
    super() + s
    
  end

  def collate(pages)

    r = -2
    a = pages.length.times.each_slice(8).flat_map do |x|
      x.map.with_index do |y,i|
        puts 'r: ' + r.inspect if @debug
        r+= [3, 3, 1, 3, -5, -1, 5, -1][i]
        r
      end
    end
    puts 'before zip' if @debug       
    pages.zip(a)
  end

end
