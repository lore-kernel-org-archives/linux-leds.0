From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Fri, 15 Feb 2019 00:34:53 +0300
Message-ID: <20190214213453.GA30250@jeknote.loshitsa1.net>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
 <20190213230731.GA8557@amd>
 <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
 <20190213233806.GA11867@amd>
 <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

On Thu, Feb 14, 2019 at 10:57:13AM +0100, Hans de Goede wrote:
 
> > Anyway, in such case I'd propose having rmmod/reboot/poweroff hook
> > that just sets it to breathing. No need to expose it to userspace.
> 
> That assumes that breathing is the default setting on all hardware
> and again I don't see why not to export this functionality to
> userspace. Just because something does not fit in the existing
> API is IMHO not a good reason to not expose it to userspace.
> 
> I suggest that we deal with this special case by adding 3 custom
> sysfs attributes:
> 
> 1) "mode" which when read, prints, e.g. :
> manual [on-when-charging]
> 
> With the [] indicating the current mode, and writes accepting
> all 3 values and updating the hw accordingly.
> 
> This format is used in more places in the kernel and allows
> for the user to easily discover the possible values.
> 
> 2) "pattern" which when read, prints, e.g. :
> on blinking [breathing]

Leds class API already has pattern_set()/pattern_get() callbacks
which can be used for breathing mode set/request. How this API should
deal with specific 'breathing' sysfs attribute? I like the idea about
specific 'pattern' attribute because this is very simple, anyway. 

Second issue: the 'pattern' led trigger supports default pattern initialization
by device properties only, not by hardware request. Setting breathing
parameters via 'pattern' led trigger may looks too complicated for
users, given that only one hw-supported option exists. Pattern
corresponded to hw-supported breating should contain too many
(brightness, duration) tuples with minimal stepping and has no
practical sense.


If hw-controlled 'breathing' mode is quite common case for leds
controllers, maybe it makes sense to introduce something like
'lighting mode' attribute with values 'continuous'/'breathing' without
clarification of breathing parameters? What do you think about this?

The same question about frequency of breathing setting. Blinking
frequency can be set with existing API, but not a breathing frequency.

> 
> 3) "frequency", when read prints, e.g. :
> 0.25hz [0.5hz] 1hz 2hz
> Note this controls both the blinking and breathing freq.
> 
> Note I've not listed off anywhere, this can be achieved by
> setting the brightness to 0 as we do with normal leds.
> 
> For interactions with other APIs we can do the standard
> thing where writing 0 to brightness resets things, in this
> case this would reset mode to manual and pattern to on.
> 
> And if the blinking API gets used, then too the mode should
> be switched to manual, and the pattern obviously becomes
> blinking.
> 
> I believe this will work well with this hardware and
> nicely allow the user to control all settings.
> 
> Regards,
> 
> Hans

-- 
Yauhen Kharuzhy
