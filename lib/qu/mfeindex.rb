require 'qu/utils'
require 'qu/cmdwrapper'
require_relative "mfeindex/data"
require_relative "mfeindex/version"
require 'json'

module Qu
  module Mfeindex
    # Your code goes here...
    module_function

    def big_db_dir(db)
      db + BIG_DB
    end

    def db_indexed?(db)
      File.exist?(db + DB_SQLITE3) and File.exist?(db + DB_JSON) and File.exist?(db + DB_2BIT)
    end

    def MFEprimerIndex(fasta_file, k = 9, reindex = false)
      return if !reindex and db_indexed?(fasta_file)

      unless File.exists?(fasta_file)
        $stderr.puts "Error: #{fasta_file} is not exists." 
        exit
      end
      info_json = {}

      uni_fasta = fasta_file + '.unifasta'

      File.open(uni_fasta, 'w') do |fh|
        Bio::FlatFile.new(Bio::FastaFormat, File.open(fasta_file)).each_with_index do |record, index|
          info_json[index] = {'id' => record.entry_name, 'desc' => record.desc, 'size' => record.naseq.size}
          fh.write ">#{index}\n#{record.naseq}\n"
        end
      end

      File.open(fasta_file + DB_JSON, 'w') do |fh|
        fh.write(JSON.dump(info_json))
      end

      Qu::Cmdwrapper::faToTwoBit(uni_fasta, fasta_file + DB_2BIT)

      cmd = File.join(__dir__, 'pymfeindex')
      $stderr.puts "Begin index database: #{fasta_file}"
      `#{cmd} -f #{uni_fasta} -k #{k} -o #{fasta_file + DB_SQLITE3}`
      begin
        File.delete(uni_fasta)
      rescue
        if File.exists?(uni_fasta)
          $stderr.puts "You can delete the file #{uni_fasta} by hand."
        end
      end
      $stderr.puts "Done index database: #{fasta_file}"
    end

  end
end
