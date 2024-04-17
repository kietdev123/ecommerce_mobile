const fs = require('fs/promises');
const { 
    getBlocEventContent, 
    getBlocBlocContent,
    getBlocStateContent,
    getRepoImpContent,
    getRepoRepoContent, } = require('./file_content');

// Format name: 
// 1 word  : str
// 2 words : str1_str2 or str1_str2_str3
const name = "hello_world";

async function createDirectory(path) {
    // console.log(path);
    try {
        await fs.access(path);
    } catch (error) {
        console.log(error);
        try {
            await fs.mkdir(path, { recursive: true });
        } catch (error) {
            console.log(error);
        }

    }
}

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

async function genCode() {
    let str = name.toLocaleLowerCase();
    let strs = str.split('_');
    let className = '';
    for (let i in strs) {
        className += capitalizeFirstLetter(strs[i])
    }
    if (className == '') {
        className = capitalizeFirstLetter(str);
    }

    await Promise.all([
        // bloc
        fs.writeFile(`./lib/bloc/${name}/${name}_event.dart`, 
            getBlocEventContent(name, className).toString()),
        fs.writeFile(`./lib/bloc/${name}/${name}_bloc.dart`, 
            getBlocBlocContent(name, className).toString() ),
        fs.writeFile(`./lib/bloc/${name}/${name}_state.dart`, 
            getBlocStateContent(name, className).toString()),
        // repository
        fs.writeFile(`./lib/repository/${name}/${name}_imp.dart`, 
            getRepoImpContent(name, className).toString()),
        fs.writeFile(`./lib/repository/${name}/${name}_repo.dart`, 
            getRepoRepoContent(name, className).toString()),
    ]);
}

async function main() {
    await createDirectory(`./lib/bloc/${name}`)
    await createDirectory(`./lib/repository/${name}`)
    await genCode();
    console.log('Done.');
}

main();

