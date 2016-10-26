use Test;
use Test::Counter;

plan 1;
my $c = Test::Counter.new;

lives-ok { $c.inc }, "method from monitor works when pre-compiled";
