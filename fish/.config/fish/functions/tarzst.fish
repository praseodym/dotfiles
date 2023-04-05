function tarzst
tar c $argv | zstd -19 -T0 -o "$argv[1].tar.zst"
end
