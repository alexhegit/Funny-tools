# v4l2-ctl Usage

v4l2-ctl — An application to control video4linux drivers (https://www.mankier.com/1/v4l2-ctl)



## Get all help

```
# v4l2-ctl --help

General/Common options:
  --all              display all information available
  -C, --get-ctrl <ctrl>[,<ctrl>...]
                     get the value of the controls [VIDIOC_G_EXT_CTRLS]
  -c, --set-ctrl <ctrl>=<val>[,<ctrl>=<val>...]
                     set the value of the controls [VIDIOC_S_EXT_CTRLS]
  -D, --info         show driver info [VIDIOC_QUERYCAP]
  -d, --device <dev> use device <dev> instead of /dev/video0
                     if <dev> starts with a digit, then /dev/video<dev> is used
  -e, --out-device <dev> use device <dev> for output streams instead of the
                     default device as set with --device
                     if <dev> starts with a digit, then /dev/video<dev> is used
  -h, --help         display this help message
  --help-all         all options
  --help-io          input/output options
  --help-meta        metadata format options
  --help-misc        miscellaneous options
  --help-overlay     overlay format options
  --help-sdr         SDR format options
  --help-selection   crop/selection options
  --help-stds        standards and other video timings options
  --help-streaming   streaming options
  --help-subdev      sub-device options
  --help-tuner       tuner/modulator options
  --help-vbi         VBI format options
  --help-vidcap      video capture format options
  --help-vidout      vidout output format options
  --help-edid        edid handling options
  -k, --concise      be more concise if possible.
  -l, --list-ctrls   display all controls and their values [VIDIOC_QUERYCTRL]
  -L, --list-ctrls-menus
                     display all controls and their menus [VIDIOC_QUERYMENU]
  -r, --subset <ctrl>[,<offset>,<size>]+
                     the subset of the N-dimensional array to get/set for control <ctrl>,
                     for every dimension an (<offset>, <size>) tuple is given.
  -w, --wrapper      use the libv4l2 wrapper library.
  --list-devices     list all v4l devices
  --log-status       log the board status in the kernel log [VIDIOC_LOG_STATUS]
  --get-priority     query the current access priority [VIDIOC_G_PRIORITY]
  --set-priority <prio>
                     set the new access priority [VIDIOC_S_PRIORITY]
                     <prio> is 1 (background), 2 (interactive) or 3 (record)
  --silent           only set the result code, do not print any messages
  --sleep <secs>     sleep <secs>, call QUERYCAP and close the file handle
  --verbose          turn on verbose ioctl status reporting

```

** NOTE ** 

1. Use -d or --device to point to the device (ie. /dev/video*)
2. Use --verbose for more details



## Get all information

```
v4l2-ctl --all
```



## Get the help of video capture

```
# v4l2-ctl --help-vidcap

Video Capture Formats options:
  --list-formats     display supported video formats [VIDIOC_ENUM_FMT]
  --list-formats-ext display supported video formats including frame sizes
                     and intervals
  --list-framesizes <f>
                     list supported framesizes for pixelformat <f>
                     [VIDIOC_ENUM_FRAMESIZES]
                     pixelformat is the fourcc value as a string
  --list-frameintervals width=<w>,height=<h>,pixelformat=<f>
                     list supported frame intervals for pixelformat <f> and
                     the given width and height [VIDIOC_ENUM_FRAMEINTERVALS]
                     pixelformat is the fourcc value as a string
  --list-fields      list supported fields for the current format
  -V, --get-fmt-video
                     query the video capture format [VIDIOC_G_FMT]
  -v, --set-fmt-video
  --try-fmt-video width=<w>,height=<h>,pixelformat=<pf>,field=<f>,colorspace=<c>,
                  xfer=<xf>,ycbcr=<y>,hsv=<hsv>,quantization=<q>,
                  premul-alpha,bytesperline=<bpl>
                     set/try the video capture format [VIDIOC_S/TRY_FMT]
                     pixelformat is either the format index as reported by
                       --list-formats, or the fourcc value as a string.
                     The bytesperline option can be used multiple times, once for each plane.
                     premul-alpha sets V4L2_PIX_FMT_FLAG_PREMUL_ALPHA.
                     <f> can be one of the following field layouts:
                       any, none, top, bottom, interlaced, seq_tb, seq_bt,
                       alternate, interlaced_tb, interlaced_bt
                     <c> can be one of the following colorspaces:
                       smpte170m, smpte240m, rec709, 470m, 470bg, jpeg, srgb,
                       oprgb, bt2020, dcip3
                     <xf> can be one of the following transfer functions:
                       default, 709, srgb, oprgb, smpte240m, smpte2084, dcip3, none
                     <y> can be one of the following Y'CbCr encodings:
                       default, 601, 709, xv601, xv709, bt2020, bt2020c, smpte240m
                     <hsv> can be one of the following HSV encodings:
                       default, 180, 256
                     <q> can be one of the following quantization methods:
                       default, full-range, lim-range

```



## List the formats (FORMAT with RESOLUTION and FPS)

```
# v4l2-ctl --list-formats-ext -d 0
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture

        [0]: 'MJPG' (Motion-JPEG, compressed)
                Size: Discrete 640x480
                        Interval: Discrete 0.008s (120.101 fps)
                Size: Discrete 1920x1080
                        Interval: Discrete 0.032s (31.000 fps)
                Size: Discrete 1280x1024
                        Interval: Discrete 0.032s (31.000 fps)
                Size: Discrete 1024x768
                        Interval: Discrete 0.032s (31.000 fps)
                Size: Discrete 352x288
                        Interval: Discrete 0.008s (120.101 fps)
                Size: Discrete 320x240
                        Interval: Discrete 0.008s (120.101 fps)
                Size: Discrete 800x600
                        Interval: Discrete 0.017s (60.000 fps)
                Size: Discrete 1280x720
                        Interval: Discrete 0.017s (60.000 fps)
        [1]: 'YUYV' (YUYV 4:2:2)
                Size: Discrete 640x480
                        Interval: Discrete 0.033s (30.500 fps)
                Size: Discrete 1920x1080
                        Interval: Discrete 0.167s (6.000 fps)
                Size: Discrete 1280x1024
                        Interval: Discrete 0.167s (6.000 fps)
                Size: Discrete 1024x768
                        Interval: Discrete 0.111s (9.000 fps)
                Size: Discrete 352x288
                        Interval: Discrete 0.033s (30.500 fps)
                Size: Discrete 320x240
                        Interval: Discrete 0.033s (30.500 fps)
                Size: Discrete 800x600
                        Interval: Discrete 0.048s (21.000 fps)
                Size: Discrete 1280x720
                        Interval: Discrete 0.111s (9.000 fps)

```

## List current settings of device

```
# v4l2-ctl -V -d 0
Format Video Capture:
        Width/Height      : 640/480
        Pixel Format      : 'YUYV' (YUYV 4:2:2)
        Field             : None
        Bytes per Line    : 1280
        Size Image        : 614400
        Colorspace        : sRGB
        Transfer Function : Default (maps to sRGB)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Limited Range)
        Flags             :
```

### Set format of the device

You can use the combination settings query by  "*v4l2-ctl --list-formats-ext -d 0"*

```
~# v4l2-ctl -v width=640,height=480,pixelformat=MJPG --verbose -d 0
Format Video Capture:
        Width/Height      : 640/480
        Pixel Format      : 'MJPG' (Motion-JPEG)
        Field             : None
        Bytes per Line    : 0
        Size Image        : 614989
        Colorspace        : sRGB
        Transfer Function : Default (maps to sRGB)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :
```

** NOTE **

1. FPS could not be set directly and it will be decided by the RESOLUTION and PIXEL FORMAT.
2. Then use *v4l-ctl --all* to check if the settings
