# robotic-arm-controls

Motion-control stack for a **6-DOF articulated robotic arm** (revolute joints,
axis order Z–Y–Y–Z–Y–Z). Provides forward/inverse kinematics, trajectory
generation, a joint controller, and a hardware-abstraction layer so the same
programs run in **simulation** or against real motor drivers.

> Status: early development. Mechanical CAD lives in the sibling `RoboticArm_6DOF`
> folder (STEP/SLDPRT). This repo is the controls + programming side.

## Layout
```
config/          kinematics (DH), controller gains, hardware/driver map (YAML)
description/     arm6dof.urdf  – robot description (links, joints, limits)
src/arm_controls kinematics, inverse_kinematics, trajectory, controller,
                 hardware_interface (sim/serial/CAN), robot, program_runner
programs/        example motion programs (home, sweep, pick_place)
scripts/         run_sim.py, jog.py
tests/           pytest unit tests (FK round-trips, IK convergence)
docs/            getting_started, kinematics notes
```

## Quick start
```bash
python -m venv .venv && source .venv/bin/activate
pip install -e .[dev]
pytest -q                       # run the tests
python scripts/run_sim.py       # dry-run a program against the sim backend
python programs/demo_sweep.py   # articulate every joint through its range
```

## Kinematics
The chain is defined in `config/arm_dh.yaml` as per-joint `axis` + `translation`
(mm) from the previous frame. Forward kinematics composes homogeneous transforms;
inverse kinematics uses damped least-squares on the numerical Jacobian. See
`docs/kinematics.md`.

## Safety
`config/arm_dh.yaml` carries joint limits and `config/controller.yaml` carries
velocity/acceleration caps. The `HardwareInterface` refuses commands outside
limits. **Never** run on hardware without validated E-stop wiring.

## License
MIT © 2026 Mihir Madhaparia
