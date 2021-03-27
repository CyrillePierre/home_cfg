import os
import ycm_core
from subprocess import check_output, CalledProcessError

########################################
DEFAULT_FILETYPE = "cpp"

BASE_FLAGS = [
        "-Wall", "-Wextra",
        "-Wno-long-long", "-Wno-variadic-macros",
        "-fexceptions", "-ferror-limit=10000",
        "-DNDEBUG",
        "-DUSE_CLANG_COMPLETER",
        "-Iinc",
        ]

EXTRA_FLAGS = {
        "c": [],
        "cpp": ["-std=c++14"]
        }
########################################

########################################
BUILD_DIRS = ["build"]

HEADER_DIRS = ["inc", "include"]
SOURCE_DIRS = ["src"]

HEADER_EXTS = [".h", ".hh", ".hpp", ".hxx"]
SOURCE_EXTS = [".c", ".cc", ".cpp", ".cxx"]

CMAKE_FILE = "CMakeLists.txt"
CCJSON = "compile_commands.json"
X_FLAG = {"c": "-xc", "cpp": "-xc++"}

EXTRA_INCLUDE_DIRS = ["/opt/ros/usr/include"]
########################################

########################################
def ProjectRoot(filename):
    ''' search the directory containing the CMake config file
    If there is no matching, it fallback to the current working directory.
    '''
    default_path = os.path.dirname(filename)
    path = default_path

    while path != '/':
        if os.path.exists(path + '/' + CMAKE_FILE):
            return path
        path = os.path.dirname(path)

    return default_path


def FindBuildDir(basedir, build_subdir, build_dirs):
    prefix = basedir
    while prefix != "/":
        for build_dir in build_dirs:
            ccjsonpath = prefix + "/" + build_dir + "/" + CCJSON
            if os.path.isfile(ccjsonpath):
                return (prefix, build_dir)
            if build_subdir != "" and build_subdir != "." and ".." not in build_subdir:
                ccjson_subpath = prefix + "/" + build_dir + "/" + build_subdir + "/" + CCJSON
                if os.path.isfile(ccjson_subpath):
                    return (prefix, build_dir + "/" + build_subdir)
        prefix = os.path.dirname(prefix)
    return (prefix, "")


def IsHeaderFile(filename):
    ext = os.path.splitext(filename)[1]
    return ext in HEADER_EXTS


def FindCorrespondingSource(filename):
    basename = os.path.splitext(filename)[0]
    for ext in SOURCE_EXTS:
        replacement_file = basename + ext
        if os.path.exists(replacement_file):
            return replacement_file
        for header_dir in HEADER_DIRS:
            for source_dir in SOURCE_DIRS:
                src_file = replacement_file.replace(header_dir, source_dir)
                if os.path.exists(src_file):
                    return src_file
    return None


def FindFirstIncludingSource(filepath):
    filename  = os.path.basename(filepath)
    dirname   = os.path.dirname(filepath)

    grepcmd   = "grep -Enrl '^#[ ]*include[ ]*\""+filename+"\"' "+dirname
    selectcmd = "head -n1"
    cmd       = grepcmd + "|" + selectcmd
    try:
        src_file = check_output(cmd, shell=True)
    except CalledProcessError:
        return None

    if(len(src_file) == 0):
        return None

    return src_file[:-1]


def GetCompilationInfo(db, filename):
    src_file = filename
    if IsHeaderFile(filename):
        src_file = FindCorrespondingSource(filename)
        if not src_file:
            src_file = FindFirstIncludingSource(filename)
            print(src_file)
    if not src_file:
        return None
    return db.GetCompilationInfoForFile(src_file)


def InfoFromJson(db_dir, filename):
    try:
        db = ycm_core.CompilationDatabase(db_dir)
        if not db:
            return None
        info = GetCompilationInfo(db, filename)
        if not info:
            return None
        if not info.compiler_flags_:
            return None
        return info
    except:
        return None

# TODO: still working? still useful?
def GetSystemIncludeDirectories():
    try:
        out = check_output("echo|clang 2>&1 -E -v -xc++ -", shell=True)
    except CalledProcessError:
        return []

    lines = out.split(bytearray('\n', 'utf8'))
    begin = 0
    while begin < len(lines) and lines[begin] != "#include <...> search starts here:":
        begin += 1
    begin += 1

    includes = []
    while begin < len(lines) and lines[begin] != "End of search list.":
        fullpath = lines[begin][1:]
        includes.append("-isystem")
        includes.append(os.path.realpath(fullpath))
        begin += 1

    return includes

#########################################

########################################
def Settings(**kwargs):
    filename = kwargs["filename"]

    client_data = None
    filetype = None
    flags = []

    if "client_data" in kwargs:
        client_data = kwargs["client_data"]
    if client_data:
        if "&filetype" in client_data:
            filetype = str(client_data["&filetype"])

    if not filetype:
        filetype = DEFAULT_FILETYPE

    root = ProjectRoot(filename)
    build_subdir = os.path.basename(root)
    (prefix, build_dir) = FindBuildDir(root, build_subdir, BUILD_DIRS)

#    print('----------------------------------------------')
#    print("kwargs: ", kwargs)
#    print("build_subdir: ", build_subdir)
#    print("root: ", root)
#    print("build_dir: ", build_dir)
#    print("prefix: ", prefix)

    db_info = None
    if prefix != "/" and build_dir != "":
        db_dir = prefix + "/" + build_dir
        db_info = InfoFromJson(db_dir, filename)

    rdir = "."

    if db_info:
        flags = list(db_info.compiler_flags_)
        rdir = db_info.compiler_working_dir_
    else:
        flags = BASE_FLAGS
        if filetype in X_FLAG:
            flags.append(X_FLAG[filetype])
        if filetype in EXTRA_FLAGS:
            flags.extend(EXTRA_FLAGS[filetype])

    flags += GetSystemIncludeDirectories()

    # add include flags for extra dirs
    for dir in EXTRA_INCLUDE_DIRS:
        if os.path.exists(dir):
            flags += ["-I" + dir]

    return {"flags": flags, "include_paths_relative_to_dir": rdir, "override_filename": filename}
########################################
