From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 4 Mar 2016 11:13:22 -0800
Message-ID: <20160304191322.GA17145@dtor-ws>
References: <20160303234646.GA17641@dtor-ws>
 <1457080729.18482.6.camel@gmail.com>
 <56D957A0.7070300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56D957A0.7070300@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Evan McClain <aeroevan@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 04, 2016 at 10:38:40AM +0100, Jacek Anaszewski wrote:
> Hi Evan,
> 
> On 03/04/2016 09:38 AM, Evan McClain wrote:
> >On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
> >>From: Simon Que <sque@chromium.org>
> >>
> >>This is a driver for ACPI-based keyboard backlight LEDs found on
> >>Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> >>backlight as "chromeos::kbd_backlight" LED class device in sysfs.
> >
> >Was it ever decided where this driver should live? I was planning on
> >submitting to platform/chrome since most keyboard backlights seem to
> >live over there but I don't think I got a response.
> >
> 
> It hasn't been decided yet. I can take it, but could you submit one more
> version, without
> 
> 'owner	= THIS_MODULE' in struct platform_driver keyboard_led_driver ?
> 
> It is redundant, because the core will do it.
> 
> Also the line with devm_kzalloc has over 80 characters.

Also:

- preferably use sizeof(*cdev) instead of sizeof(struct ...)
- do not check cdev->flags & LED_SUSPENDED in
  keyboard_led_set_brightness() as it is not going to be called when led
  device is suspended anyway
- change the MODULE_LICENSE from "GPL v2" to "GPL" as to match the
  actual license notice
- report ACPI errors in error messages (since we clobber them)
- preferably use ENXIO instead of ENODEV
- maybe add "depends on CHROME_PLATFORMS || COMPILE_TEST" so that we do
  not prompt for it on non-Chrome platforms

Thanks.

-- 
Dmitry
