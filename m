From: Kevin Locke <kevin-yFOG++GfaLUI8/NkjqMgMw@public.gmane.org>
Subject: Re: [PATCH v4 2/4] platform: x86: thinkpad: Call
 led_notify_brightness_change on kbd brightness change
Date: Fri, 11 Nov 2016 11:40:51 -0700
Message-ID: <20161111184051.xemayi634xqhkp4c@kevinolos>
References: <20161101133748.7168-1-hdegoede@redhat.com>
	<20161101133748.7168-2-hdegoede@redhat.com>
	<201611111512.36115@pali>
	<f90bd318-9f3f-62e4-be49-e03cae4eac14@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f90bd318-9f3f-62e4-be49-e03cae4eac14-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Fri, 2016-11-11 at 15:33 +0100, Hans de Goede wrote:
> On 11-11-16 15:12, Pali Roh=E1r wrote:
>> My question remains. Is this for Thinklight or keyboard backlight?
>> Because Thinklinght has led device "tpacpi_led_thinklight" and keyboard
>> backlight has led device "tpacpi_led_kbdlight".
> =

> I would say both, this matches with the pre-existing
> TP_ACPI_HKEY_THNKLGHT_MASK (they have a 1:1 mapping),
> keep in mind that there are no thinkpads with both
> a thinklight and a backlit keyboard, as those both
> serve the same purpose so it looks like the re-used
> the scancode.

That's not entirely correct.  The ThinkPad T430 has both a ThinkLight
and a keyboard backlight.  Pressing Fn-Space toggles between 4 states:

Both Off -> Backlight Low -> Backlight High -> ThinkLight On (BL Off)

I tested out your patch and observed the following behavior (printing
brightness initially and on POLLPRI):

# Initial state with both lights off.
tpacpi::kbd_backlight/brightness: 0
tpacpi::thinklight/brightness: 0
# Press Fn-Space.  KBD Backlight comes on low.
tpacpi::kbd_backlight/brightness: 1
# Press Fn-Space.  KBD Backlight brightens to high.
tpacpi::kbd_backlight/brightness: 2
# Press Fn-Space.  KBD Backlight turns off.  ThinkLight turns on.
tpacpi::kbd_backlight/brightness: 0
# Press Fn-Space.  ThinkLight turns off.
tpacpi::kbd_backlight/brightness: 0

It works, but the behavior is not quite what I would hope for.  There
are no poll events for tpacpi::thinklight/brightness and when the
ThinkLight turns off it triggers an unnecessary
tpacpi::kbd_backlight/brightness poll event.

If there is anything else I can do to assist, let me know.

Thanks for working on this,
Kevin

---------------------------------------------------------------------------=
---
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
