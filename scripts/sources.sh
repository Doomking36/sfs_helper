#!/bin/sh -e

mkdir -p ./packages ./sources

curl_sources="https://musl-libc.org/releases/musl-1.2.3.tar.gz
	        http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz
		https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.xz
		http://archive.ubuntu.com/ubuntu/pool/universe/e/e3/e3_2.82+dfsg.orig.tar.gz
		ftp://ftp.astron.com/pub/tcsh/tcsh-6.24.07.tar.gz
		ftp://ftp.gnu.org/pub/gnu/make/make-4.4.tar.gz
		https://github.com/torvalds/linux/archive/refs/tags/v5.17-rc4.tar.gz
		ftp://ftp.gnu.org/pub/gnu/sed/sed-4.9.tar.xz
		ftp://ftp.gnu.org/pub/gnu/grep/grep-3.10.tar.xz
		https://sortix.org/libz/release/libz-1.2.8.2015.12.26.tar.gz
		https://zlib.net/pigz/pigz-2.8.tar.gz
		http://greenwoodsoftware.com/less/less-608.zip
		https://mandoc.bsd.lv/snapshots/mandoc-1.14.6.tar.gz
		https://curl.se/tiny/tiny-curl-7.79.1.tar.gz
		https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.gz
		https://github.com/illiliti/eiwd/releases/download/2.14-1/iwd-2.14.tar.xz";

git_sources="https://github.com/TinyCC/tinycc
	       https://github.com/michaelforney/sbase
	       https://github.com/michaelforney/ubase
	       https://github.com/sabotage-linux/netbsd-curses
	       https://github.com/mrramon/byacc
	       https://github.com/onetrueawk/awk
	       https://www.bearssl.org/git/BearSSL
	       https://github.com/michaelforney/libtls-bearssl
               https://github.com/ecki/net-tools
	       https://github.com/tytso/e2fsprogs
               https://git.disroot.org/nyght/ninit";

decoration() {
    i=1
    while [ $i -le $(tput cols) ]; do
	printf "_"  ; i=$(( i + 1 ))
    done
    printf "\n"
}

get_names() {
    file_name="${url##*/}"
    program_name="${file_name%%.*}"
    program_name="${program_name%%_*}"
    program_name="${program_name%-[0-9]*}"
    extension="${file_name##*.}"
}


printf "\n"
decoration
printf "\033[0;35m*\033[0;0m Downloading and Decompressing the Sources\n"
decoration
printf "\n\n"

for url in $curl_sources; do
    get_names
    printf " \033[0;35m*\033[0;0m $program_name\n"
    decoration

    curl -# -Lf $url -o ./packages/$file_name
    mkdir -p ./sources/$program_name

    printf "Downloaded!\n"
    printf "Decompressing...\n"

    if [ "$extension" = "xz" ]; then
	tar -xf ./packages/$file_name -C ./sources/$program_name --strip-components=1
    elif [ "$extension" = "gz" ]; then
	tar -xzf ./packages/$file_name -C ./sources/$program_name --strip-components=1
    elif [ "$extension" = "zip" ]; then
	unzip -q ./packages/$file_name -d ./sources/$program_name
    fi
    
    printf "Decompressed!\n"
    printf "\n"
    
done

printf "\n\n"
decoration
printf "\033[0;35m*\033[0;0m Git Sources\n"
decoration
printf "\n\n\n"

for url in $git_sources; do
    get_names
    printf " \033[0;35m*\033[0;0m $program_name\n"
    decoration
    git clone $url --depth 1 --jobs 3 ./sources/$file_name
    printf "\n\n"
    done

printf " -- Done cutie, check for any error above because some url's might stop working over time. \n"
printf " -- Said that, Have Fun \033[0;35m<3\033[0;0m\n\n"
