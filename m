From: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 2/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Mon, 27 Jun 2016 07:46:49 +0200
Message-ID: <51f6c4d4-e5af-97b6-e7d9-61f0093de134@heig-vd.ch>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-3-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D45.60107@samsung.com> <20160626214902.GB21026@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160626214902.GB21026@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaussard Florian <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Le 26. 06. 16 =E0 23:49, Pavel Machek a =E9crit :
> Hi!
>=20
>>> +struct ncp5623_led {
>>> +	bool active;
>>> +	unsigned int led_no;
>>> +	struct led_classdev ldev;
>>> +	struct work_struct work;
>>> +	struct ncp5623_priv *priv;
>>> +};
>>> +
>>> +struct ncp5623_priv {
>>> +	struct ncp5623_led leds[NCP5623_MAX_LEDS];
>>
>> Please allocate memory dynamically, depending on the number
>> of LEDs defined in a Device Tree.
>=20
> MAX_LEDs is three. Are you sure overhead of dynamic allocation is
> worth it?
>=20
> And if this is for RGB leds... very probably device will want to use
> all 3 channels.
>=20

I was about to raise the same question during the v2 of this patch. In =
addition
to your arguments, this also changes the way this array is indexed.

Currently the LED number is used as index, but with dynamic allocation =
I have to
use an abstract index. This makes some logic a bit harder, especially t=
o check
if the same LED is declared twice in the device tree (duplicated 'reg' =
property).

Best,
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
