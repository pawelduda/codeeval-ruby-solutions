# https://www.codeeval.com/open_challenges/169/

def parse_input(input)
  input = input.split(' ')
  {
    regexp: to_regexp(input[0]),
    filenames: input[1..-1]
  }
end

def to_regexp(regexp_string)
  regexp_string = "^#{regexp_string}$"
            .gsub('.', '\.')
            .gsub('?', '.{1}')
            .gsub('*', '.*')
            .gsub(/(\[.+?\])/, '\1{1}')
  /#{regexp_string}/
end

def match_filenames(regexp, filenames)
  matches = filenames.grep(regexp)
  matches.any? ? matches.join(' ') : '-'
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line.strip)
  puts match_filenames(input[:regexp], input[:filenames])
end

# tests
# input = parse_input('*7* johab.py gen_probe.ko palmtx.h macpath.py tzp dm-dirty-log.h bh1770.h pktloc faillog.8.gz zconf.gperf')
# p match_filenames(input[:regexp], input[:filenames]) == 'bh1770.h' 
# 
# input = parse_input('*[0123456789]*[auoei]* IBM1008_420.so zfgrep limits.conf.5.gz tc.h ilogb.3.gz limits.conf CyrAsia-TerminusBold28x14.psf.gz nf_conntrack_sip.ko DistUpgradeViewNonInteractive.pyc NFKDQC')
# p match_filenames(input[:regexp], input[:filenames]) == 'IBM1008_420.so'
# 
# input = parse_input('*.??? max_user_watches arptables.h net_namespace Kannada.pl menu_no_no.utf-8.vim shtags.1 unistd_32_ia32.h gettext-tools.mo ntpdate.md5sums linkat.2.gz')
# p match_filenames(input[:regexp], input[:filenames]) == 'menu_no_no.utf-8.vim'
# 
# input = parse_input('*.pdf OldItali.pl term.log plymouth-upstart-bridge rand.so libipw.ko jisfreq.pyc impedance-analyzer xmon.h 1.5.0.3.txt bank')
# p match_filenames(input[:regexp], input[:filenames]) == '-'
# 
# input = parse_input('g*.* 56b8a0b6.0 sl.vim digctl.h groff-base.conffiles python-software-properties.md5sums CountryInformation.py use_zero_page session-noninteractive d2i_RSAPublicKey.3ssl.gz container-detect.log.4.gz')
# p match_filenames(input[:regexp], input[:filenames]) == 'groff-base.conffiles'
# 
# input = parse_input('*.??? max_user_watches arptables.h net_namespace Kannada.pl menu_no_no.utf-8.vim shtags.1 unistd_32_ia32.h gettext-tools.mo ntpdate.md5sums linkat.2.gz')
# p match_filenames(input[:regexp], input[:filenames]) == 'menu_no_no.utf-8.vim'

