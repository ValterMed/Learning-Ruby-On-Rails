# rake load_articles[csv_name]
require 'csv'

task :load_articles, [:csv_name] => :environment do |task, args|
  csv_file_path = "lib/tasks/files/articles/#{args.csv_name}.csv"
  csv_file = File.open(csv_file_path)
  csv = CSV.parse(csv_file, headers: true)

  csv.each do |row|
    p args.csv_name
    title = row[0]
    message = row[1]
    article = Article.new
    article.title = title
    article.body = message
    article.save
  end

end