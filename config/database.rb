configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  set :database, {
    adapter: "sqlite3",
    database: "db/db.sqlite3"
  }

  # Load all models from app/models, using autoload instead of require
  postgres://woftmyqgsgvthx:9b85ac9d2871dbd70b92d0e989fac3b4df2df23139761ebda7deea2cd2dd26b6@ec2-18-207-95-219.compute-1.amazonaws.com:5432/dfnalht37r71jd
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
