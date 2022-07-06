crumb :root do
  link "Home", root_path
end

crumb :user_new do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :user_login do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :search do
  link "検索結果", search_posts_path
  parent :root
end


crumb :post do
  link "教室情報投稿", new_post_path
  parent :root
end


crumb :users do |user|
  link "#{user.name}さんの詳細", user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "ユーザー編集"
  parent :users,user
end

crumb :dm do |user|
  link "DM"
  parent :users,user
end

crumb :follow do |user|
  link "フォロー一覧"
  parent :users,user
end

crumb :follower do |user|
  link "フォロワー一覧"
  parent :users,user
end




# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
