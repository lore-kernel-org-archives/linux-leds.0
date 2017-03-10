From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: BCM53573: Don't use nonexistent
 "default-off" LED trigger
Date: Fri, 10 Mar 2017 09:44:42 -0800
Message-ID: <3414f628-6b78-dc5a-4abf-ec5f40e7a4ee@gmail.com>
References: <20170308064105.26619-1-zajec5@gmail.com>
 <42bce8ea-f1dc-2018-33f1-d296ccd7b677@gmail.com> <20170310132049.GC11875@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310132049.GC11875@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 03/10/2017 05:20 AM, Pavel Machek wrote:
> On Wed 2017-03-08 09:31:44, Florian Fainelli wrote:
>> On 03/07/2017 10:41 PM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>
>>> Such a trigger doesn't exist in Linux and is not needed as LED is being
>>> turned off by default. This could cause errors in LEDs core code when
>>> trying to set default trigger.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> Since you are fixing something, what's the proper Fixes: tag for this
>> commit? Likewise for the second patch.
> 
> Lets not make submitting patches any harder than it already is.

If it was fixing something that was already in Linus' tree, it's
important to know so I can queue the patch for the appropriate pull
request targeting e.g: v4.11-rcX, this is not needed here as Rafal later
indicated.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
