From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv3 2/2] leds: cpcap: new driver
Date: Wed, 29 Mar 2017 21:12:57 +0200
Message-ID: <b3a00d96-7eda-4f7f-62f8-364954449b6b@gmail.com>
References: <20170324084732.31255-1-sre@kernel.org>
 <20170324084732.31255-2-sre@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324084732.31255-2-sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Sebastian,

On 03/24/2017 09:47 AM, Sebastian Reichel wrote:
> Motorola CPCAP is a PMIC (power management integrated circuit) found
> in multiple smartphones. This driver adds support for the chip's LED
> controllers. This introduces support for all controllers used by the
> Droid 4. According to Motorola's driver (no datasheets available)
> there a couple of more LED controllers. I did not add support for
> them, since I cannot verify that they work with my modifications.
> 
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Changes since PATCHv1:
>  - binding: reference common led binding for label
>  - drop DEBUG define (leftover)
>  - s/led/LED/g in debug prints
>  - order includes alphabetically
>  - introduce mutex, since led API is not atomic
>  - register led class after initial register setup
>  - use GPLv2+ in header
>  - drop unsupported leds from driver
> 
> Changes since PATCHv2:
>  - use standard defines instead CPCAP_LED_OFF and CPCAP_LED_ON
> 
> Notes:
>  - The "motorola" vendor-prefix is added via rtc-next
> ---
>  .../devicetree/bindings/leds/cpcap-leds.txt        |  29 +++
>  drivers/leds/Kconfig                               |   9 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-cpcap.c                          | 239 +++++++++++++++++++++
>  4 files changed, 278 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/cpcap-leds.txt
>  create mode 100644 drivers/leds/leds-cpcap.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/cpcap-leds.txt b/Documentation/devicetree/bindings/leds/cpcap-leds.txt
> new file mode 100644
> index 000000000000..ebf7cdc7f70c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cpcap-leds.txt

I've changed cpcap-leds.txt to leds-cpcap.txt to match the prevailing
pattern for LED DT bindings file names.

Please let me know if you have any objections.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
