echo "project_dir : $1"
echo "email : $2"
project_dir=$1
email=$2
init_time=$(date +%s)

# gradle run
cd $project_dir
gradle run

fin_time=$(date +%s)

# Path: main.sh
mail_title="Gradle Run Complete Notification"
mail_content="Gradle run complete on $project_dir\n\nStart time : $(date -d @$init_time)\nFinish time : $(date -d @$fin_time)\n\nElapsed time : $(($fin_time - $init_time)) seconds\n\n"

# send mail after run
mail -s "$mail_title" "$email" <<< $mail_content