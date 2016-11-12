From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [ibm-acpi-devel] [PATCH v4 2/4] platform: x86: thinkpad: Call
 led_notify_brightness_change on kbd brightness change
Date: Sat, 12 Nov 2016 13:07:58 +0100
Message-ID: <fbb29ee7-9394-6b75-ebca-d19d20809581@redhat.com>
References: <20161101133748.7168-1-hdegoede@redhat.com>
 <f90bd318-9f3f-62e4-be49-e03cae4eac14@redhat.com>
 <20161111184051.xemayi634xqhkp4c@kevinolos> <201611121252.44443@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201611121252.44443@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Kevin Locke <kevin@kevinlocke.name>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Richard Purdie <rpurdie@rpsys.net>, Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

HI,

On 12-11-16 12:52, Pali Rohár wrote:
> On Friday 11 November 2016 19:40:51 Kevin Locke wrote:
>> On Fri, 2016-11-11 at 15:33 +0100, Hans de Goede wrote:
>>> On 11-11-16 15:12, Pali Rohár wrote:
>>>> My question remains. Is this for Thinklight or keyboard backlight?
>>>> Because Thinklinght has led device "tpacpi_led_thinklight" and
>>>> keyboard backlight has led device "tpacpi_led_kbdlight".
>>>
>>> I would say both, this matches with the pre-existing
>>> TP_ACPI_HKEY_THNKLGHT_MASK (they have a 1:1 mapping),
>>> keep in mind that there are no thinkpads with both
>>> a thinklight and a backlit keyboard, as those both
>>> serve the same purpose so it looks like the re-used
>>> the scancode.
>>
>> That's not entirely correct.  The ThinkPad T430 has both a ThinkLight
>> and a keyboard backlight.  Pressing Fn-Space toggles between 4
>> states:
>>
>> Both Off -> Backlight Low -> Backlight High -> ThinkLight On (BL Off)
>>
>> I tested out your patch and observed the following behavior (printing
>> brightness initially and on POLLPRI):
>>
>> # Initial state with both lights off.
>> tpacpi::kbd_backlight/brightness: 0
>> tpacpi::thinklight/brightness: 0
>> # Press Fn-Space.  KBD Backlight comes on low.
>> tpacpi::kbd_backlight/brightness: 1
>> # Press Fn-Space.  KBD Backlight brightens to high.
>> tpacpi::kbd_backlight/brightness: 2
>> # Press Fn-Space.  KBD Backlight turns off.  ThinkLight turns on.
>> tpacpi::kbd_backlight/brightness: 0
>> # Press Fn-Space.  ThinkLight turns off.
>> tpacpi::kbd_backlight/brightness: 0
>>
>> It works, but the behavior is not quite what I would hope for.  There
>> are no poll events for tpacpi::thinklight/brightness
>
> Yes, this is what I already pointed... That we should send event also
> for tpacpi::thinklight.

Agreed.

>> and when the
>> ThinkLight turns off it triggers an unnecessary
>> tpacpi::kbd_backlight/brightness poll event.
>
> It is problem? Or are forced to send event only if brightness level is
> really changed? I think that bigger problem is when brightness changes,
> but we do not send event.
>
> Should not be event treated as "hey, brightness level was probably
> changed, read file to get current status"?

That is what I was thinking too, waking up userspace poll()
waiters while nothing has changed is not 100% ideal, but
is not a big deal (esp. given the frequency with which this
will happen).

I will do a new version renaming the events / mask to indicate
that they apply to both the thinklight and the keyboard backlight;
and to also notify the thinklight led_classdev of changes
(if it is present).

Note that the led-class changes this relies on are still being
discussed, I will do a new version once that is sorted out.

>> If there is anything else I can do to assist, let me know.
>
> Great, this is really useful to see somebody who can test patches on
> those machines with both Thinklight and keyboard backlight...

+1 thank you for testing and for the feedback.

Regards,

Hans

>
