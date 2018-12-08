From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Well-known LED names was Re: [PATCH 0/6] Introduce
 audio-mute LED trigger (and conversions to it)
Date: Sat, 8 Dec 2018 22:59:59 +0100
Message-ID: <f8cd3214-3014-3d22-1308-1673a07f6d10@gmail.com>
References: <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali> <s5hy39dv3dg.wl-tiwai@suse.de>
 <20181128122505.GA1193@amd> <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
 <20181128203410.GA20670@amd> <20181128204612.l3bayhop4qmep2hj@pali>
 <0ed37870-c7b6-fd6b-2f6e-7325fdde3629@gmail.com> <20181128212212.GE20670@amd>
 <5f8eece3-95af-7866-d7d0-02cc3cb695ca@gmail.com> <20181201144101.GD31631@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181201144101.GD31631@amd>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 12/1/18 3:41 PM, Pavel Machek wrote:
> Hi!
> 
>>>>> If external USB keyboard is identified as "input7" device, then
>>>>> "input7::mute" is a good name for mute key. But "sys::mute" does not say
>>>>> anything to which device or hardware it belongs nor does not solve
>>>>> problem that which device/driver/subsystem should have privilege to take
>>>>> this "sys" name.
>>>>
>>>> How about just "platform" for the LEDs being part of the device
>>>> on which the system is running?
>>>
>>> "platform" works for me.
>>>
>>> Are we in agreement that this name will be used for all similar LEDs,
>>> as long as they are on the "main box" of the device, no matter if they
>>> are connected using acpi, gpio, i2c, ...?
>>
>> One doubt: say we have hdd activity LED on the "main box" - it
>> would be named "platform::disk".
>>
>> Now, we add external USB disk. Previously we were considering
>> the naming for disk LEDs in the form e.g. "sdb::disk".
>>
>> If so, there would be discrepancy between internal and external disk
>> LED names. Similarly in case of eth/adsl/wlan/camera LEDs.
> 
> Well, it really depends if the "plaform::disk" is for all the disks,
> or if it is for sda. In the second case, it might be better to name it
> sda::disk...
> 
> Anyway... I believe we should start documenting good and bad LEDs, so
> that patch authors know what is there, and can try to be consistent,
> and so that userland knows what names to probe for.

The idea looks reasonable. In addition to that, I'd change one
thing in the LED naming pattern - replace "devicename " with
"affiliation". AFAICS that would fit best for both "platform"
and e.g. "input*".

Also in the DT we would need related "affiliation" property.
In most cases it would be "platform" probably.
Possible is also "camera" - but we would have to state it clear
how to proceed in case of video devices - shouldn't v4l2
drivers create LEDs similarly to how network drivers do that.
Then it would be possible to provide videoN name.

> What about following? Any other LEDs worth mentioning?
disk: sdX
network devices: ethN, adslN

These "affiliations" would have to be provided by the
network drivers creating LED class devices.

> commit c56708addf9c312cefd760bca218a0545258b217
> Author: Pavel <pavel@ucw.cz>
> Date:   Sat Dec 1 15:32:13 2018 +0100
> 
> leds: Add list of well-known LED names
>      
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
> new file mode 100644
> index 0000000..9a262db
> --- /dev/null
> +++ b/Documentation/leds/well-known-leds.txt
> @@ -0,0 +1,42 @@
> +-*- org -*-
> +
> +It is somehow important to provide consistent interface to the
> +userland. LED devices have one problem there, and that is naming of
> +directories in /sys/class/leds. It would be nice if userland would
> +just know right "name" for given LED function, but situation got more
> +complex.
> +
> +Anyway, if backwards compatibility is not an issue, new code should
> +use one of the "good" names from this list, and you should extend the
> +list where applicable.
> +
> +Bad names are listed, too, in case you are writing application that
> +wants to use particular feature, you should probe for good name first
> +but then try the bad ones, too".
> +
> +* Keyboards
> +
> +Good: "input*:*:capslock"
> +Good: "input*:*:scrolllock"
> +Good: "input*:*:numlock"
> +
> +Set of common keyboard LEDs, going back to PC AT or so.
> +
> +Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
> +Bad: "lp5523:kb{1,2,3,4,5,6,7}" (Nokia N900)
> +
> +Keyboard frontlight/backlight.

Isn't example missing here?

> +
> +* Sound subsystem
> +
> +Good: "platform:*:mute"
> +Good: "platform:*:micmute"
> +
> +LEDs on notebook body, indicating that sound input / output is muted.
> +
> +* System notification
> +
> +Good: "status-led:{red,green,blue}" (Motorola Droid 4)

Two problems here:
- "status-led" is in place of "devicename" instead of "function"
- "-led" is obvious and non-generic - we will have "status"
   in the "functions.h"

> +Bad: "lp5523:{r,g,b}" (Nokia N900)
> +
> +Phones usually have multi-color status LED.
> 
> 
>

-- 
Best regards,
Jacek Anaszewski
