require 'date'

def str_to_ary(str)
	str.split('; ')
end

def get_start_end(time_period_str)
	time_period_str.split('-')
end

def time_str_to_date(time_str)
	Date.parse(time_str)
end

def time_period_to_months_ary(start_str, end_str)
	start_date = time_str_to_date(start_str)
	end_date = time_str_to_date(end_str)

	months_ary = []
	(start_date..end_date).select { |d| months_ary.push(d) if d.day == 1 }

	months_ary
end

def months_to_years(months)
	(months / 12).floor
end

def get_work_experience_non_overleap(time_periods_str)
	months_ary = []

	str_to_ary(time_periods_str).each do |time_period_str|
		start_end = get_start_end(time_period_str)
		  time_period_to_months_ary(start_end[0], start_end[1]).each do |month|
				months_ary.push(month)
			end
	end

	months_to_years(months_ary.uniq.count)
end

p str_to_ary('Feb 2004-Dec 2009; Sep 2004-Jul 2008') == ['Feb 2004-Dec 2009', 'Sep 2004-Jul 2008']
p get_start_end('Feb 2004-Dec 2009') == ['Feb 2004', 'Dec 2009']
p time_str_to_date('Feb 2004') == Date.new(2004, 2, 1)
p months_to_years(65) == 5
p time_period_to_months_ary('Feb 2004', 'Dec 2004').count == 11
p get_work_experience_non_overleap('Feb 2004-Dec 2009; Sep 2004-Jul 2008') == 5
p get_work_experience_non_overleap('Aug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr 2014-Jan 2015') == 4
p get_work_experience_non_overleap('Mar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999') == 1
p get_work_experience_non_overleap('Apr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb 2010-Nov 2011') == 6
p get_work_experience_non_overleap('Feb 2004-May 2004; Jun 2004-Jul 2004') == 0

