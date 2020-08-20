rmdir /S /Q assimp
git clone https://github.com/assimp/assimp.git/tree/v4.1.0

rmdir /S /Q include
mkdir include

rmdir /S /Q lib
mkdir lib

pushd assimp
	mkdir build
	pushd build
		cmake -G "NMake Makefiles"^
		 -DASSIMP_NO_EXPORT=OFF^
		 -DASSIMP_INSTALL_PDB=OFF^
		 -DASSIMP_BUILD_ASSIMP_TOOLS=OFF^
		 -DASSIMP_BUILD_TESTS=OFF^
		 -DASSIMP_BUILD_ALL_IMPORTERS_BY_DEFAULT=OFF^
		 -DASSIMP_BUILD_FBX_IMPORTER=ON^
		 -DASSIMP_BUILD_OBJ_IMPORTER=ON^
		 -DCMAKE_BUILD_TYPE=Release^
		 -DASSIMP_BUILD_STATIC_LIB=ON^
		 ..
		nmake
		copy code\*.lib ..\..\
		copy code\*.dll ..\..\
	popd
	xcopy /s include ..\include\
popd
