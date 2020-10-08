$date = Get-Date -Format "dddd yyyy-MM-dd HH:mm:ss K"

function commit_and_push {
    git branch -M main
    # Commit
    git add .
    git commit -m ":memo: Update: $date"
}
git config user.name "Ryanjiena"
git config user.email "Ryanjiena@foxmail.com"
# git remote add origin git@github.com:Ryanjiena/Navigation.git
# git branch -M main
commit_and_push
