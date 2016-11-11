require './lib/tess_scrapers'

log = 'log/scrapers.log'
output = 'log/scrapers.out'

scrapers = [
    BiocompRdfaScraper,
    BitsvibRdfaScraper,
    BmtcJsonldScraper,
    CambridgeEventsScraper,
    CscEventsScraper,
    DataCarpentryScraper,
    DtlsEventsScraper,
    # EbiScraper, # Broken
    ElixirEventsScraper,
    FuturelearnRdfaScraper,
    Genome3dScraper,
    GobletRdfaScraper,
    IfbRdfaScraper,
    KhanAcademyApiScraper,
    LegacySoftwareCarpentryScraper,
    NgsRegistryScraper,
    SibScraper,
    SoftwareCarpentryEventsScraper,
    IannEventsScraper,
    CourseraScraper,
    ErasysRdfaScraper,
    RssScraper
]

options = { output_file: output, debug: false, verbose: false, offline: false, cache: false }

begin
  # Open log file
  log_file = File.open(log, 'w')

  scrapers.each do |scraper_class|
    log_file.puts "Running #{scraper_class}"
    scraper_class.new(options).run
  end

  log_file.puts 'Done'
ensure
  log_file.close
end