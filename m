From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] leds: tpacpi: cleanup for Thinkpad
 ACPI led
Date: Mon, 6 May 2019 18:20:22 +0300
Message-ID: <CAHp75VcrW_9pyiG6N75CWkxc1S7mKknfDT_W87vSQNnzjf2uRw@mail.gmail.com>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152148.GA10501@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190429152148.GA10501@amd>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Apr 29, 2019 at 6:22 PM Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
>
>
> Make error returns more consistent... no behaviour change intended.
>

Pushed to my review and testing queue, thanks!

P.S. I fixed prefix accordingly.

> Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 726341f..7008a7f 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5808,7 +5808,7 @@ static int led_set_status(const unsigned int led,
>                         return -EPERM;
>                 if (!acpi_evalf(led_handle, NULL, NULL, "vdd",
>                                 (1 << led), led_sled_arg1[ledstatus]))
> -                       rc = -EIO;
> +                       return -EIO;
>                 break;
>         case TPACPI_LED_OLD:
>                 /* 600e/x, 770e, 770x, A21e, A2xm/p, T20-22, X20 */
> @@ -5832,10 +5832,10 @@ static int led_set_status(const unsigned int led,
>                         return -EPERM;
>                 if (!acpi_evalf(led_handle, NULL, NULL, "vdd",
>                                 led, led_led_arg1[ledstatus]))
> -                       rc = -EIO;
> +                       return -EIO;
>                 break;
>         default:
> -               rc = -ENXIO;
> +               return -ENXIO;
>         }
>
>         if (!rc)
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
With Best Regards,
Andy Shevchenko
