# Contributing
1. Branch from `main`, keep PRs focused.
2. `make lint && make test` must pass. New kinematics/IK code needs a unit test.
3. Never commit secrets, calibration dumps, or hardware serial numbers.
4. Hardware-facing changes require a note on how they were validated (sim + bench).
