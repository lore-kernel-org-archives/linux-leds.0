From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH 3/3] platform/chrome: Add Wilco EC keyboard backlight LEDs support
Date: Mon, 25 Mar 2019 13:48:54 -0700
Message-ID: <CAE_wzQ8oRKjmA0x01+gmPuQQQ=yCxS+v+c9=VyQSg1EKP8bDkQ@mail.gmail.com>
References: <20190321221334.240059-3-ncrews@chromium.org> <20190322113509.GE8681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322113509.GE8681@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Crews <ncrews@chromium.org>, enric.balletbo@collabora.com, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lkml <linux-kernel@vger.kernel.org>, dlaurie@chromium.org, sjg@google.com, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 22, 2019 at 4:35 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > The EC is in charge of controlling the keyboard backlight on
> > the Wilco platform. We expose a standard LED class device at
> > /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> > after the standard Chrome OS keyboard backlight driver at
> > drivers/platform/chrome/cros_kbd_led_backlight.c
>
> Please make it platform::kbd_backlight . Userland should not need to
> know what wilco is...

It should not. But the current convention is "<device>::kbd-backlight":

dtor@dtor-ws:~/kernel/work $ git grep "::kbd_backlight" -- drivers/
drivers/hid/hid-asus.c: drvdata->kbd_backlight->cdev.name =
"asus::kbd_backlight";
drivers/hid/hid-google-hammer.c:        kbd_backlight->cdev.name =
"hammer::kbd_backlight";
drivers/hwmon/applesmc.c:       .name                   = "smc::kbd_backlight",
drivers/input/misc/ims-pcu.c:            "pcu%d::kbd_backlight",
pcu->device_no);
drivers/platform/chrome/cros_kbd_led_backlight.c:       cdev->name =
"chromeos::kbd_backlight";
drivers/platform/x86/asus-laptop.c:             cdev->name =
"asus::kbd_backlight";
drivers/platform/x86/asus-wmi.c:                asus->kbd_led.name =
"asus::kbd_backlight";
drivers/platform/x86/dell-laptop.c:     .name           = "dell::kbd_backlight",
drivers/platform/x86/samsung-laptop.c:          samsung->kbd_led.name
= "samsung::kbd_backlight";
drivers/platform/x86/thinkpad_acpi.c:           .name           =
"tpacpi::kbd_backlight",
drivers/platform/x86/toshiba_acpi.c:            dev->kbd_led.name =
"toshiba::kbd_backlight";

and userspace already knows how to handle these.

Thanks.

-- 
Dmitry
