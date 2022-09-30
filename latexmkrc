# vim: ft=perl

{
	my $git_root = `git rev-parse --show-toplevel`;
	chomp $git_root;

	ensure_path('TEXINPUTS', $git_root . '/tex/');
};

$pdf_previewer = 'start evince %O %S';
$pdf_mode = 5; # -pdfxe
$out_dir = '.cache';
$xelatex = 'xelatex --8bit --interaction=nonstopmode --shell-escape %O %S';
$clean_ext = '_minted-%R _minted-%R/* _svg-%R _svg-%R/*';
