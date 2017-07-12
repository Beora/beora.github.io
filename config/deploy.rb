# config valid only for current version of Capistrano
lock "3.8.0"

set :application, 'beora'
set :repo_url, 'git@github.com:Beora/beora.github.io.git'
set :scm, :git
set :stage, :production

set :format, :pretty
namespace :deploy do
  task :update_jekyll do
    on roles(:app) do
      within "#{deploy_to}/current" do
      	execute :jekyll, "build"
      end
    end
  end

end

after "deploy:symlink:release", "deploy:update_jekyll"