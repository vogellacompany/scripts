# changes the version of the vogella asciidoctor gradle plugin to the specified version
# https://github.com/vogellacompany/com.vogella.gradle.plugins
for dir in ./*/
do
    if [ "$dir" == './com.vogella.tutorials.scripts/' ]
    then
        continue
    fi
    dir=${dir%*/}
    cd ${dir}
    if [ -f 'build.gradle' ]
    then
        echo "build.gradle found in ${dir}"
        sed -i "s/'com.vogella.gradle:com.vogella.gradle.plugin.asciidoc:.*'/'com.vogella.gradle:com.vogella.gradle.plugin.asciidoc:$1'/" build.gradle
    fi
    cd ..
done

