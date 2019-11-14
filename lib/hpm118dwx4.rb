#!/usr/bin/env ruby

# file: hpm118dwx4.rb

require 'rexle'
require 'rexle-builder'
require 'kramdown'



class HpM118dwx4

  attr_reader :to_html
  attr_accessor :pages


  def initialize(filename='page.html', pages: 8, debug: false)

    @filename, @pages, @debug = filename, ['&nbsp;']*pages, debug

  end

  def build()
    @to_html = build_html @pages
    @doc = Rexle.new(@to_html)
  end

  def save(filename=@filename)
    File.write filename, @doc.xml(pretty: true)
    File.write filename.sub(/\.html$/, '.css'), css()
  end

  private


  def build_html(pages)

    n = 1
    xml = RexleBuilder.new 
    a = xml.body do

      collate(pages.length).each_slice(4).each do |x| 

        puts 'x: ' + x.inspect if @debug

        x.each.with_index do |y,i|

          xml.div({class: 'page ' + (97+i).chr})  do
            xml.article Kramdown::Document.new(pages[y-1]).to_html
            xml.footer do
              xml.p({class: 'n'+ (y.odd? ? 'odd' : 'even')}, 'pg ' + (y).to_s)
            end
          end

          n+=1

        end
      end
    end

html=<<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<title>Untitled Book</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="page.css" media="screen, projection, tv, print" />
</head>
#{Rexle.new(a).xml(declaration: false)}
</html>
EOF

    Rexle.new(html).xml pretty: true    

  end

  def css()
<<CSS
html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

.page {
  display: flex;
  flex-direction: column;
  min-height: 100%;
}

article {
  flex: 1;
}
      body {
        font-size: 1.96em; margin: 0; padding: 0; 

      }
      /*h1 {margin: 0; padding: 0}
      h4 {margin: 0; padding: 0}
      h5 {margin: 0; padding: 0}*/
      /*p {margin: 0; padding: 0}*/
@media print {
  .page {page-break-after: always;}
}

.page {

        margin: 0; padding: 0; 
        border: 1px solid black;
        /* height: 98vh; */

  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  min-height: 88%;
}
article {
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
}

    .a {background-color: #fe2;}
    .b {background-color: #ae2;}
    .c {background-color: #8d2;}
    .d {background-color: #aa2;}
    .c, .d {
      background-color: #a42; margin-top: 3.6em; padding-top: 0em;
      /*height: 88vh;*/
  min-height: 88%;
     }
    .b, .d {background-color: #aa2; margin-left: 2.3em;}
    .a, .c {background-color: #aa2; margin-right: 2.1em;}

    footer p.nodd  {text-align: right;}
CSS
  end

  def collate(n)

    r = -2
    a = n.times.each_slice(8).flat_map do |x|
      x.map.with_index do |y,i|
        puts 'r: ' + r.inspect
        r+= [3, 3, 1, 3, -5, -1, 5, -1][i]
        r
      end
    end
  end

end
