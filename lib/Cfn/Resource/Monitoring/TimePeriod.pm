use Moose::Util::TypeConstraints;
use Cfn;

coerce 'Cfn::Resource::Properties::Monitoring::TimePeriod',
from 'HashRef',
via { Cfn::Resource::Properties::Monitoring::TimePeriod->new( %$_ ) };

coerce 'Cfn::Resource::Monitoring::TimePeriod',
from 'HashRef',
via { Cfn::Resource::Monitoring::TimePeriod->new( Properties=>%$_ ) };

package Cfn::Resource::Monitoring::TimePeriod {
	use Moose;
	extends 'Cfn::Resource';
	has Properties => (isa => 'Cfn::Resource::Properties::Monitoring::TimePeriod', is => 'rw', coerce => 1, required => 1);

}

package Cfn::Resource::Properties::Monitoring::TimePeriod {

	use Moose;
	use MooseX::StrictConstructor;
	extends 'Cfn::Resource::Properties';

	has Name => (isa => 'Cfn::Value', is => 'rw', coerce=>1);
	has Id => (isa => 'Cfn::Value', is => 'rw', coerce=>1);
	has Monday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Tuesday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Wednesday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Thursday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Friday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Saturday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Sunday => (isa=>'Cfn::Value', is=>'rw',coerce=>1);
	has Description => (
		isa=>'Cfn::Value', 
		is => 'rw', 
		coerce=>1,
		lazy=>1,
		default=>sub{
			my $self = shift;
			return $self->Name;
		}
	);
}

return 1;
