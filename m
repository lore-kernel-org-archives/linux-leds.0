From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Tue, 23 May 2017 10:18:31 +0200
Message-ID: <CACRpkdYRv-ASan1ZJevWbk=+_01LU0a8DDRL_nvhC59o25c5wA@mail.gmail.com>
References: <1494311772-21872-1-git-send-email-clg@kaod.org> <20b94199-a154-53cd-96d1-910ae3de1085@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20b94199-a154-53cd-96d1-910ae3de1085-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Thu, May 11, 2017 at 10:23 PM, Jacek Anaszewski
<jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> +Optional properties:
>> +- gpio-controller: allows pins to be used as GPIOs.

Are these output-only? Then write something about that.

>> +- #gpio-cells: if present, must not be 0.

Must be present and must be <2>

>> +- gpio-base : base number of the pins used as GPIOs. If there are more
>> +              than one, they should be contiguous. See 'type' property
>> +              below.

NACK. Not in my life.

Provide -1 in the Linux driver and use the ioctl() from userspace
to look up your gpios. Add .names array to the gpiochip if necessary,
define line names in the device tree for the board.

Consult tools/gpio/* for the modern way of using GPIOs.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
