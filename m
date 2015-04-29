From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/2] BCM6328 LED driver
Date: Tue, 28 Apr 2015 17:46:12 -0700
Message-ID: <CAK5ve-JHffs9Dbq_C5SVFo7dyWpBwb9gSvVFjnPG6mpK9XF0sw@mail.gmail.com>
References: <1430050517-8045-1-git-send-email-noltari@gmail.com> <1430239850-26120-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430239850-26120-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Apr 28, 2015 at 9:50 AM, =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> These patches add support and documentation for the BCM6328 LED drive=
r, which is present on BCM6318, BCM6328, BCM6362 and BCM63268.
> In these SoCs it's possible to control LEDs both as GPIOs or by hardw=
are.
> However, on some devices there are Serial LEDs (LEDs connected to a 7=
4hc controller), which can either be controlled by software (exporting =
the 74hc as spi-gpio) or hardware using this driver.
> The problem is some of these serial LEDs are hardware controlled (eth=
ernet LEDs) and exporting the 74hc as spi-gpio prevents those LEDs to b=
e hardware controlled, so the only chance to keep them working is by us=
ing this driver.
>
> v4->v5: Introduce changes suggested by Jacek.
> v3->v4: Introduce changes suggested by Jacek.
> v2->v3: Introduce changes suggested by Jacek.
> v1->v2: Introduce changes suggested by Florian and Jonas.
>

Applied to my tree, thanks.
-Bryan

> =C3=81lvaro Fern=C3=A1ndez Rojas (2):
>   leds: add DT binding for BCM6328 LED controller
>   leds: add BCM6328 LED driver
>
>  .../devicetree/bindings/leds/leds-bcm6328.txt      | 309 +++++++++++=
++++
>  drivers/leds/Kconfig                               |   8 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-bcm6328.c                        | 413 +++++++++++=
++++++++++
>  4 files changed, 731 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63=
28.txt
>  create mode 100644 drivers/leds/leds-bcm6328.c
>
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
