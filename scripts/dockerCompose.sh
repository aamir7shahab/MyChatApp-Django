sudo docker-compose down
imageId=`sudo docker images | awk '{if ($1 =="mychatapp-django_djangoapp" || $1 =="postgres" || $1 =="python" || $1 =="nginx") print $3}'`
echo ${imageId}
sudo docker rmi $imageId
sudo docker-compose up -d 
