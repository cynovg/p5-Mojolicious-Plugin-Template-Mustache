package Mojolicious::Plugin::Template::Mustache;
use Mojo::Base 'Mojolicious::Plugin';

use Template::Mustache;

our $VERSION = '0.01';

sub register {
    my ($self, $app, $args) = @_;

    $args //= {};
    my $mustache = Template::Mustache->new(%$args);
    $Template::Mustache::template_path = '';

    $app->renderer->add_handler(mustache => sub {
        my ($renderer, $c, $output, $options) = @_;

        if ($options->{inline}) {
            my $inline_template = $options->{inline};
            $$output = $mustache->render($inline_template, $c->stash) if $inline_template;
        }
        elsif (my $template_name = $renderer->template_path($options)) {
            $Template::Mustache::template_file = $template_name;
            $$output = $mustache->render($c->stash);
        } else {
            my $data_template = $renderer->get_data_template($options);
            $$output = $mustache->render($data_template, $c->stash) if $data_template;
        }
        return $$output ? 1 : 0;
    });

    return 1;
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Template::Mustache - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('Template::Mustache');

  # Mojolicious::Lite
  plugin 'Template::Mustache';

=head1 DESCRIPTION

L<Mojolicious::Plugin::Template::Mustache> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::Template::Mustache> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicious.org>.

=cut
