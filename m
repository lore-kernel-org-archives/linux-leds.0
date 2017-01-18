From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 6/6] dell-led: move driver to drivers/platform/x86/dell-wmi-led.c
Date: Wed, 18 Jan 2017 21:08:14 +0200
Message-ID: <CAHp75Vd2tNqfOVphoLx7RPekV0zGr6ULU=jigX3kD8Y6ENxCjw@mail.gmail.com>
References: <20170116132204.6421-1-kernel@kempniu.pl> <20170116132204.6421-7-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170116132204.6421-7-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Jan 16, 2017 at 3:22 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempn=
iu.pl> wrote:
> The dell-led driver handles a specific WMI GUID present on some Dell
> laptops and as such it belongs in the x86 platform driver subsystem.
> Source code is moved along with the relevant Kconfig and Makefile
> entries, with some minor modifications:
>
>   - Kconfig option is renamed from CONFIG_LEDS_DELL_NETBOOKS to
>     CONFIG_DELL_WMI_LED,
>
>   - the X86 Kconfig dependency is removed as the whole
>     drivers/platform/x86 menu depends on it, so there is no need to
>     duplicate it,
>
>   - the name of the module's source file is removed from the header
>     comment to avoid the need to update it in the future.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
>  drivers/leds/Kconfig                                     | 8 --------
>  drivers/leds/Makefile                                    | 1 -
>  drivers/platform/x86/Kconfig                             | 8 ++++++++
>  drivers/platform/x86/Makefile                            | 1 +
>  drivers/{leds/dell-led.c =3D> platform/x86/dell-wmi-led.c} | 2 --
>  5 files changed, 9 insertions(+), 11 deletions(-)
>  rename drivers/{leds/dell-led.c =3D> platform/x86/dell-wmi-led.c} (99%)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f29b8698ca88..5af3fb2f52e4 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -454,14 +454,6 @@ config LEDS_ADP5520
>           To compile this driver as a module, choose M here: the module w=
ill
>           be called leds-adp5520.
>
> -config LEDS_DELL_NETBOOKS
> -       tristate "External LED on Dell Business Netbooks"
> -       depends on LEDS_CLASS
> -       depends on X86 && ACPI_WMI
> -       help
> -         This adds support for the Latitude 2100 and similar
> -         notebooks that have an external LED.
> -
>  config LEDS_MC13783
>         tristate "LED Support for MC13XXX PMIC"
>         depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 6b8273736478..558d24675454 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -52,7 +52,6 @@ obj-$(CONFIG_LEDS_REGULATOR)          +=3D leds-regulat=
or.o
>  obj-$(CONFIG_LEDS_INTEL_SS4200)                +=3D leds-ss4200.o
>  obj-$(CONFIG_LEDS_LT3593)              +=3D leds-lt3593.o
>  obj-$(CONFIG_LEDS_ADP5520)             +=3D leds-adp5520.o
> -obj-$(CONFIG_LEDS_DELL_NETBOOKS)       +=3D dell-led.o
>  obj-$(CONFIG_LEDS_MC13783)             +=3D leds-mc13783.o
>  obj-$(CONFIG_LEDS_NS2)                 +=3D leds-ns2.o
>  obj-$(CONFIG_LEDS_NETXBIG)             +=3D leds-netxbig.o
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 81b8dcca8891..f9018e8c1e49 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -143,6 +143,14 @@ config DELL_WMI_AIO
>           To compile this driver as a module, choose M here: the module w=
ill
>           be called dell-wmi-aio.
>
> +config DELL_WMI_LED
> +       tristate "External LED on Dell Business Netbooks"
> +       depends on LEDS_CLASS
> +       depends on ACPI_WMI
> +       help
> +         This adds support for the Latitude 2100 and similar
> +         notebooks that have an external LED.
> +
>  config DELL_SMO8800
>         tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
>         depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 2efa86d2a1a7..b061817ecaf1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_DELL_SMBIOS)     +=3D dell-smbios.o
>  obj-$(CONFIG_DELL_LAPTOP)      +=3D dell-laptop.o
>  obj-$(CONFIG_DELL_WMI)         +=3D dell-wmi.o
>  obj-$(CONFIG_DELL_WMI_AIO)     +=3D dell-wmi-aio.o
> +obj-$(CONFIG_DELL_WMI_LED)     +=3D dell-wmi-led.o
>  obj-$(CONFIG_DELL_SMO8800)     +=3D dell-smo8800.o
>  obj-$(CONFIG_DELL_RBTN)                +=3D dell-rbtn.o
>  obj-$(CONFIG_ACER_WMI)         +=3D acer-wmi.o
> diff --git a/drivers/leds/dell-led.c b/drivers/platform/x86/dell-wmi-led.=
c
> similarity index 99%
> rename from drivers/leds/dell-led.c
> rename to drivers/platform/x86/dell-wmi-led.c
> index e5c57389efd6..d0232c7f1909 100644
> --- a/drivers/leds/dell-led.c
> +++ b/drivers/platform/x86/dell-wmi-led.c
> @@ -1,6 +1,4 @@
>  /*
> - * dell_led.c - Dell LED Driver
> - *
>   * Copyright (C) 2010 Dell Inc.
>   * Louis Davis <louis_davis@dell.com>
>   * Jim Dailey <jim_dailey@dell.com>
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko
