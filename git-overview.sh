ACTUAL_DATE="$(date)"
COMMIT_COUNT="$(git log --oneline | wc -l)"
COMMIT_LAST_WEEK="$(git log --oneline --since=1.week | wc -l)"
COMMIT_AUTORS="$(git shortlog -s --since=1.week)"
COMMIT_DIFFS="$(git log --pretty=tformat: --numstat --since=1.week | awk -F" " '{ added += $1; removed += $2 } END { print "добавлено строк -", added ",", "удалено строк -", removed }')"
if [ -d returns ]
then
  echo "Скрипт запущен в каталоге с GIT проектом"
  echo "Текущие дата и время - ${ACTUAL_DATE}"
  echo "Общее количество коммитов - ${COMMIT_COUNT}"
  echo "Коммитов за последнюю неделю - ${COMMIT_LAST_WEEK}"
  echo -e "Количество добавленных и удаленных строк за последнюю неделю: \n${COMMIT_DIFFS}"
  echo -e "Список авторов и количестуво созданных ими коммитов за последнюю неделю: \n${COMMIT_AUTORS}"
  fi
echo "$?"