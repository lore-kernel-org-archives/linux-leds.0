From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/2] Intel Cherry Trail Whiskey Cove LEDs support
Date: Sun, 21 Apr 2019 21:28:42 +0200
Message-ID: <21337ca0-bb91-9ca9-117b-89c47c6b2ade@redhat.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212205901.13037-1-jekhor@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Yauhen,

On 12-02-19 21:58, Yauhen Kharuzhy wrote:
> This patch series introduces new driver for controlling LEDs connected
> to Intel Cherry Trail Whiskey Cove PMIC (general-purpose LED and charger
> status led). Only simple 'always on' and blinking modes are supported
> for now, no breathing.
> 
> Driver was tested only with Lenovo Yoga Book notebook, and I don't have
> any documentation for the PMIC, so proposals and testing are welcome.
> 
> v2:
>    - Fix comments and code style
>    - Add mutex to protect led state
>    - Add defaults triggers
>    - Fix module license declaration
> 
> Yauhen Kharuzhy (2):
>    leds: Add Intel Cherry Trail Whiskey Cove PMIC LEDs
>    mfd: Add leds MFD cell for intel_soc_pmic_chtwc

I had a discussion with Jacek Anaszewski about this in another thread and
I believe we have come up with a solution for this which should work
nicely and should allow us to move forward with your driver (after
it is reworked to match the solution. So the solution we've come up with is:

1) After thinking a bit more about the primary use-case for this, I've come
to the conclusion that putting LED1 / the charging LED in software-controlled
mode is also the correct thing to do on the GPD win / pocket. The reason for
this is that ideally the LED would glow while charging and be simply solid
on when the battery is full, the hw control does not allow this, so the GPD
win/pocket can benefit from sw-control too.

2) To allow the desired behavior we need to define a new
"<supply-name>-charging-glow-full-solid" trigger in
drivers/power/supply/power_supply_leds.c; and this must be the default
trigger for the Intel Cherry Trail Whiskey Cove LED driver so that
everything will just work. Also we must restore the original hw control
setting on reboot/shut-down so that this is used on the GPD win/pocket when
Linux is not running.

3) To be able to actually implement this new trigger we first need 2 things
in the kernel internal LED APIs:

3a) An API for triggers to put the LED in glowing mode, we've come up
with the following prototype for this:

void led_trigger_glow(struct led_trigger *trigger, unsigned long *cylce_time);

Where cycle_time is the number of milliseconds for a full glow cycle (from off
to full-on to off again).  So if cylce_time is set to 1000 then the LED glows
at 1 Hz, 500, 2 HZ, etc. Note as with led_trigger_blink() the time passed to
led_trigger_glow is passed by reference as the LED driver may round it to
match what the hardware can do and the rounded value is returned to the caller
through the reference.

3b) 3a) in turn will require adding a new optional glow_set callback to
struct led_classdev which will then get called by led_trigger_glow if available.

We've not discussed yet what to do if led_trigger_glow gets called on
a led_classdev which does not implement the new glow_set callback, I guess
the most sensible thing to do then is to fallback to blinking with delay_on
and delay_off set to cylce_time / 2.

If you can make some time to work on this solution that would be great. Please
let me know if you've any questions about the solution outlined below.

Note that glowing is only exported as in kernel functionality, I see no
use-case for exporting this to userspace and keeping this in kernel allows
us to keep things nice and simple.

Regards,

Hans
