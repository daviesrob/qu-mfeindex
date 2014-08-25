module Qu
  module Mfeindex
    DB_JSON = '.json'
    DB_SQLITE3 = '.sqlite3.db'
    DB_2BIT = '.2bit'
    DB_FASTA = '.fa'
    BIG_DB = '_BIG_MFE_DB'
    BIG_DB_SPLIT_CUTOFF = 1024**3

    D2I = {
      'A' => 0, 
      'T' => 3, 
      'C' => 2, 
      'G' => 1,
      '-' => 4,  # For bubble, added by Zheyan Liu
      0 => 'A',
      1 => 'G',
      2 => 'C',
      3 => 'T',
      4 => '-',  # For bubble, added by Zheyan Liu 
    }
        
    ANTISENSE_CHARS = %w{A G C T -}
  end
end
