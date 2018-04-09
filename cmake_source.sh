# source: https://gist.github.com/phatblat/1713458
# Save script's current directory
DIR=$(pwd)

set -e
set -u
set -x


echo "############################"
echo "# CMake - cmake.org"
echo "############################"
echo ""
echo "CMake, the cross-platform, open-source build system. https://cmake.org"
echo ""
echo "https://github.com/Kitware/CMake/"


# os specific setup
OS=`uname`
case $OS in
	'Linux')

		sudo apt-get update
		sudo apt-get install -y libtool pkg-config build-essential autoconf automake pkg-config libncurses5-dev
		OS='Linux'
	;;
	*) ;;
	'Darwin')
		OS='Mac'
	;;
esac


cd ~/src/
if [ ! -d ~/src/CMake ]
then
	git clone https://github.com/Kitware/CMake.git -b release
fi

cd CMake
git pull

./bootstrap
# make -j will build faster, but may run out of memory
# sudo make -j install
sudo make install

cd $DIR
