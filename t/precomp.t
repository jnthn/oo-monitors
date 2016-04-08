use Test;
use Test::Counter;

plan 1;
my $c = Test::Counter.new;

todo 'precompile fails due to RT 127858';
lives-ok { $c.inc }, "method from monitor works when pre-compiled";
