# Random notes

## Generating keys based on atlassian-extras-key-manager

There are two public keys in there called `LICENSE_STRING_KEY_V2` and `1600708331`

They are both quite old, and are 1024 bit keys with a 160 bit q. You can generate
your own with something like this:

    openssl genpkey -genparam -algorithm DSA -pkeyopt dsa_paramgen_bits:1024 -pkeyopt dsa_paramgen_q_bits:160 -out dsaparams.pem
    openssl genpkey -paramfile dsaparams.pem -out test.pem

You can confirm the length matches with

    openssl dsa -pubout -in test.pem  | openssl dsa -pubin -text


