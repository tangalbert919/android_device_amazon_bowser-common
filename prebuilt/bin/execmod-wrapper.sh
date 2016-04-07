#!/system/bin/sh

if [ "${0}" = "/vendor/bin/camera_dcc.sh" ]; then
	exec "/vendor/bin/camera_dcc" "${@}"
fi

exit 1
