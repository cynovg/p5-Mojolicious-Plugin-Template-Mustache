requires 'Mojolicious', '>=6.33';
requires 'Template::Mustache', '>=1.0.2';

on test => sub {
    requires 'Software::License::GPL_3';  
};
