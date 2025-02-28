#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���a[install.sh �V[S�F~���t��Hk�{�2�i:i�vH:}H3!���.F+_�'h
�Ԁ�	�@��d`HP\'�+�������e7e�C�ig�=�������\����O5 ��ZBH���s6W��gu�YZs�
$�3����p!5n�0D)d\��$�LcS��������##t�)"S��m�����~���_sU���++9gaיٮ|��Y��֯�g��J�hu��Γ����\�0�,N�+d��� ��t茜�4���m'.@W�jL��h��vD�[��8.�we�L*t�C�-(%�8�M�����'����"�+�cA� @d�0nb
����VզK�������-YvU����>a����l�__�~����7�^�xtwmm���)D#�O [N �W�e�.�s\�v�ݲM F[�h[���F�.tE�.�T�%M�n$�;*��V��e�@g��͓K�E�I�b�Z�yv����잻�EJӁ�>����-���GԸ�Ѱ���i�/�P)���G��^`��[�#1��x����]�v�	��t�(D�v�I��'�
��	E��@���y	BS�-BHè����lL5��E�l�hl���7@�<+K��[\rf���@?�jh��IjYS�����OVaJEi()�j�N�>�##�_nk(fq[0�އ��T��o��VQg���ߜ��N7#��p>/ϥ��?����|��|��Ys48kR,9�.D!�{�X �?��@���ԴP�X���k�Y�,��Y���V��oǫ(��eӈ��0��8i:�k'��D0�-��f��
�&Ov�׮�zRO5��c��s0��GY���-�O�u6�^``J���4|y�PPF��8j�*K?V
�;�:�o�!��)w�����Ť��0m�2*����e���3��d���¾��E���YH��OÕ���xǝ,����yyC��XS7���;�A��t�� f#��cc�,�q>� ����+w�%y:�#�8�j�>��1�c�%{c��[����I~��v�b�3�)ԑN���&Y(��!�=�>~C6�G�m5��rq��fˇ�!��C��>=Q{X�{Py7v4��,MR�Py�M��3�t�kꁟ#M3�7��)^C"�1����ϗK�d����=g/�Uُ�I���u5���!gq<�Y�`bdj݃{d�|��}^t�M2�Nn�.IӃL}�0ۖtW�����S%�7P%>&g"_y�LufT�K�Ƒ�{��(T�9���Q�)�2��)}p�tʎ�[숵��ώ�z���)�����|�OI�?C2~�!N�  