From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] leds: add LED driver for CR0014114 board
Date: Mon, 14 Aug 2017 09:28:06 -0500
Message-ID: <CAL_JsqJw18uCCLAd+rraiDr3meLvDkpOwLwqLLB5E5psHho2Jw@mail.gmail.com>
References: <20170814115355.9437-1-oleg@kaa.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814115355.9437-1-oleg-CGGh1czddphUq1AO9QMCaQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleh Kravchenko <oleg-CGGh1czddphUq1AO9QMCaQ@public.gmane.org>
Cc: Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Please CC DT list for bindings and make bindings a separate patch.

On Mon, Aug 14, 2017 at 6:53 AM, Oleh Kravchenko <oleg-CGGh1czddphUq1AO9QMCaQ@public.gmane.org> wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System CR0014114 LEDs board.
>
> Driver creates LED devices with name written using the following
> pattern "LABEL-{N}:{red,green,blue}:".
>
> Signed-off-by: Oleh Kravchenko <oleg-CGGh1czddphUq1AO9QMCaQ@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  23 ++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/leds/Kconfig                               |  12 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-cr0014114.c                      | 352 +++++++++++++++++++++
>  5 files changed, 389 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>  create mode 100644 drivers/leds/leds-cr0014114.c
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> new file mode 100644
> index 000000000000..6a399cb65388
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> @@ -0,0 +1,23 @@
> +Crane Merchandising System SPI LED board CR0014114
> +==================================================
> +
> +Required properties:
> +- compatible: "cms,cr0014114"
> +
> +Optional properties:
> +- label: prefix for LED names. If omitted the label is taken from the node name.

label generally is the full name, not a prefix. It kind of defeats the
point of label if the name is the same. You might as well move this
into the driver.

> +- leds-per-board: RGB leds per board, minimal value is 6
> +- num-boards: number of LED boards on SPI bus, usually 1

>From the driver, looks like you just need the total led count?

It also appears that the driver knows the color arrangement. Perhaps
you should have child nodes for each LED as the LED binding defines.
reg can have 2 cells if you need to define board# and led#. And label
can be the full label name if you keep label in the DT.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
