From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 11:26:27 +0200
Message-ID: <CACna6rwt=QbHrwyKqZuK6cSpXCHas26GF7XNDdvAOXYiWp8YKA@mail.gmail.com>
References: <20160823220404.9887-1-zajec5@gmail.com> <20160824092129.GA23180@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160824092129.GA23180-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Stephan Linz <linz-LlUBiLVY8XKsTnJN9+BGXg@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 24 August 2016 at 11:21, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Wed, Aug 24, 2016 at 12:03:29AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> This commit adds a new trigger responsible for turning on LED when USB
>> device gets connected to the specified USB port. This can can useful for
>> various home routers that have USB port(s) and a proper LED telling user
>> a device is connected.
>>
>> The trigger gets its documentation file but basically it just requires
>> specifying USB port in a Linux format (e.g. echo 1-1 > new_port).
>>
>> During work on this trigger there was a plan to add DT bindings for it,
>> but there wasn't an agreement on the format yet. This can be worked on
>> later, a sysfs interface is needed anyway for platforms not using DT.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>> V2: Trying to add DT support, idea postponed as it will take more time
>>     to discuss the bindings.
>> V3: Fix typos in commit and Documentation (thanks Jacek!)
>>     Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
>>     Check if there is USB device connected after adding new USB port
>>     Fix memory leak or two
>>
>> Felipe: I'd like to ask for your Ack before having this patch pushed.
>> ---
>>  Documentation/leds/ledtrig-usbport.txt |  49 +++++++
>>  drivers/leds/trigger/Kconfig           |   8 ++
>>  drivers/leds/trigger/Makefile          |   1 +
>>  drivers/leds/trigger/ledtrig-usbport.c | 253 ++++++++++++++++++++++++++=
+++++++
>>  4 files changed, 311 insertions(+)
>>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
>>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
>
> You are adding sysfs files without adding a Documentation/ABI/ entry,
> please never do that.

This is the way all LED triggers are documented, I just blindly
assumed it's OK. Could you be a bit more helpful and help me to
understand further steps? Should I drop
Documentation/leds/ledtrig-usbport.txt and add proper entry in
Documentation/ABI/testing? Or should I keep both files? What about
current sysfs of other triggers? Should they be moved/documented in
ABI?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
