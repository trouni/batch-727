require 'date'
require 'yaml'

SSN_PATTERN = /^(?<gender>1|2) ?(?<year>\d{2}) ?(?<month>0[1-9]|1[0-2]) ?(?<department>\d{2})( ?\d{3}){2} ?(?<key>\d{2})$/

def french_ssn_info(ssn)
  match_data = ssn.match(SSN_PATTERN)

  # Check if the number is valid
  if match_data && key_valid?(match_data[:key].to_i, ssn)
    gender = match_data[:gender] == '1' ? 'man' : 'woman'
    month_number = match_data[:month].to_i
    month = Date::MONTHNAMES[month_number]
    year = match_data[:year].to_i
    department = find_department(match_data[:department])

    return "a #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    return 'This number is invalid'
  end
end

def find_department(department_number)
  departments = YAML.load_file('data/french_departments.yml')
  departments[department_number]
end

def key_valid?(key, ssn)
  # A 2 digits key (46, equal to the remainder of the division of (97 - ssn_without_key) by 97.)
  ssn_without_key = ssn.delete(' ')[0...-2].to_i
  key == (97 - ssn_without_key) % 97
end
