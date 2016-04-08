use OO::Monitors;

monitor Test::Counter {
    has $!a = 0;

    method inc() {
        $!a++;
    }
    
    method current() {
        $!a
    }
}
