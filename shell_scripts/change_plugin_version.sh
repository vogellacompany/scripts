# changes the version of the vogella asciidoctor gradle plugin to the specified version
# https://github.com/vogellacompany/com.vogella.gradle.plugins
for DIR in ./*/
do
    if [ "$DIR" = './com.vogella.tutorials.scripts/' ]; then
        continue
    fi
    DIR=${DIR%*/}
    cd ${DIR}
    if [ -f 'build.gradle' ] ; then
        echo "build.gradle found in ${DIR}"
        sed -i "s/'com.vogella.gradle:com.vogella.gradle.plugin.asciidoc:.*'/'com.vogella.gradle:com.vogella.gradle.plugin.asciidoc:$1'/" build.gradle
    fi
    cd ..
done
