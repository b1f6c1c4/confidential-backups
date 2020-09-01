# confidential-backups

## Guide for the repo

- All commits must be signed by OpenPGP's S-key.
- Only one branch, `master`.
- No issue, no PR, no wiki.
- Try not to rebase _nor_ merge.

## Guide for Kind-I backups

- Examples for Kind-I backups:
    - Passwords
- Use OpenPGP's `-c` for all Kind-I backups.
- Use the same 40+ byte symmetric passphrase.
    - Hint: 黑
- Only type the passphrase on a dedicated, air-gapped machine.
- Do not rotate the passphrase.
- Rotate a backup when a new subkey is added.
- To add a new backup:

    ```bash
    gpg --export-secret-keys <fingerprint> | gpg -c --armor | tee ...
    ```

- To recover from a backup:

    ```bash
    gpg --decrypt ... | gpg --import
    ```
    And adjust trust level.

## Guide for Kind-II backups

- Use OpenPGP's E-key + S-key for all Kind-II backups.
- Rotate a backup when E-key rotation happens.
- To add a new backup:

    ```bash
    gpg --encrypt --sign --armor -r <fingerprint> | tee ...
    ```

- To recover from a backup:

    ```bash
    gpg --decrypt ...
    ```

