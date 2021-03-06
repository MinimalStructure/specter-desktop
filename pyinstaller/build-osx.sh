#!/usr/bin/env bash

# pass version number as an argument 

pip install -e ..
pip install -r requirements.txt
rm -rf build/ dist/ specterd/ release/
rm *.dmg
pyinstaller specterd_onedir.spec
mv dist/specterd/ ./specterd
pyinstaller specter_desktop.spec
pyinstaller specterd.spec

mkdir release

create-dmg 'dist/Specter.app'
mv "Specter 0.0.0.dmg" release/SpecterDesktop-$1.dmg
zip release/specterd-$1-osx.zip dist/specterd