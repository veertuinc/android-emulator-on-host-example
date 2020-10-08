# Example for running your Android Emulator through an Anka VM and into the Anka Build Virtualization Host

Problem: Anka VMs, at the time this repo was created, do not support "metal"/usage of GPUs. This prevents or slows down android emulators (or anything else needing a GPU) that are run within the VM itself.

Solution: This repo is an example of running your build and unit tests within an Anka VM and then passing data and running your android emulator/UI tests on the host itself.

> It's suggested that you only run one VM at a time on one of your Anka Build Virtualization nodes/hosts due to the resources needed for android emulators.

**Checkout our video walkthrough showing how this project works: https://youtu.be/kwgVyHjB4p4**

The [.github/workflows/main.yml](.github/worklows/main.yml) file (using the [Anka VM Github Action](https://github.com/marketplace/actions/anka-vm-github-action)) shows, how we achieved this. The pattern will be similar for whatever CI/CD tools you use.

Requirements:

1. You'll need to install Android Studio into the VM Template/Tag
2. The host must have Remote Login (ssh) enabled
