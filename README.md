# Qu::Mfeindex

DNA sequence indexer originally developed for MFEprimer-2.0

## Installation

Add this line to your application's Gemfile:

    gem 'qu-mfeindex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qu-mfeindex

## Usage

`mfeindex fasta_file [-m mem_limit] [kvalue]`

mem_limit is the amount of memory to use during the indexing stage, in
megabytes.  The default is 200; for large data sets (e.g. Human) this
should be increased (4000 seems to work fairly well, but bigger is better
if you have the memory available).  The -m option only controls memory
consumption for part of the indexing process, so the total used will be
somewhat higher than the given value.

Any data that doesn't fit in memory while sorting will be written to
temporary files and merged back in later.  The exact space used depends
on the input data, but should be around 8 bytes per base of the input
sequences.  The files will normally go into the default location for
temporary data on your platform (e.g. /tmp on UNIX-like systems).  The TMPDIR
environment variable can be used to change this if you want to put them
somewhere else.

As an example, indexing a 3 Gbyte fasta file with -m 4000 used 6.6 Gbytes of
memory and 20 Gbytes of temporary storage.  The output index file was 50 Gbytes
long.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
