PROJECT_NAME=$1
SONAR_HOST=http://sonar:9000
SONAR_TOKEN=sqa_f31d671e290bdb2721361d904e126e9e0c276fcc

docker run -it --rm --network docker-net -v $(pwd):/usr/src sonarsource/sonar-scanner-cli \
    sonar-scanner \
		-Dsonar.projectKey=$PROJECT_NAME\
		-Dsonar.sources=. \
		-Dsonar.host.url=$SONAR_HOST \
		-Dsonar.token=$SONAR_TOKEN \
		-Dsonar.java.binaries=target/*
