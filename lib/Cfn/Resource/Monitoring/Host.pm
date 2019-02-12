use Moose::Util::TypeConstraints;
use Cfn;

coerce 'Cfn::Resource::Properties::Monitoring::Host',
from 'HashRef',
via { Cfn::Resource::Properties::Monitoring::Host->new( %$_ ) };

coerce 'Cfn::Resource::Monitoring::Host', 
from 'HashRef',
via { Cfn::Resource::Monitoring::Host->new(Properties=>%$_) };

package Cfn::Resource::Monitoring::Host {
	use Moose;
	extends 'Cfn::Resource';
	has Properties => (isa => 'Cfn::Resource::Properties::Monitoring::Host', is => 'rw', coerce => 1, required => 1);

}

package Cfn::Resource::Properties::Monitoring::Host::Properties {
	use Moose;
	use MooseX::StrictConstructor;
	extends 'Cfn::Resource::Properties';
	
	has User => (is => 'ro', isa => 'Cfn::Value', required => 1,coerce=>1);
	has Ips => (is => 'ro', isa => 'Cfn::Value::Array|Cfn::Value::Function', required => 1,coerce=>1);
	has AsgName => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
	has AwsAccount => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
	has AwsRegion => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
	has ElbName => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
	has StackLogicalId => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
	has StackName => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
	has Type => (is => 'ro', isa => 'Cfn::Value',coerce=>1);
}

coerce 'Cfn::Resource::Properties::Monitoring::Host::Properties',
from 'HashRef',
via { Cfn::Resource::Properties::Monitoring::Host::Properties->new( %$_ ) };

package Cfn::Resource::Properties::Monitoring::Host {
	use Moose;
	use MooseX::StrictConstructor;
	extends 'Cfn::Resource::Properties';

  # Opsview Attributes
	has Name                   => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Id                     => (isa=> 'Cfn::Value', is=>'rw',coerce=>1, predicate=>'has_Id');
	has Ip                     => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Hostgroup              => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Templates              => (isa => 'Cfn::Value::Array|Cfn::Value::Function', is => 'rw', coerce => 1);
	has MonitoredBy            => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Description            => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Attributes             => (isa => 'Cfn::Value::Array|Cfn::Value::Function', is => 'rw', coerce => 1);
	has ServiceChecks          => (isa => 'Cfn::Value::Array|Cfn::Value::Function', is => 'rw', coerce => 1);
	has CheckPeriod            => (isa => 'Cfn::Value', is=>'rw', coerce=>1, default=>'24x7');
	has NotificationPeriod     => (isa => 'Cfn::Value', is=>'rw', coerce=>1);
	has RenotificationInterval => (isa => 'Cfn::Value', is=>'rw', coerce=>1,default=>15);
	has FlapDetection          => (isa => 'Cfn::Value', is => 'rw', coerce=>1, default=>1);
	has RetryInterval          => (isa => 'Cfn::Value', is => 'rw', coerce=>1, default=>1);
	has Icon                   => (isa => 'Cfn::Value', is => 'rw', coerce=>1);
	has CheckCommand           => (isa => 'Cfn::Value', is => 'rw', coerce=>1);
	has CheckInterval          => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default=>0);
	has MaxCheckAttempts       => (isa => 'Cfn::Value', is => 'rw', coerce => 1,default=>2);
	has OtherHostnames         => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has NotificationOptions    => (isa => 'Cfn::Value', is => 'rw', coerce => 1,default=>'u,d,r,f');
	has UseSNMP                => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 0);
	has SNMPPort               => (isa => 'Cfn::Value', is => 'rw', coerce => 1,default=>161);
	has SNMPVersion            => (isa => 'Cfn::Value', is => 'rw', coerce => 1,default=>'2c');
	has SNMPMaxMessageSize     => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 0);
	has SNMPCommunity          => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 'public');
	has SNMPV3AuthPassword     => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => '');
	has SNMPV3Username         => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => '');
	has SNMPV3AuthProtocol     => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has SNMPV3PrivateProtocol  => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has SNMPV3PrivatePassword  => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => '');
	has UseRancid              => (isa => 'Cfn::Value', is => 'rw', coerce => 1,default=>0);
	has RancidPassword         => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has RancidConnectionType   => (isa => 'Cfn::Value', is => 'rw', coerce => 1,default=>'ssh');
	has RancidUsername         => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => '');
	has RancidVendor           => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has UseMRTG                => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 0);
	has UseNMIS                => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 0);
	has NMISNodeType           => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 'router');
	has TidyIfDescrLevel       => (isa => 'Cfn::Value', is => 'rw', coerce => 1, default => 0);
  has Keywords               => (isa => 'Cfn::Value::Array|Cfn::Value::Function', is => 'rw', coerce => 1);
  # Portal attributes
	has Type         => ( isa=>'Cfn::Value', is=>'ro', coerce=>1);
	has Properties   => (isa=>'Cfn::Resource::Properties::Monitoring::Host::Properties', is=>'ro', coerce=>1);
	has Project      => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Datacenter   => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has State        => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Managed      => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has ServiceLevel => (isa => 'Cfn::Value', is => 'rw', coerce => 1);
	has Tags         => ( isa => 'Cfn::Value::Array|Cfn::Value::Function',is=>'ro',coerce=>1);
	has Procedure    => ( isa=>'Cfn::Value', is=>'ro', coerce=>1);
	has Accesses     => ( isa=>'Cfn::Value::Array', is=>'ro', coerce=>1);
}

1;
