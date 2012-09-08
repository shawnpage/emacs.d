;;-*-coding: utf-8;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
  '(
    ("pbmk" "use Benchmark qw( cmpthese );
cmpthese -10, {};" nil 1)
    ("pdbg" "use Data::Dumper qw( Dumper );
print STDERR Dumper[];" nil 1)
    ("phbp" "#! /usr/bin/perl -w" nil 1)
    ("pusc" "use Smart::Comments;

### " nil 1)
    ("putm" "use Test::More 'no_plan';" nil 1)
   ))

(define-abbrev-table 'help-mode-abbrev-table '())

(define-abbrev-table 'lisp-interaction-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'occur-edit-mode-abbrev-table '())

(define-abbrev-table 'occur-mode-abbrev-table '())

(define-abbrev-table 'process-menu-mode-abbrev-table '())

(define-abbrev-table 'prog-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table '())

