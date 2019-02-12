use Moose::Util::TypeConstraints;
use Cfn;

coerce 'Cfn::Resource::Properties::Monitoring::Hostgroup',
from 'HashRef',
via { Cfn::Resource::Properties::Monitoring::Hostgroup->new( %$_ ) };

coerce 'Cfn::Resource::Monitoring::Hostgroup',
from 'HashRef',
via { Cfn::Resource::Monitoring::Hostgroup->new(Properties=>%$_) };

package Cfn::Resource::Monitoring::Hostgroup {
	use Moose;
	extends 'Cfn::Resource';
	has Properties => (isa => 'Cfn::Resource::Properties::Monitoring::Hostgroup', is => 'rw', coerce => 1, required => 1);
}

package Cfn::Resource::Properties::Monitoring::Hostgroup {
	use Moose;
	use MooseX::StrictConstructor;
	extends 'Cfn::Resource::Properties';

	has Id     => (isa=> 'Cfn::Value', is=>'rw', coerce=>1);
	has Parent => (isa=> 'Cfn::Value', is=>'rw', coerce=>1);
	has Name   => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
}

1;
