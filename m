From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color LED's
Date: Mon, 18 Apr 2016 11:12:34 +0200
Message-ID: <5714A502.9030201@samsung.com>
References: <20160401211844.GA21768@amd> <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd> <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd> <5704DC93.6050104@gmail.com>
 <20160407204540.GA11202@amd> <5707FCC0.6000204@gmail.com>
 <20160409160142.GD19362@xo-6d-61-c0.localdomain>
 <570CA014.7000709@samsung.com> <20160415115330.GA18196@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160415115330.GA18196@amd>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aaro.koskinen-X3B1VOXEql0@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrik Bachan <patrikbachan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 04/15/2016 01:53 PM, Pavel Machek wrote:
> Hi!
>
>>>> How about implementing patterns as a specific typer of triggers?
>>>> Let's say we have ledtrig-rgb-pattern:
>>>
>>> Well, we'd need ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, ... , as we
>>> can have more than one rgb led. But yes.
>>
>> Triggers can have many listeners, i.e. led_trigger_event() sets
>> brightness on all LED class devices registered on given trigger.
>> We could have led_trigger_rgb_event() that would set brightness
>> on all groups-of-three LEDs registered on given rgb-trigger.
>
> I do not understand that.

Triggers are defined as kernel source of led events.

Currently we have two types of triggers as far as the source of
led event is concerned:
- triggers that are created per LED class device and therefore each
   LED class device has their own source of kernel event,
   initialized on trigger activation (e.g. ledtrig-timer,
   ledtrig-heartbeat, ledtrig-oneshot),
- triggers that propagate kernel events from one source to many
   listeners (e.g.ledtrig-ide-disk, ledtrig-cpu) - they internally
   use led_trigger_event(), which iterates through all LED class devices
   registered on a trigger and applies the same brightness.

In case of RGB trigger we'd like to have a common source of kernel
events for three LED class devices. After deeper analysis I'd modify
the approach a bit, in order to add a capability of generating kernel
led events from user space.

Let's say that we have LED RGB driver that exposes three LED class
devices: lp5523:red, lp5523:green, lp5523 blue.

$echo "rgb-pattern-lp5523" > /sys/class/leds/lp5523::red/trigger
$echo "red" > /sys/class/leds/lp5523::red/rgb_color
$echo "rgb-pattern-lp5523" > /sys/class/leds/lp5523::green/trigger
$echo "green" > /sys/class/leds/lp5523::green/rgb_color
$echo "rgb-pattern-lp5523" > /sys/class/leds/lp5523::blue/trigger
$echo "blue" > /sys/class/leds/lp5523::blue/rgb_color

led-rgb-pattern trigger would create a new trigger each time a non
existing rgp-pattern-* suffix is passed. In order to make it possible
for the user space to generate trigger events, a dedicated sysfs
interface would have to be exposed. How about creating a new LED RGB
class device that would expose "color" sysfs attribute with three space
separated R G B values? The device would appear in the sysfs after
rgb-pattern trigger is created.

Internally the LED RGB class device would use a new
led_trigger_rgb_event() to set the color:


void led_trigger_rgb_event(struct led_trigger *trig,
             enum led_brightness red,
             enum led_brightness green,
             enum led_brightness blue,
{
         struct led_classdev *led_cdev;

         if (!trig)
             return;

         read_lock(&trig->leddev_list_lock);
         list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
                if (led_cdev>flags & LED_RGB_COLOR_R)
                    led_set_brightness(led_cdev, red);
                else if (led_cdev>flags & LED_RGB_COLOR_G)
                        led_set_brightness(led_cdev, green);
                else if (led_cdev>flags & LED_RGB_COLOR_B)
                        led_set_brightness(led_cdev, blue);
         read_unlock(&trig->leddev_list_lock);
}



>
>> I agree that ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, etc. would
>> be also needed to add a capability of setting different colors on
>> different LED devices.
>
> Ok.
>
>>> For patterns, I'd suggest array of (r g b time) values.
>>>
>>> Pattern engines can do stuff like "slowly turn LED from off to red, then switch color to
>>> white, then slowly turn it to yellow, then turn it off at once" with defined speeds
>>> for "slowly" and option of either linear on non-linear brightness ramping.
>>>
>>> The last option might be a bit too much, but I believe we should support the rest.
>>
>> Yes, that's an interesting idea. It also turns out that trigger based
>> patterns could be also used for defining generic patterns for a group
>> of monochrome LEDs.
>
> Yes, controlling monochrome LEDs synchronously is another task for
> patterns. Actually, N900 uses that to control 6 keyboard backlight
> LEDs synchronously... and yes, it would be somehow nice to preserve
> this functionality.


-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
