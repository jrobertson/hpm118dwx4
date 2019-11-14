# Printing an HTML booklet in A6 size using the HpM118dwx4 gem


## Usage

    hp = HpM118dwx4.new 'page.html'
    hp.pages[0] = "# Introduction\n\nHello World!"
    hp.pages[1] = "## About\n\nSomething about me"
    hp.pages[2] = "## Services provided\n\nWhat I offer."
    hp.pages[3] = "## Contact me\n\nHere are my contact details ..."
    hp.build
    hp.save

The above example was used to print an HTML document with 8 pages with 4 pages per sheet on each side of paper. The printer used was a HP Laserjet Pro M118dw.

## Resources

* hpm118dwx4 https://rubygems.org/gems/hpm118dwx4

hpm118dwx4 printer html booklet print book page
