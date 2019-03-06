readme:
	cpanm -l dzil-local -n Pod::Markdown
	perl -I dzil-local/lib/perl5/ dzil-local/bin/pod2markdown lib/Cfn.pm > README.md

dist: readme
	cpanm -n -l dzil-local Dist::Zilla
	PATH=$(PATH):dzil-local/bin PERL5LIB=dzil-local/lib/perl5 dzil authordeps --missing | cpanm -n -l dzil-local/
	PATH=$(PATH):dzil-local/bin PERL5LIB=dzil-local/lib/perl5 dzil build

test:
	PERL5LIB=local/lib/perl5 prove -I lib -v t/

gen-classes:
	OUTPUT_DIR=lib carton exec perl -I build-lib/ build-bin/build-cfn-classes

get-all-specs:
	carton exec perl build-bin/download_specs

fix-spec:
	carton exec build-bin/fix-spec spec/us-east-1.json spec/spec.json

build: get-all-specs fix-spec gen-classes


