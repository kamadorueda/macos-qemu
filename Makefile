export SHORTNAME=big-sur
DISK_SIZE := 256G

all: BaseSystem.img mac_hdd_ng.img boot

BaseSystem.dmg:
	./fetch-macOS-v2.py --short=$(SHORTNAME)

BaseSystem.img: BaseSystem.dmg
	qemu-img convert BaseSystem.dmg -O raw BaseSystem.img

mac_hdd_ng.img:
	qemu-img create -f qcow2 mac_hdd_ng.img ${DISK_SIZE}

boot:
	./OpenCore-Boot.sh
