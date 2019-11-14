Gem::Specification.new do |s|
  s.name = 'hpm118dwx4'
  s.version = '0.1.0'
  s.summary = 'Experimental gem to produce an HTML printed booklet in A6 size using an HP Laserjet Pro M118dw printer.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/hpm118dwx4.rb']
  s.add_runtime_dependency('rexle', '~> 1.5', '>=1.5.3')
  s.add_runtime_dependency('kramdown', '~> 2.1', '>=2.1.0')    
  s.signing_key = '../privatekeys/hpm118dwx4.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/hpm118dwx4'
end
