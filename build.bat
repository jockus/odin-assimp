if exist assimp rmdir /S /Q assimp
git clone -b v4.1.0 https://github.com/assimp/assimp

if exist include rmdir /S /Q include
mkdir include

if exist lib rmdir /S /Q lib
mkdir lib
		 
		 rem -DRT_LIBRARY=msvcrt.lib^
		 rem -DBUILD_SHARED_LIBS=OFF^

pushd assimp
	mkdir build
	pushd build
		cmake -G "NMake Makefiles"^
		 -DASSIMP_NO_EXPORT=ON^
		 -DASSIMP_INSTALL_PDB=OFF^
		 -DASSIMP_BUILD_ASSIMP_TOOLS=OFF^
		 -DASSIMP_BUILD_TESTS=OFF^
		 -DASSIMP_BUILD_SAMPLES=OFF^
		 -DASSIMP_BUILD_ALL_IMPORTERS_BY_DEFAULT=OFF^
		 -DASSIMP_BUILD_FBX_IMPORTER=ON^
		 -DASSIMP_BUILD_OBJ_IMPORTER=ON^
		 -DCMAKE_BUILD_TYPE=Release^
		 ..
		nmake
		copy code\*.lib ..\..\
		copy code\*.dll ..\..\
	popd
	xcopy /s include ..\include\
popd
