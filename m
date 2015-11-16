From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: leds-bcm6328: add more init configuration options
Date: Mon, 16 Nov 2015 22:35:55 +0100
Message-ID: <564A4C3B.6090806@gmail.com>
References: <5648C090.9060904@simon.arlott.org.uk>
 <5649F040.6090002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5649F040.6090002-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Simon and Jacek,

This is done on purpose because not every BCM63268 device has serial=20
LEDs and we should be able to enable/disable those options in order to=20
avoid depending on the bootloader setting the registers correctly.

Regards,
=C3=81lvaro.

El 16/11/2015 a las 16:03, Jacek Anaszewski escribi=C3=B3:
> Hi Simon,
>
> On 11/15/2015 06:27 PM, Simon Arlott wrote:
>> commit 1d3ff22d633d35048c35c3deeead7ab116cebc32
>> Author: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Date:   Thu Oct 8 12:35:55 2015 +0200
>>
>>      Documentation: leds: update DT bindings for leds-bcm6328
>>
>>      This patch adds latest DT bindings for leds-bcm6328 init regist=
er
>>      configuration.
>>
>> commit 9f82c778ce17789a038351a411ff65cd41033c7a
>> Author: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Date:   Thu Oct 8 12:35:54 2015 +0200
>>
>>      leds-bcm6328: add more init configuration options
>>
>>      This patch adds more init register configuration options:
>>      - Serial LEDs multiplexing.
>>      - Serial LEDs clock signal low/high polarity.
>>      - Serial LEDs data signal low/high polarity.
>>      - Serial LEDs shift direction inverted/normal.
>>
>> This was not a backwards-compatible change, because the driver is no=
w
>> turning off all of the serial LED options by default when previously
>> it only turned off brcm,serial-leds and left the other options
>> unchanged.
>>
>> There are currently no in-tree users of this binding, so any existin=
g
>> users will be broken by this change.
>>
>
> Please submit a patch fixing the issue in such cases, so that we coul=
d
> discuss possible solutions to the problem.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
