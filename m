From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 0/3] leds: Introduce userspace leds driver
Date: Tue, 20 Sep 2016 10:56:01 +0200
Message-ID: <6b0e0eaa-1e13-e8ff-4b74-b7a608f15055@samsung.com>
References: <CGME20160916191750eucas1p2437e0fa04cc99964b79cb774ef482e5a@eucas1p2.samsung.com>
 <1474053410-24387-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1474053410-24387-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

Hi David,

Thanks for applying the remarks. Since it is close to the merge
window now, I'm applying the patch set to the for-4.10 branch of
linux-leds.git.

Thanks,
Jacek Anaszewski

On 09/16/2016 09:16 PM, David Lechner wrote:
> v2 changes:
>
> * sort #includes
> * fix typo in Kconfig
> * Add Documentation text file
>
> v3 changes:
>
> * fix typos in docs
> * rename "leds class"  to "LED class" in docs
> * rebase on linux-leds/for-next
>
> v4 changes:
>
> * Use devm_led_classdev_register() instead of led_classdev_register()
> * Clarified how to create multiple devices in documentation
> * uledmon.c now uses blocking reads instead of poll()
> * Add some sanity checking on user-provided device name to make sure it is not
>   a directory name
> * Reading from /dev/uleds allows any size read buffer - still only returns one
>   byte regardless of size
> * Reading from /dev/uleds blocks until the brightness is changed
> * LEDS_MAX_NAME_SIZE is reduced to 64 to match existing name size limit
> * New patch to use LEDS_MAX_NAME_SIZE in drivers/leds/led-class.c
> * Moved example code to tool/leds/uledmon.c (new patch with Makefile)
>
> David Lechner (3):
>   leds: Introduce userspace leds driver
>   leds: Use macro for max device node name size
>   tools/leds: Add uledmon program for monitoring userspace LEDs
>
>  Documentation/leds/uleds.txt |  36 +++++++
>  drivers/leds/Kconfig         |   8 ++
>  drivers/leds/Makefile        |   3 +
>  drivers/leds/led-class.c     |   3 +-
>  drivers/leds/uleds.c         | 230 +++++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/Kbuild    |   1 +
>  include/uapi/linux/uleds.h   |  23 +++++
>  tools/Makefile               |   7 +-
>  tools/leds/.gitignore        |   1 +
>  tools/leds/Makefile          |  13 +++
>  tools/leds/uledmon.c         |  62 ++++++++++++
>  11 files changed, 383 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/leds/uleds.txt
>  create mode 100644 drivers/leds/uleds.c
>  create mode 100644 include/uapi/linux/uleds.h
>  create mode 100644 tools/leds/.gitignore
>  create mode 100644 tools/leds/Makefile
>  create mode 100644 tools/leds/uledmon.c
>
