grubby --update-kernel=ALL --remove-args="nvidia-drm.modeset=1 rd.driver.blacklist=nouveau modprobe.blacklist=nouveau"

# grubby --update-kernel=ALL --args="nvidia-drm.modeset=1 rd.driver.blacklist=nouveau modprobe.blacklist=nouveau"
