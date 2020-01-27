# Pension Project Log Analyser

## RUN

### calculate_all_visits
ruby -r "./app/log_analyser.rb" -e "p LogAnalyser.new('./logs/webserver.log').calculate_all_visits"

### calculate_unique_visits
ruby -r "./app/log_analyser.rb" -e "p LogAnalyser.new('./logs/webserver.log').calculate_unique_visits"
