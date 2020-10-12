
sudo docker-compose -f /MyChatApp-Django/docker-compose.yaml down
imageId=`sudo docker images | awk '{if ($1 =="mychatapp-django_djangoapp" || $1 =="postgres" || $1 =="python" || $1 =="nginx") print $3}'`
sudo docker rmi $imageId
sudo docker-compose -f /MyChatApp-Django/docker-compose.yaml up -d 