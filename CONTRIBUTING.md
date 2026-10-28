# Contributing

Thank you for considering a contribution to Simple Interest Calculator.

All contributions, bug reports, bug fixes, documentation improvements, enhancements, and ideas are welcome.

## How to contribute

1. Check the existing issues and pull requests to avoid duplicating work.
2. For a significant change, open an issue first to discuss the proposed approach.
3. Fork the repository and create a focused branch for your change.
4. Make your change and test it locally.
5. Use clear commit messages that explain the purpose of the change.
6. Open a pull request describing what changed, why it is needed, and how it was tested.

## Reporting bugs

When reporting a bug, include:
- A clear description of the problem.
- Steps to reproduce it.
- Expected and actual behavior.
- Your operating system and Bash version, if relevant.

## Code and documentation expectations

- Keep changes focused and easy to review.
- Use readable Bash and meaningful variable names.
- Update documentation when behavior or usage changes.
- Do not include secrets, credentials, or personal information in commits.
- Be respectful and follow the community expectations in `CODE_OF_CONDUCT.md`.

## Testing

For changes to `simple-interest.sh`, test at least one normal input case and, where relevant, invalid input. For example:

```bash
printf '1000\n5\n2\n' | ./simple-interest.sh
```

The expected simple interest is `100.00` and the total amount is `1100.00`.
