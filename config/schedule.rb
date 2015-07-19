set :environment, :development
set :output, "#{path}/log/cron.log"

every 5.minute do
  runner "Post.publish"
end