From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 6+/6] platform/x86: dell-wmi-led: fix coding style issues
Date: Wed, 18 Jan 2017 21:06:00 +0200
Message-ID: <CAHp75Vc3LnFGPjMt8uYQeqHWPqMM-rFzsdLA94C5bJQgq++K6w@mail.gmail.com>
References: <20170116132204.6421-1-kernel@kempniu.pl> <20170117071714.21594-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170117071714.21594-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Jan 17, 2017 at 9:17 AM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempn=
iu.pl> wrote:
> Fix coding style issues in dell-wmi-led which checkpatch complains about
> to make sure the module gets a clean start in the x86 platform driver
> subsystem.

> +       status =3D wmi_evaluate_method(DELL_LED_BIOS_GUID, 1, 1, &input, =
&output);
>

You may remove extra line.

>         if (ACPI_FAILURE(status))
>                 return status;

> -       if (0 =3D=3D on_eighths)
> +       if (on_eighths =3D=3D 0)
>                 on_eighths =3D 1;
>         if (on_eighths > 255)
>                 on_eighths =3D 255;

> -       if (0 =3D=3D off_eighths)
> +       if (off_eighths =3D=3D 0)
>                 off_eighths =3D 1;
>         if (off_eighths > 255)
>                 off_eighths =3D 255;

Obviously they both are custom clamp{_t}().

--=20
With Best Regards,
Andy Shevchenko
