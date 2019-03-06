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
	OUTPUT_DIR=lib carton exec perl -I build-lib/ build-bin/build-cfn-classes spec/spec.json

#ireland
get-spec-ireland:
	wget -O spec/eu-west-1.json.gz 'https://d3teyb21fexa9r.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/eu-west-1.json.gz

get-spec-virginia:
	wget -O spec/us-east-1.json.gz 'https://d1uauaxba7bl26.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/us-east-1.json.gz

get-all-specs: get-spec-virginia get-spec-ireland
	# links for all spec files http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-resource-specification.html
	# mapping from region name to region code http://docs.aws.amazon.com/general/latest/gr/rande.html
	#north california
	wget -O spec/us-west-1.json.gz 'https://d68hl49wbnanq.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/us-west-1.json.gz
	#mumbai
	wget -O spec/ap-south-1.json.gz 'https://d2senuesg1djtx.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ap-south-1.json.gz
	#osaka-local
	wget -O spec/ap-northeast-3.json.gz 'https://d2zq80gdmjim8k.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ap-northeast-3.json.gz
	#seoul
	wget -O spec/ap-northeast-2.json.gz 'https://d1ane3fvebulky.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ap-northeast-2.json.gz
	#sydney
	wget -O spec/ap-southeast-2.json.gz 'https://d2stg8d246z9di.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ap-southeast-2.json.gz
	#singapore
	wget -O spec/ap-southeast-1.json.gz 'https://doigdx0kgq9el.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ap-southeast-1.json.gz
	#tokyo
	wget -O spec/ap-northeast-1.json.gz 'https://d33vqc0rt9ld30.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ap-northeast-1.json.gz
	#canada
	wget -O spec/ca-central-1.json.gz 'https://d2s8ygphhesbe7.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/ca-central-1.json.gz
	#frankfurt
	wget -O spec/eu-central-1.json.gz 'https://d1mta8qj7i28i2.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/eu-central-1.json.gz
	#london
	wget -O spec/eu-west-2.json.gz 'https://d1742qcu2c1ncx.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/eu-west-2.json.gz
	#paris
	wget -O spec/eu-west-3.json.gz 'https://d2d0mfegowb3wk.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/eu-west-3.json.gz
	#saopaulo
	wget -O spec/sa-east-1.json.gz 'https://d3c9jyj3w509b0.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/sa-east-1.json.gz
	#ohio
	wget -O spec/us-east-2.json.gz 'https://dnwj8swjjbsbt.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/us-east-2.json.gz
	#oregon
	wget -O spec/us-west-2.json.gz 'https://d201a2mn26r7lk.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json'
	gunzip -f spec/us-west-2.json.gz

fix-spec: get-spec-virginia
	carton exec build-bin/fix-spec spec/us-east-1.json spec/spec.json

build: fix-spec gen-classes


